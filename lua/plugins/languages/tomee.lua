-- lua/plugins/languages/tomee.lua

return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local config = {
        cmd = {
          'java',
          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.protocol=true',
          '-Dlog.level=ALL',
          '-Xms1g',
          '--add-modules=ALL-SYSTEM',
          '--add-opens', 'java.base/java.util=ALL-UNNAMED',
          '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
          '-jar', vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
          '-configuration', vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/config_linux'),
          '-data', vim.fn.expand('~/workspace')
        },
        
        root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
        
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-17",
                  path = vim.fn.expand("$JAVA_HOME"),
                }
              }
            },
            format = {
              settings = {
                url = vim.fn.expand("~/.config/nvim/eclipse-java-google-style.xml"),
                profile = "GoogleStyle"
              }
            }
          }
        },
        
        init_options = {
          bundles = {}
        },
        
        on_attach = function(client, bufnr)
          -- Configuração do DAP
          require('jdtls').setup_dap({ hotcodereplace = 'auto' })
          require('jdtls.dap').setup_dap_main_class_configs()
          
          -- Atalhos para depuração
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end
          
          map('n', '<leader>dbc', "<cmd>lua require('jdtls').test_class()<CR>", "Debug test class")
          map('n', '<leader>dbm', "<cmd>lua require('jdtls').test_nearest_method()<CR>", "Debug nearest method")
          map('n', '<leader>dbl', "<cmd>lua require('jdtls.dap').setup_dap_main_class_configs()<CR>", "Debug main class")
          map('n', '<leader>dbt', "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint")
          map('n', '<leader>dbc', "<cmd>lua require('dap').continue()<CR>", "Continue debug")
          map('n', '<leader>dbs', "<cmd>lua require('dap').step_over()<CR>", "Step over")
          map('n', '<leader>dbi', "<cmd>lua require('dap').step_into()<CR>", "Step into")
          
          -- Atalhos específicos para TomEE
          map('n', '<leader>tcd', "<cmd>lua require('tomee').deploy()<CR>", "Deploy to TomEE")
          map('n', '<leader>tcr', "<cmd>lua require('tomee').redeploy()<CR>", "Redeploy to TomEE")
        end
      }
      
      require('jdtls').start_or_attach(config)
      
      -- Configuração adicional para projetos Java EE
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.java",
        callback = function()
          if vim.fn.filereadable("pom.xml") == 1 then
            vim.cmd("silent !mvn compile")
          end
        end
      })
    end
  },
  {
    "miguel-santana/vim-tomee",
    ft = {"java", "xml"},
    config = function()
      -- Configurações específicas para TomEE
      vim.g.tomee_path = vim.fn.expand("~/tomee")
      vim.g.tomee_autodeploy = 1
      
      -- Funções customizadas para TomEE
      local function tomee_deploy()
        if vim.fn.filereadable("pom.xml") == 1 then
          vim.cmd("!mvn clean package")
          vim.cmd("!cp target/*.war " .. vim.g.tomee_path .. "/webapps/")
          vim.notify("Application deployed to TomEE", vim.log.levels.INFO)
        else
          vim.notify("pom.xml not found!", vim.log.levels.ERROR)
        end
      end
      
      local function tomee_redeploy()
        if vim.fn.filereadable("pom.xml") == 1 then
          vim.cmd("!mvn clean package")
          vim.cmd("!cp target/*.war " .. vim.g.tomee_path .. "/webapps/")
          vim.notify("Application redeployed to TomEE", vim.log.levels.INFO)
        else
          vim.notify("pom.xml not found!", vim.log.levels.ERROR)
        end
      end
      
      -- Registrar funções como módulo Lua
      local M = {}
      function M.deploy() tomee_deploy() end
      function M.redeploy() tomee_redeploy() end
      _G.tomee = M
      
      -- Atalhos para gerenciamento do TomEE
      vim.api.nvim_set_keymap('n', '<leader>tes', ':TomeeStart<CR>', {noremap = true, silent = true, desc = "Start TomEE"})
      vim.api.nvim_set_keymap('n', '<leader>tet', ':TomeeStop<CR>', {noremap = true, silent = true, desc = "Stop TomEE"})
      vim.api.nvim_set_keymap('n', '<leader>ter', ':TomeeRestart<CR>', {noremap = true, silent = true, desc = "Restart TomEE"})
      
      -- Configuração adicional para arquivos Java e XML
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {"java", "xml"},
        callback = function()
          vim.bo.tabstop = 4
          vim.bo.shiftwidth = 4
          vim.bo.expandtab = true
        end
      })
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require('dap').adapters.java = function(callback)
        callback({
          type = 'server',
          host = '127.0.0.1',
          port = 5005
        })
      end
      
      require('dap').configurations.java = {
        {
          type = 'java',
          request = 'attach',
          name = "Attach to TomEE",
          hostName = '127.0.0.1',
          port = 5005,
          projectRoot = vim.fn.getcwd(),
          sourcePaths = {
            vim.fn.getcwd() .. '/src/main/java',
            vim.fn.getcwd() .. '/src/main/resources'
          }
        },
        {
          type = 'java',
          request = 'launch',
          name = "Debug JUnit Test",
          mainClass = "org.junit.platform.console.ConsoleLauncher",
          args = {
            "--class-path",
            "${classpath}",
            "--scan-class-path"
          },
          projectRoot = vim.fn.getcwd()
        }
      }
      
      -- Configuração de UI para depuração
      require('dapui').setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        }
      })
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
    config = true
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap"
    },
    config = function()
      require('telescope').load_extension('dap')
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true
  }
}
