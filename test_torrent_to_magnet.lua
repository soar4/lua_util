package.path = package.path .. ";./common/?.lua"
-- print(package.path)
-- print(package.cpath)
local tor2url = require("torrent_to_magnet")

print(tor2url.torrent_to_magnet("./moli.torrent"))
