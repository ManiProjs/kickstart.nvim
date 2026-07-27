return {
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
    opts = {
        manual_mode = true
    },
    config = function(_, opts)
        require('project_nvim').setup(opts)

        local history = require 'project_nvim.utils.history'
        history.delete_project = function(project)
            for k, v in pairs(history.recent_projects) do
                if v == project.value then
                    history.recent_projects[k] = nil
                    return
                end
            end
        end

        local ok, telescope = pcall(require, 'telescope')
        if ok then
            telescope.load_extension 'projects'
        end
    end
}
