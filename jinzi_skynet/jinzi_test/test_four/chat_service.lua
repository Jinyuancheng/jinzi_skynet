local skynet = require "skynet"
local socket = require "skynet.socket"

local ClientInfo = {}

function Accept(ClientId)
    -- body
    socket.start(ClientId)
    if #ClientInfo <= 2 then
        -- body
        table.insert(ClientInfo, ClientId)
    end
    while true do
        -- 
        local data = socket.read(ClientId)
        if data then
            -- body
            for k, v in ipairs(ClientInfo) do
                if v ~= ClientId then
                    skynet.error("Client " .. k .. " Speak " .. data)
                    -- body
                    socket.write(v, data)
                end
            end
        else
            for k, v in ipairs(ClientInfo) do socket.close(v) end
            ClientInfo = nil
        end
    end
end

skynet.start(function()
    -- body
    local SvrId = socket.listen("0.0.0.0", 10086)
    socket.start(SvrId, function(ConnId, ConnAdd)
        -- body
        skynet.error("Ip : "..ConnAdd.." Connect Success")
        Accept(ConnId)
    end)
end)
