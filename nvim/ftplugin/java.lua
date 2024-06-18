local jdtls = require("jdtls")

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
  root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1]),
  settings = {
    java = {
      home = "/usr/lib/jvm/java-21-openjdk-amd64",
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          { name = "JavaSE-21", path = "/usr/lib/jvm/java-21-openjdk-amd64" },
          { name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk-amd64" },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      references = { includeDecompiledSources = true },
      signatureHelp = { enabled = true },
      format = {
        enabled = true,
        settings = {
          url = "~/.local/share/eclipse/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
    },
    -- capabilities = {
    --   textDocument = {
    --     completion = {
    --       completionItem = {
    --         snippetSupport = true,
    --       },
    --     },
    --   },
    -- },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),

    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org",
      },
    },

    extendedClientCapabilities = jdtls.extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },

    flags = {
      allow_incremental_sync = true,
    },
    init_options = {
      bundles = bundles,
    },
  },
}

-- Needed for debugging
config["on_attach"] = function(_, _)
  jdtls.setup_dap({ hotcodereplace = "auto" })
  require("jdtls.dap").setup_dap_main_class_configs()
end

jdtls.start_or_attach(config)

Set_keymap("n", "<leader>uc", function()
  require("jdtls").test_class()
end, "Test class")
Set_keymap("n", "<leader>un", function()
  require("jdtls").test_nearest_method()
end, "Test nearest method")
