local skynet = require "skynet"

skynet.start(function ()
    skynet.error("Server Start")
    local service = skynet.newservice("service")
    skynet.exit();
end)