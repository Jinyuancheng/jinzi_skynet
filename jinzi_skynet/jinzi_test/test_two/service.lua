local skynet = require "skynet"
require "skynet.manager"

-- 用来存储数据
local Data = {}
-- 指令对应函数
local Comment = {}

-- 用来获取key值对应的value
-- @params key 存储的数据的key值
function Comment.get(key)
    skynet.error("service.lua==>Comment.get(" .. key .. ")")
    if Data[key] then
        return Data[key]
    else
        return nil
    end
end

function Comment.set(key, value)
    -- body
    skynet.error("service.lua==>Comment.set(" .. key .. "," .. value .. ")")
    Data[key] = value
end

skynet.start(function()
    -- body
    -- Cmd就是Comment中的函数的名称，间接调用函数
    skynet.dispatch("lua", function(Session, Address, Cmd, ...)
        -- body
        skynet.error("service.lua==>skynet.start==>skynet.dispatch")
        local Func = Comment[Cmd]
        assert(Func)
        if Func then
            -- body
            -- 回应消息
            skynet.ret(skynet.pack(Func(...)))
        else
            skynet.error("Comment["..Cmd.."]".."Undefined")
        end
    end)
end)
