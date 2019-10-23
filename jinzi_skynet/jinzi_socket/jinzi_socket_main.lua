local skynet = require "skynet"

skynet.start(function()
    local jinzi_socket = skynet.newservice("jinzi_socket")
    local jinzi_socket2 = skynet.newservice("jinzi_socket2")
    skynet.exit()
end)
