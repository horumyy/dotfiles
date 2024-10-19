return {
	black = 0xff1e202,
	white = 0xffffffff,
	red = 0xfff5a9b8,
	green = 0xfffb6fa9,
	blue = 0xff9ac5ff,
	yellow = 0xffffb3d2,
	orange = 0xfff5a9b8,
	magenta = 0xfffb6fa9,
	grey = 0xff878ba6,
	transparent = 0x00000000,

	bar = {
		bg = 0x00000000,
		border = 0xff2c2e34,
	},
	popup = {
		bg = 0xc02c2e34,
		border = 0xff7f8490,
	},
	bg1 = 0xff1e202f,
	bg2 = 0xfff5a9b8,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
