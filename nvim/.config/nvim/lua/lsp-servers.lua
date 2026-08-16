local servers = {
	"lua_ls",
	"ts_ls",
	"svelte",
	"rust_analyzer",
	"taplo",
	"cmake",
	"clangd",
	"pyright",
}

servers.configs = {
	cmake = {
		init_options = {
			buildDirectory = "build",
			cmakeExecutable = vim.fn.exepath("cmake"),
		},
	},
	clangd = {
		cmd = {
			vim.fn.exepath("clangd"),
			"--background-index",
		},
		init_options = {
			fallbackFlags = { "-std=c++23" },
		},
	},
}

return servers
