local time_scale = 1
local time_speed = tonumber(minetest.setting_get("time_speed"))

if time_speed and time_speed > 0 then
	time_scale = 72 / time_speed
end

minetest.register_node("farming_plus:banana_sapling", {
	description = "Banana Tree Sapling",
	drawtype = "plantlike",
	tiles = {"farming_banana_sapling.png"},
	inventory_image = "farming_banana_sapling.png",
	wield_image = "farming_banana_sapling.png",
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3,flammable=2},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("farming_plus:banana_leaves", {
	drawtype = "allfaces_optional",
	tiles = {"farming_banana_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, not_in_creative_inventory=1},
	drop = {
		max_items = 1,
		items = {
			{items = {'farming_plus:banana_sapling'}, rarity = 20 },
			{items = {"farming_plus:banana_leaves"} }
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

local sapling_interval = 60
if sapling_interval*time_scale >= 1 then
	sapling_interval = sapling_interval*time_scale
else
	sapling_interval = 1
end

minetest.register_abm({
	nodenames = {"farming_plus:banana_sapling"},
	interval = sapling_interval,
	chance = 20,
	action = function(pos, node)
		farming:generate_tree(pos, "default:tree", "farming_plus:banana_leaves", {"default:dirt", "default:dirt_with_grass"}, {["farming_plus:banana"]=20})
	end
})

minetest.register_on_generated(function(minp, maxp, blockseed)
	if math.random(1, 100) > 5 then
		return
	end
	local tmp = {x=(maxp.x-minp.x)/2+minp.x, y=(maxp.y-minp.y)/2+minp.y, z=(maxp.z-minp.z)/2+minp.z}
	local pos = minetest.env:find_node_near(tmp, maxp.x-minp.x, {"default:dirt_with_grass"})
	if pos ~= nil then
		farming:generate_tree({x=pos.x, y=pos.y+1, z=pos.z}, "default:tree", "farming_plus:banana_leaves",  {"default:dirt", "default:dirt_with_grass"}, {["farming_plus:banana"]=10})
	end
end)

minetest.register_node("farming_plus:banana", {
	description = "Banana",
	tiles = {"farming_banana.png"},
	inventory_image = "farming_banana.png",
	wield_image = "farming_banana.png",
	drawtype = "torchlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	sounds = default.node_sound_defaults(),

	on_use = minetest.item_eat(6),
})
