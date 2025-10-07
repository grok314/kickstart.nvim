return {
  'Rics-Dev/project-explorer.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    paths = {
      '~/dev/*',
      '~/AppData/Roaming/pico-8/carts',
    }, --custom path set by user
    -- custom find command set by the user. Default should always work on unix unless user has heavily modified tools and/or PATH
    -- for Windows Users: installing `fd` is recommended with the equivalent `fd` command
    -- "fd . %s -td --min-depth %d --max-depth %d"
    command_pattern = 'fd . %s -td --min-depth %d --max-depth %d',
    newProjectPath = '~/dev/', --custom path for new projects
    file_explorer = function(dir) --custom file explorer set by user
      -- put call to Neotree open in current dir
      require('neo-tree.command').execute {
        action = 'show',
        position = 'left',
        dir = dir,
      }
    end,
    -- Or for oil.nvim:
    -- file_explorer = function(dir)
    --   require("oil").open(dir)
    -- end,
  },
  config = function(_, opts)
    require('project_explorer').setup(opts)
  end,
  keys = {
    { '<leader>px', '<cmd>ProjectExplorer<cr>', desc = 'Open Project Explorer' },
  },
  lazy = false,
}
