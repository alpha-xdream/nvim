require('leap').add_default_mappings()
require 'plugin-config/nvim-treesitter'
require 'plugin-config/nvim-tree'
if InVsCode() then
    print("is in vscode, do nothing plugin")
    return
end

require 'plugin-config/bufferline'
require 'plugin-config/project'