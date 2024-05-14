local mason_root = vim.fn.stdpath("data") .. "/mason/packages/"

-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
  vim.fn.glob(mason_root .. "java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
}

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_root .. "java-test/extension/server/*.jar"), "\n"))

local config = {
  cmd = {
    vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"),
    "--jvm-arg="
      .. string.format("-javaagent:%s", vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar")),
  },
  root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    url = "~/.local/share/eclipse/eclipse-java-google-style.xml",
    profile = "GoogleStyle",
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  },
  init_options = {
    bundles = bundles,
  },
}

require("jdtls").start_or_attach(config)

Set_keymap("n", "<leader>uc", function()
  require("jdtls").test_class()
end, "Test class")
Set_keymap("n", "<leader>un", function()
  require("jdtls").test_nearest_method()
end, "Test nearest method")
