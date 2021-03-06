-- wifi.lua
-- Copyright (c) 2017 Rudi Niemeijer
-- MIT license

-- NodeMCU remembers this, even after power-off or reset
-- so no need to run this more than once
wifi.setmode(wifi.STATION)
station_cfg = {}
station_cfg.ssid = "SoftwareCircus2017"
station_cfg.pwd = "cloudbusting"
station_cfg.save = true
wifi.sta.config(station_cfg)
wifi.sta.connect()

-- Check the status of the IP-configuration in the console
-- print(wifi.sta.status()) -- Status 5 is A-OK
-- print(wifi.sta.getip())

-- Call a webhook, just for fun
tmr.alarm(6, 30000, tmr.ALARM_AUTO, function() 
  http.get("http://maker.ifttt.com/trigger/testwifi/with/key/cKOv_7WOkun-XfI22a5Duw-yhCiJF61C-dn4NvuU-LI?value1=" .. wifi.sta.getmac())
end)
