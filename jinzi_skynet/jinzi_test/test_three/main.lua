local skynet = require "skynet"

skynet.start(function()
    -- body
    skynet.error("Server Start")
    local socket = skynet.newservice("socket")
    skynet.exit()
end)
