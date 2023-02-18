local cmd = vim.api.nvim_command

local function autocmd(this, event, spec)
    local is_table = type(spec) == 'table'
    local pattern = is_table and spec[1] or '*'
    local action = is_table and spec[2] or spec
    if type(action) == 'function' then
        action = this.set(action)
    end
    local e = type(event) == 'table' and table.concat(event, ',') or event
    print('autocmd ' .. e .. ' ' .. pattern .. ' ' .. action)
    cmd('autocmd ' .. e .. ' ' .. pattern .. ' ' .. action)
end

local S = {
    __au = {},
}

local au = setmetatable({}, {
    __index = S,
    __newindex = autocmd,
    __call = autocmd,
})

function S.exec(id)
    S.__au[id]()
end

function S.set(fn)
    local id = string.format('%p', fn)
    S.__au[id] = fn
    return string.format('lua require("autocmd").exec("%s")', id)
end

function S.group(grp, cmds)
    cmd('augroup ' .. grp)
    cmd('autocmd!')
    if type(cmds) == 'function' then
        cmds(au)
    else
        for _, au in ipairs(cmds) do
            autocmd(S, au[1], { au[2], au[3] })
        end
    end
    cmd('augroup END')
end

-- 1033是英文输入法
-- 2052是搜狗输入法。设置中默认为英文输入
local changeInputLanguage = function()
    local configPath = vim.api.nvim_exec('echo stdpath("config")', true)
    local program = configPath .. '\\tools\\im-select'
    local str = string.format('!%s 1033 & %s 2052', program, program)
    print(str, os.time())
    cmd(str)
end
au.VimEnter = changeInputLanguage
au.InsertLeave = changeInputLanguage


return au