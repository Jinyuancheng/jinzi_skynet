local skynet = require "skynet"
local socket = require "skynet.socket"

function Accept(ConnId)
    skynet.error("agent.lua==>Accept Exec")
    -- 谁调用socet.start函数，谁才有权利去操作该socket
    socket.start(ConnId)
    while true do
        local data = socket.read(ConnId)
        skynet.error("Client " .. ConnId .. "SendData : " .. data)
        if data then
            -- body
            socket.write(ConnId, data)
        else
            socket.write(ConnId, "Send Data Null")
        end
    end
end

skynet.start(function()
    skynet.error("agent.lua Start Exec")
    skynet.dispatch("lua", function(Session, Address, ConnId, ...)
        skynet.error("agent.lua ConnId : " .. ConnId)
        -- fork函数 启动一个新的任务去执行 函数
        skynet.fork(function()
            Accept(ConnId)
            skynet.exit()
        end)
    end)
end)
