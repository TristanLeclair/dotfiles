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
}

require("jdtls").start_or_attach(config)
