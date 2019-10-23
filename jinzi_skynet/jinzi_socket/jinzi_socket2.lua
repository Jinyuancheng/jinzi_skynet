local skynet = require "skynet"
local socket = require "skynet.socket"

function Accept(SvrId, SvrAddr)
    socket.start(SvrId)
    while true do
        local Data = socket.read(SvrId)
        if Data then
            skynet.error("Client Send Data : " .. Data)
            socket.write(SvrId, Data)
        else
            socket.close(SvrId)
        end
    end
end

skynet.start(function()
    skynet.error("Server Listen Port : ", 10087)
    local SvrId = socket.listen("0.0.0.0", 10087)
    socket.start(SvrId, function(SvrId, SvrAddr) Accept(SvrId) end)
end)
