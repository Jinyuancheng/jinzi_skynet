local skynet = require "skynet"
local socket = require "skynet.socket"

function Accept(SvrId, SvrAddr)
    -- 
    socket.start(SvrId)
    skynet.error("Accept Func Exec")
    skynet.error("Connect Handle : " .. SvrId .. " Ip :" .. SvrAddr)
    socket.write(SvrId, "Hello Jinzi_Test")
    local agent = skynet.newservice("agent")
    skynet.call(agent, "lua", SvrId)
    -- 清理数据结构但是不关闭socket
    socket.abandon(SvrId)
end

skynet.start(function()
    -- body
    local SvrId = socket.listen("0.0.0.0", 10086)
    socket.start(SvrId, function(ConnId, ConnAddr)
        -- body
        Accept(ConnId, ConnAddr)
    end)
end)
