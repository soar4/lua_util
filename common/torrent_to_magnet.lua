local bencode = require("bencode")
local sha1 = require "sha1"

local _M = {}
function _M.show(dict)
	print("type:", type(dict))
	if type(dict) ~= "table" then
		return
	end
	for k,v in pairs(dict) do
		print("k:",k, ";type(v):", type(v))
	end
end

function _M.torrent_to_magnet(torrent)
	local f = io.open(torrent)
	local data = f:read("*a")
	-- print("read ", #data, " Bytes from ", torrent)
	local metadata = bencode.decode(data)
	-- _M.show(metadata)
	local hashcontents = bencode.encode(metadata['info'])
	local hashval = sha1.sha1(hashcontents)
	-- print("hash val:", hashval:upper())
	return "magnet:?xt=urn:btih:" .. hashval:upper()
end

return _M
