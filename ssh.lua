local M = {}

function M.setup(config)
	config.ssh_domains = {
		{
			name = 'railab',
			remote_address = '100.119.50.71',
			username = 'gmmyung',
		},
		{
			name = 'urckaist',
			remote_address = 'urckaist-nucboxg5',
			username = 'urckaist',
		},
	}
	return config
end

return M
