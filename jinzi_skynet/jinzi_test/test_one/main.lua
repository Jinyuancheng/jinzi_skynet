local skynet = require "skynet"

skynet.start(function() 
    skynet.error("main==>start")
    local service = skynet.newservice("service")
    skynet.exit()
end)
