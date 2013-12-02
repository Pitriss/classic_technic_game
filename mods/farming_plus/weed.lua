minetest.register_node(":farming:weed", {
	description = "Weed",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_weed.png"},
	inventory_image = "farming_weed.png",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+4/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2,plant=1},
	sounds = default.node_sound_leaves_defaults()
})

local time_scale = 1
local time_speed = tonumber(minetest.setting_get("time_speed"))

if time_speed and time_speed > 0 then
	time_scale = 72 / time_speed
end

local weed_interval = 50
if weed_interval*time_scale >= 1 then
	weed_interval = weed_interval*time_scale
else
	weed_interval = 1
end

minetest.register_abm({
	nodenames = {"farming:soil_wet", "farming:soil"},
	interval = weed_interval,
	chance = 10,
	action = function(pos, node)
		if minetest.env:find_node_near(pos, 4, {"farming:scarecrow", "farming:scarecrow_light"}) ~= nil then
			return
		end
		pos.y = pos.y+1
		if minetest.env:get_node(pos).name == "air" then
			node.name = "farming:weed"
			minetest.env:set_node(pos, node)
		end
	end
})

-- ========= FUEL =========
minetest.register_craft({
	type = "fuel",
	recipe = "farming:weed",
	burntime = 1
})