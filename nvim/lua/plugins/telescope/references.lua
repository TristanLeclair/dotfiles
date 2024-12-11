local telescope_builtin = require("telescope.builtin")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")

local M = {}

--- Simple heuristic to classify references as "Read" or "Write"
--- Looks for assignment ("=") in the line to classify as write.
local function infer_mode(bufnr, lnum)
  local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]
  if not line then
    return "unknown"
  end

  if line:find("=") then
    return "write"
  else
    return "read"
  end
end

--- Filter references based on mode
--- @param mode string: The type of references to filter ("Read" or "Write")
function M.filter_references_by_mode(mode)
  -- Validate input
  if mode ~= "read" and mode ~= "write" then
    error("Invalid mode: must be 'read' or 'write'.")
  end

  vim.lsp.buf.references(nil, {
    includeDeclaration = false,
    on_list = function(ref_list)
      if not ref_list.items then
        vim.notify("No references found.", vim.log.levels.WARN)
        return
      end

      local filtered_refs = {}
      for _, ref in ipairs(ref_list.items) do
        print(ref.bufnr) -- DOESNT SEEM TO BE A NUMBER, NEED TO FIGURE OUT HOW TO DEBUG AND SEE WHATS INSIDE `ref`
        local inferred_mode = infer_mode(ref.bufnr, ref.lnum)
        if inferred_mode == mode then
          table.insert(filtered_refs, ref)
        end

        -- -- Request semantic tokens for the current buffer
        -- local params = { textDocument = vim.lsp.util.make_text_document_params() }
        -- vim.lsp.buf_request(bufnr, "textDocument/semanticTokens/full", params, function(_, result)
        --   if not result or not result.data then
        --     return
        --   end
        --
        --   -- Process semantic tokens to infer read/write
        --   for i = 1, #result.data, 5 do
        --     local token_type = result.data[i + 3] -- Token type index
        --     local inferred_mode = (token_type == 1 and "write") or (token_type == 0 and "read")
        --     if inferred_mode == mode then
        --       table.insert(filtered_refs, ref)
        --     end
        --   end
        -- end)
        --
        --
        -- local kind = ref.kind or 0
        -- if (mode == "read" and kind == 1) or (mode == "write" and kind == 2) then
        --   table.insert(filtered_refs, ref)
        -- end
        -- print(kind, ref)
      end

      if #filtered_refs == 0 then
        vim.notify("No " .. mode .. " references found.", vim.log.levels.INFO)
        return
      end

      pickers
        .new({}, {
          prompt_title = "Filtered References (" .. mode .. ")",
          finder = finders.new_table({
            results = filtered_refs,
            entry_maker = function(entry)
              local uri = vim.uri_from_bufnr(entry.bufnr)
              local filename = vim.uri_to_fname(uri)
              return {
                value = entry,
                display = filename .. ":" .. entry.range.start.line + 1,
                ordinal = filename,
                path = filename,
                lnum = entry.range.start.line + 1,
                col = entry.range.start.character + 1,
              }
            end,
          }),
          sorter = sorters.get_generic_fuzzy_sorter(),
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              require("telescope.actions").close(prompt_bufnr)
              vim.api.nvim_win_set_cursor(0, { selection.lnum, selection.col - 1 })
              vim.cmd("edit " .. selection.path)
            end)
            return true
          end,
        })
        :find()
    end,
  })
end

function M.setup()
  Set_keymap("n", "<leader>fgrr", function()
    M.filter_references_by_mode("read")
  end, "Find Read References")
  Set_keymap("n", "<leader>fgrw", function()
    M.filter_references_by_mode("write")
  end, "Find Write References")
end

return M
