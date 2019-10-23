local skynet = require "skynet"
local socket = require "skynet.socket"

local gl_id = nil;

function Accept(SvrId, SvrAddr)
    socket.start(SvrId)
    if gl_id == nil then
        gl_id = SvrId;
    end
    while true do
        local Data = socket.read(SvrId)
        if Data then
            skynet.error("Client Send Data : " .. Data)
            socket.write(gl_id, Data)
            gl_id = SvrId;
        else
            socket.close(SvrId)
        end
    end
end

skynet.start(function()
    skynet.error("Server Listen Port : ", 10086)
    local SvrId = socket.listen("0.0.0.0", 10086)
    socket.start(SvrId, function(SvrId, SvrAddr) Accept(SvrId) end)
end)