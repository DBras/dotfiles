require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
	['core.defaults'] = {}, -- Load all the default modules
	['core.qol.toc'] = {
	  config = {
	    close_after_use = true
	  }
	},
	['core.concealer'] = {}, -- Allows for use of icons
	['core.dirman'] = { -- Manage your directories with Neorg
	  config = {
		workspaces = {
		  neorg = '~/Documents/neorg',
		  dtu = '~/Dropbox/DTU/neorg',
		  gollum = '~/Documents/gollum-wiki/wikinorg'
		},
		default_workspace = 'dtu'
	  }
	},
	['core.export'] = {},
	['core.summary'] = {},
	['core.completion'] = {
		config = {
			engine = 'nvim-cmp'
		}
	},
  },
}
