local skynet = require "skynet"

skynet.start(function()
    -- body
    local service = skynet.newservice("service")
    -- 设置数据
    skynet.call(service, "lua", "set", "key1", "jinzi1")
    -- 得到数据
    local Data = skynet.call(service, "lua", "get", "key1")
    -- 输出结果
    skynet.error("main.lua==>skynet.start==>service.get = " .. Data)
    skynet.exit();
end)
