local skynet = require "skynet"
local socket = require "skynet.socket"

function Accept(SvrId)
    -- body
    socket.start(SvrId)
    while true do
        local ClientData = socket.read(SvrId)
        if ClientData then
            -- body
            skynet.error("socket.lua==>Accept==>ClientData = " .. ClientData)
        else
            skynet.error("socket.lua==>Accept==>ClientData Is Null")
            socket.close(SvrId)
        end
    end
end

skynet.start(function()
    -- body
    local SvrId = socket.listen("0.0.0.0", 10086)
    skynet.error("server listen port : " .. 10086)
    socket.start(SvrId, function(ConnId, Address)
        -- body
        Accept(ConnId)
    end)
end)
