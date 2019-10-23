local skynet = require "skynet"
local socket = require "skynet.socket"

function Accept(SvrId)
    -- body
    socket.start(SvrId)
    while true do
        local ClientData = socket.read(SvrId)
        if ClientData then
            -- body
            socket.write(SvrId, ClientData)
        else
            socket.close(SvrId)
        end
    end
end

skynet.start(function()
	-- body
    local SvrId = socket.listen("0.0.0.0", 10089)
	socket.error("Server Listen Port : "..10089)
    socket.start(SvrId, function(SvrId, SvrAddr) Accept(SvrId) end)
end)
