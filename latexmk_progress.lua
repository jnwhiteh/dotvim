local gvim, server, func, basename = ...

while true do
	local line = io.read("*line")
	if not line then return end

	for pnum in line:gmatch("%[(%d+)%]") do
		local cmd = string.format([[%s --servername %s --remote-expr "%s('%s', '%s')"]],
			gvim, server, func, basename, pnum)
		os.execute(cmd)
	end
end
