local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
	icon = {
		color = colors.red,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
	},
	label = {
		color = colors.blue,
		padding_right = 8,
		width = 59,
		align = "right",
		font = { family = settings.font.numbers },
	},
	position = "right",
	update_freq = 30,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bg1,
		border_color = colors.black,
		border_width = 1,
	},
})

-- Double border for calendar using a single item bracket
sbar.add("bracket", { cal.name }, {
	background = {
		color = colors.transparent,
		height = 30,
		border_color = colors.grey,
	},
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	local date = os.date("*t")
	local hour = date.hour
	local am_pm = "AM"

	if hour >= 12 then
		am_pm = "PM"
		if hour > 12 then
			hour = hour - 12
		end
	elseif hour == 0 then
		hour = 12
	end

	cal:set({
		icon = os.date("%a. %d %b."),
		label = string.format("%d:%02d %s", hour, date.min, am_pm),
	})
end)

cal:subscribe("mouse.clicked", function(env)
	os.execute("open -a Calendar")
end)
