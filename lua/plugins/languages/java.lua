return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local config = {
        cmd = {'java', '-Declipse.application=org.eclipse.jdt.ls.core.id1', 
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
               '-data', vim.fn.expand('~/workspace')},
        
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
            }
          }
        },
        
        init_options = {
          bundles = {}
        },
        
        -- Configuração de depuração (DAP) integrada
        on_attach = function(client, bufnr)
          -- Configuração do DAP
          require('jdtls').setup_dap({ hotcodereplace = 'auto' })
          require('jdtls.dap').setup_dap_main_class_configs()
          
          -- Atalhos para depuração
          vim.keymap.set('n', '<leader>dbc', "<cmd>lua require('jdtls').test_class()<CR>", { buffer = bufnr, desc = "Debug test class" })
          vim.keymap.set('n', '<leader>dbm', "<cmd>lua require('jdtls').test_nearest_method()<CR>", { buffer = bufnr, desc = "Debug nearest method" })
          vim.keymap.set('n', '<leader>dbl', "<cmd>lua require('jdtls.dap').setup_dap_main_class_configs()<CR>", { buffer = bufnr, desc = "Debug main class" })
          
          -- Atalhos adicionais úteis para depuração
          vim.keymap.set('n', '<leader>dbt', "<cmd>lua require('dap').toggle_breakpoint()<CR>", { buffer = bufnr, desc = "Toggle breakpoint" })
          vim.keymap.set('n', '<leader>dbc', "<cmd>lua require('dap').continue()<CR>", { buffer = bufnr, desc = "Continue debug" })
          vim.keymap.set('n', '<leader>dbs', "<cmd>lua require('dap').step_over()<CR>", { buffer = bufnr, desc = "Step over" })
        end
      }
      
      require('jdtls').start_or_attach(config)
    end
  },
  {
    "miguel-santana/vim-tomee",
    ft = "java",
    config = function()
      -- Configurações específicas para TomEE
      vim.g.tomee_path = vim.fn.expand("~/tomee")
      
      -- Atalhos para gerenciamento do TomEE
      vim.api.nvim_set_keymap('n', '<leader>tes', ':TomeeStart<CR>', {noremap = true, silent = true, desc = "Start TomEE"})
      vim.api.nvim_set_keymap('n', '<leader>tet', ':TomeeStop<CR>', {noremap = true, silent = true, desc = "Stop TomEE"})
      vim.api.nvim_set_keymap('n', '<leader>ter', ':TomeeRestart<CR>', {noremap = true, silent = true, desc = "Restart TomEE"})
      vim.api.nvim_set_keymap('n', '<leader>ted', ':TomeeDeploy<CR>', {noremap = true, silent = true, desc = "Deploy to TomEE"})
      
      -- Configuração adicional para TomEE
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          vim.bo.tabstop = 4
          vim.bo.shiftwidth = 4
          vim.bo.expandtab = true
        end
      })
    end
  },
  -- Plugin adicional para depuração
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
        }
      }
    end
  }
}
