if InVsCode() then
    print("is in vscode, do nothing plugin")
    return
end
require 'plugin-config/bufferline'
require 'plugin-config/nvim-treesitter'
require 'plugin-config/nvim-tree'
require 'plugin-config/project'
