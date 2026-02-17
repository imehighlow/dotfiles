local servers = {
	"lua_ls",
	"ts_ls",
	"svelte",
	"rust_analyzer",
	"taplo",
	"clangd",
	"pyright",
}

servers.configs = {
	pyright = {
		settings = {
			python = {
				pythonPath = vim.env.VIRTUAL_ENV and (vim.env.VIRTUAL_ENV .. "/bin/python")
					or vim.fn.exepath("python3"),
			},
		},
	},
}

return servers
