
------------------------------------------------------------------------
-- Configuration for mini.nvim, a collection of small plugins ----------
-- https://github.com/echasnovski/mini.nvim ----------------------------
------------------------------------------------------------------------

require('mini.align').setup()
require('mini.ai').setup()
require('mini.bracketed').setup()
require('mini.comment').setup()
require('mini.map').setup()
require('mini.pairs').setup()
require('mini.sessions').setup()
require('mini.splitjoin').setup()
require('mini.starter').setup()
require('mini.surround').setup()

-- require('mini.animate').setup()
-- require('mini.base16').setup()
-- require('mini.basics').setup()
-- require('mini.bufremove').setup()
-- require('mini.colors').setup()
-- require('mini.completion').setup()
-- require('mini.cursorword').setup()
-- require('mini.doc').setup()
-- require('mini.fuzzy').setup()
-- require('mini.hues').setup()
-- require('mini.indentscope').setup()
-- require('mini.jump').setup()
-- require('mini.jump2d').setup()
-- require('mini.misc').setup()
-- require('mini.move').setup()
-- require('mini.statusline').setup()
-- require('mini.tabline').setup()
-- require('mini.test').setup()
-- require('mini.trailspace').setup()


------------------------------------------------------------------------
-- Helper functions for session saving and deleting --------------------
------------------------------------------------------------------------

MiniSessionsHelper = {}
function MiniSessionsHelper.save()
	vim.ui.input({
		prompt = 'Session name: '
	}, function(input)
		if input then
			if input ~= '' then
				MiniSessions.write(input)
			else 
				MiniSessions.write('Session.vim')
			end
		end
	end)
end
function MiniSessionsHelper.delete()
	vim.ui.input({
		prompt = 'Session name: '
	}, function(input)
		if input then
			if input ~= '' then
				MiniSessions.delete(input)
			else 
				MiniSessions.delete('Session.vim')
			end
		end
	end)
end

