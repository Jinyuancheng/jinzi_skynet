local skynet = require "skynet"

skynet.start(function()
    -- body
    local chat_server = skynet.newservice("chat_service")
    skynet.exit()
end)
