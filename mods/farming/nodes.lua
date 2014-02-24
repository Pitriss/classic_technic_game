--
-- Cake
--

minetest.register_node("farming:cake", {
	drawtype = "nodebox",
	description = "CAKE!!!",
	tiles = {"farming_cake_top.png","farming_cake_base.png","farming_cake_side.png"},
	groups = {crumbly=3},
	paramtype = "light",
	drop = "farming:cake",
	on_use=minetest.item_eat(16),
	node_box = {
		type = "fixed",
		fixed = {
			{-6/16, -8/16, -4/16, 6/16, 0/16, 4/16},
			{-4/16, -8/16, -6/16, 4/16, 0/16, 6/16},
			{-5/16, -8/16, -5/16, 5/16, 0/16, 5/16},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-8/16,-8/16,-8/16,8/16,0/16,8/16},
		},
	},
})

minetest.register_craftitem("farming:dough", {
	description = "Cake Mixture",
	inventory_image = "farming_cakedough.png",
	wield_image = "farming_cakedough.png",
})

--
--Rope
--

minetest.register_node("farming:rope",{
	description = "Rope",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"farming_rope.png"},
	inventory_image = "farming_rope_inv.png",
	wield_image = "farming_rope_inv.png",
	groups = {choppy=3,snappy=3,oddly_breakable_by_hand=3,flammable=1},
	paramtype = "light",
	climbable = true,
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-2/16, -8/16, -2/16, 2/16, 8/16, 2/16},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-3/16, -8/16, -3/16, 3/16, 8/16, 3/16},
		},
	},
})
