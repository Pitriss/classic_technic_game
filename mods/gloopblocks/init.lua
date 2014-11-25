--[[
GloopBlocks
written by GloopMaster
Licensed under WTFPL.

Updates by VanessaE.

2013-04-08

the register_gloopblocks_alias function is borrowed from stairsplus.

--]]

-- Helper functions

function register_gloopblocks_alias(modname, origname, newmod, newname)
	minetest.register_alias(modname .. ":slab_" .. origname, newmod..":slab_" .. newname)
	minetest.register_alias(modname .. ":slab_" .. origname .. "_inverted", newmod..":slab_" .. newname .. "_inverted")
	minetest.register_alias(modname .. ":slab_" .. origname .. "_wall", newmod..":slab_" .. newname .. "_wall")
	minetest.register_alias(modname .. ":slab_" .. origname .. "_quarter", newmod..":slab_" .. newname .. "_quarter")
	minetest.register_alias(modname .. ":slab_" .. origname .. "_quarter_inverted", newmod..":slab_" .. newname .. "_quarter_inverted")
	minetest.register_alias(modname .. ":slab_" .. origname .. "_quarter_wall", newmod..":slab_" .. newname .. "_quarter_wall")
	minetest.register_alias(modname .. ":slab_" .. origname .. "_three_quarter", newmod..":slab_" .. newname .. "_three_quarter")
	minetest.register_alias(modname .. ":slab_" .. origname .. "_three_quarter_inverted", newmod..":slab_" .. newname .. "_three_quarter_inverted")
	minetest.register_alias(modname .. ":slab_" .. origname .. "_three_quarter_wall", newmod..":slab_" .. newname .. "_three_quarter_wall")
	minetest.register_alias(modname .. ":stair_" .. origname, newmod..":stair_" .. newname)
	minetest.register_alias(modname .. ":stair_" .. origname .. "_inverted", newmod..":stair_" .. newname .. "_inverted")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_wall", newmod..":stair_" .. newname .. "_wall")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_wall_half", newmod..":stair_" .. newname .. "_wall_half")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_wall_half_inverted", newmod..":stair_" .. newname .. "_wall_half_inverted")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_half", newmod..":stair_" .. newname .. "_half")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_half_inverted", newmod..":stair_" .. newname .. "_half_inverted")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_right_half", newmod..":stair_" .. newname .. "_right_half")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_right_half_inverted", newmod..":stair_" .. newname .. "_right_half_inverted")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_wall_half", newmod..":stair_" .. newname .. "_wall_half")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_wall_half_inverted", newmod..":stair_" .. newname .. "_wall_half_inverted")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_inner", newmod..":stair_" .. newname .. "_inner")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_inner_inverted", newmod..":stair_" .. newname .. "_inner_inverted")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_outer", newmod..":stair_" .. newname .. "_outer")
	minetest.register_alias(modname .. ":stair_" .. origname .. "_outer_inverted", newmod..":stair_" .. newname .. "_outer_inverted")
	minetest.register_alias(modname .. ":panel_" .. origname .. "_bottom", newmod..":panel_" .. newname)
	minetest.register_alias(modname .. ":panel_" .. origname .. "_top", newmod..":panel_" .. newname .. "_top")
	minetest.register_alias(modname .. ":panel_" .. origname .. "_vertical", newmod..":panel_" .. newname .. "_vertical")
	minetest.register_alias(modname .. ":micro_" .. origname .. "_bottom", newmod..":micro_" .. newname)
	minetest.register_alias(modname .. ":micro_" .. origname .. "_top", newmod..":micro_" .. newname .. "_top")
end

-- Nodes

minetest.register_node("gloopblocks:rainbow_block", {
	description = "Rainbow Block",
	tiles = {"gloopblocks_rainbow_block.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("gloopblocks:cement", {
	description = "Cement",
	tiles = {"gloopblocks_cement.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:evil_block", {
	description = "Evil Block",
	tiles = {"gloopblocks_evil_block.png"},
	light_source = 5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:basalt", {
	description = "Basalt",
	tiles = {"gloopblocks_basalt.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:pumice", {
	description = "Pumice",
	tiles = {"gloopblocks_pumice.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:pavement", {
	description = "Pavement",
	tiles = {"gloopblocks_pavement.png"},
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:oerkki_block", {
	description = "Oerkki Block",
	paramtype2 = "facedir",
	tiles = {
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_front.png"
	},
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:stone_brick_mossy", {
        description = "Mossy Stone Brick",
        tiles = {"gloopblocks_stone_brick_mossy.png"},
        groups = {cracky=3, stone=1},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:stone_mossy", {
        description = "Mossy Stone",
        tiles = {"gloopblocks_stone_mossy.png"},
        groups = {cracky=3, stone=1},
        sounds = default.node_sound_stone_defaults(),
	drop = "default:mossycobble"
})

minetest.register_node("gloopblocks:cobble_road", {
        description = "Cobblestone Road Bed",
        tiles = {"gloopblocks_cobble_road.png"},
        groups = {cracky=3, stone=1},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:cobble_road_mossy", {
        description = "Mossy Cobblestone Road Bed",
        tiles = {"gloopblocks_cobble_road_mossy.png"},
        groups = {cracky=3, stone=1},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:scaffolding", {
	description = "Wooden Scaffold",
	drawtype = "allfaces",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"gloopblocks_scaffold.png"},
	groups = {choppy=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
		if itemstack and itemstack:get_name() == node.name then
			for i = 1,19 do
				if minetest.get_node({x=pos.x,y=pos.y-i,z=pos.z}).name == "gloopblocks:scaffolding" and scafffound ~= 0 and scafffound ~= 1 then
					local scafffound = 1
					return itemstack
				else
					break
				end
			end
			for i = 1,19 do
				if minetest.get_node({x=pos.x,y=pos.y+i,z=pos.z}).name == "air" and scaffworked ~= 1 and scaffworked ~= 0 then
					minetest.set_node({x=pos.x,y=pos.y+i,z=pos.z}, {name="gloopblocks:scaffolding"})
					local scaffworked = 1
					return ItemStack(tostring(itemstack:get_name().." "..tostring(itemstack:get_count()-1)))
				elseif minetest.get_node({x=pos.x,y=pos.y+i,z=pos.z}).name == "gloopblocks:scaffolding" then
				else
					local scaffworked = 0
				end
			end
			if scaffworked == 1 then
				return ItemStack(tostring(itemstack:get_name().." "..tostring(itemstack:get_count()-1)))
			else
				return itemstack
			end
		else return itemstack end
	end,
})


minetest.register_alias("moreblocks:oerkkiblock", "gloopblocks:oerkki_block")
minetest.register_alias("gloopblocks:obsidian", "default:obsidian")

-- Stairsplus defs

if minetest.get_modpath("moreblocks") then

	register_gloopblocks_alias("stairsplus", "obsidian", "moreblocks", "obsidian")

	local blocks = {
		{"Cement", "cement", "cement"},
		{"Evil Block", "evil", "evil_block"},
		{"Basalt", "basalt","basalt"},
		{"Pumice", "pumice","pumice"},
		{"Pavement", "pavement", "pavement"},
	}

	for i in ipairs(blocks) do
		if blocks[i][1] == "Evil Block" then light = 5 else light = 0 end
		register_stair_slab_panel_micro("gloopblocks", blocks[i][3], "gloopblocks:"..blocks[i][3], {cracky=2, not_in_creative_inventory=1}, {"gloopblocks_"..blocks[i][3]..".png"}, blocks[i][1], blocks[i][3], light)
		register_gloopblocks_alias("gloopblocks", blocks[i][2], "gloopblocks", blocks[i][3])
		register_gloopblocks_alias("moreblocks", blocks[i][3], "gloopblocks", blocks[i][3])
		table.insert(circular_saw.known_stairs, "gloopblocks:"..blocks[i][3])
	end

	register_stair_slab_panel_micro(
		"gloopblocks",
		"oerkki_block",
		"gloopblocks:oerkki_block",
		{cracky=2, not_in_creative_inventory=1},
		{"gloopblocks_oerkkiblock_tb.png",
		 "gloopblocks_oerkkiblock_tb.png",
		 "gloopblocks_oerkkiblock_sides.png",
		 "gloopblocks_oerkkiblock_sides.png",
		 "gloopblocks_oerkkiblock_sides.png",
		 "gloopblocks_oerkkiblock_front.png"},
		"Oerkki Block",
		"oerkki_block",
		0
	)
	register_gloopblocks_alias("moreblocks", "oerkki_block", "gloopblocks", "oerkki_block")
	table.insert(circular_saw.known_stairs, "gloopblocks:oerkki_block")

	register_stair_slab_panel_micro(
		"gloopblocks",
		"stone_brick_mossy",
		"gloopblocks:stone_brick_mossy",
		{cracky=1, not_in_creative_inventory=1},
		{"gloopblocks_stone_brick_mossy.png"},
		"Mossy Stone Brick",
		"stone_brick_mossy",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:stone_brick_mossy")

	register_stair_slab_panel_micro(
		"gloopblocks",
		"stone_mossy",
		"gloopblocks:stone_mossy",
		{cracky=1, not_in_creative_inventory=1},
		{"gloopblocks_stone_mossy.png"},
		"Mossy Stone",
		"stone_mossy",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:stone_mossy")

	register_stair_slab_panel_micro(
		"gloopblocks",
		"cobble_road",
		"gloopblocks:cobble_road",
		{cracky=3, stone=1, not_in_creative_inventory=1},
		{"gloopblocks_cobble_road.png"},
		"Cobblestone Roadbed",
		"cobble_road",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:cobble_road")

	register_stair_slab_panel_micro(
		"gloopblocks",
		"cobble_road_mossy",
		"gloopblocks:cobble_road_mossy",
		{cracky=3, stone=1, not_in_creative_inventory=1},
		{"gloopblocks_cobble_road_mossy.png"},
		"Mossy Cobblestone Roadbed",
		"cobble_road_mossy",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:cobble_road_mossy")

	local colorlist = {
		{"white",      "White"},
		{"grey",       "Grey"},
		{"black",      "Black"},
		{"red",        "Red"},
		{"yellow",     "Yellow"},
		{"green",      "Green"},
		{"cyan",       "Cyan"},
		{"blue",       "Blue"},
		{"magenta",    "Magenta"},
		{"orange",     "Orange"},
		{"violet",     "Violet"},
		{"brown",      "Brown"},
		{"pink",       "Pink"},
		{"dark_grey",  "Dark Grey"},
		{"dark_green", "Dark Green"},
	}

	for i in ipairs(colorlist) do
		local color = colorlist[i][1]
		local colordesc = colorlist[i][2]

		register_stair_slab_panel_micro( "wool", color, "wool:"..color,
			{ snappy=2, choppy=2, oddly_breakable_by_hand=3, flammable=3, wool=1, not_in_creative_inventory=1 },
			{ "wool_"..color..".png" },
			colordesc.." Wool",
			"wool:"..color,
			0
		)
		table.insert(circular_saw.known_stairs, "wool:"..color)
	end
end


-- Tools

minetest.register_tool("gloopblocks:pick_cement", {
	description = "Cement Pickaxe",
	inventory_image = "gloopblocks_cement_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.50, [2]=1.40, [3]=0.90}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:shovel_cement", {
	description = "Cement Shovel",
	inventory_image = "gloopblocks_cement_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=0.60, [3]=0.45}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:axe_cement", {
	description = "Cement Axe",
	inventory_image = "gloopblocks_cement_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.00, [2]=1.30, [3]=0.80}, uses=25, maxlevel=2},
			fleshy={times={[2]=1.20, [3]=0.65}, uses=30, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:sword_cement", {
	description = "Cement Sword",
	inventory_image = "gloopblocks_cement_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=1.60, [2]=0.80, [3]=0.40}, uses=15, maxlevel=2},
			snappy={times={[2]=0.75, [3]=0.35}, uses=30, maxlevel=1},
			choppy={times={[3]=0.80}, uses=30, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("gloopblocks:pick_evil", {
	description = "Evil Pickaxe",
	inventory_image = "gloopblocks_evil_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.10, [2]=0.10, [3]=0.10}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:shovel_evil", {
	description = "Evil Shovel",
	inventory_image = "gloopblocks_evil_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:axe_evil", {
	description = "Evil Axe",
	inventory_image = "gloopblocks_evil_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2},
			fleshy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:sword_evil", {
	description = "Evil Sword",
	inventory_image = "gloopblocks_evil_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			snappy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			choppy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=8},
	}
})

-- Other items

minetest.register_craftitem("gloopblocks:wet_cement", {
	description = "Wet Cement",
	inventory_image = "gloopblocks_wet_cement.png",
})

minetest.register_craftitem("gloopblocks:evil_stick", {
	description = "Evil Stick",
	inventory_image = "gloopblocks_evil_stick.png",
})

-- ABMs for mossy objects

local mossyobjects={
	{ "default:cobble", 				"default:mossycobble" },
	{ "default:stair_cobble", 			"default:stair_mossycobble" },
	{ "default:slab_cobble", 			"default:slab_mossycobble" },
	{ "moreblocks:stair_cobble", 			"moreblocks:stair_mossycobble" },
	{ "moreblocks:stair_cobble_inner", 		"moreblocks:stair_mossycobble_inner" },
	{ "moreblocks:stair_cobble_outer", 		"moreblocks:stair_mossycobble_outer" },
	{ "moreblocks:stair_cobble_half", 		"moreblocks:stair_mossycobble_half" },
	{ "moreblocks:slab_cobble_quarter", 		"moreblocks:slab_mossycobble_quarter" },
	{ "moreblocks:slab_cobble", 			"moreblocks:slab_mossycobble" },
	{ "moreblocks:slab_cobble_three_quarter", 	"moreblocks:slab_mossycobble_three_quarter" },
	{ "moreblocks:panel_cobble", 			"moreblocks:panel_mossycobble" },
	{ "moreblocks:micro_cobble", 			"moreblocks:micro_mossycobble" },
	{ "moreblocks:stair_cobble_alt", 		"moreblocks:stair_mossycobble_alt" },

	{ "gloopblocks:cobble_road", 			"gloopblocks:cobble_road_mossy" },
	{ "gloopblocks:stair_cobble_road", 		"gloopblocks:stair_cobble_road_mossy" },
	{ "gloopblocks:slab_cobble_road", 		"gloopblocks:slab_cobble_road_mossy" },
	{ "gloopblocks:stair_cobble_road", 		"gloopblocks:stair_cobble_road_mossy" },
	{ "gloopblocks:stair_cobble_road_inner", 	"gloopblocks:stair_cobble_road_mossy_inner" },
	{ "gloopblocks:stair_cobble_road_outer", 	"gloopblocks:stair_cobble_road_mossy_outer" },
	{ "gloopblocks:stair_cobble_road_half", 	"gloopblocks:stair_cobble_road_mossy_half" },
	{ "gloopblocks:slab_cobble_road_quarter", 	"gloopblocks:slab_cobble_road_mossy_quarter" },
	{ "gloopblocks:slab_cobble_road", 		"gloopblocks:slab_cobble_road_mossy" },
	{ "gloopblocks:slab_cobble_road_three_quarter",	"gloopblocks:slab_cobble_road_mossy_three_quarter" },
	{ "gloopblocks:panel_cobble_road", 		"gloopblocks:panel_cobble_road_mossy" },
	{ "gloopblocks:micro_cobble_road", 		"gloopblocks:micro_cobble_road_mossy" },
	{ "gloopblocks:stair_cobble_road_alt", 		"gloopblocks:stair_cobble_road_mossy_alt" },

	{ "default:stonebrick", 			"gloopblocks:stone_brick_mossy" },
	{ "default:stair_stonebrick", 			"gloopblocks:stair_stone_brick_mossy" },
	{ "default:slab_stonebrick", 			"gloopblocks:slab_stone_brick_mossy" },
	{ "moreblocks:stair_stonebrick", 		"gloopblocks:stair_stone_brick_mossy" },
	{ "moreblocks:stair_stonebrick_inner", 		"gloopblocks:stair_stone_brick_mossy_inner" },
	{ "moreblocks:stair_stonebrick_outer", 		"gloopblocks:stair_stone_brick_mossy_outer" },
	{ "moreblocks:stair_stonebrick_half", 		"gloopblocks:stair_stone_brick_mossy_half" },
	{ "moreblocks:slab_stonebrick_quarter", 	"gloopblocks:slab_stone_brick_mossy_quarter" },
	{ "moreblocks:slab_stonebrick", 		"gloopblocks:slab_stone_brick_mossy" },
	{ "moreblocks:slab_stonebrick_three_quarter",	"gloopblocks:slab_stone_brick_mossy_three_quarter" },
	{ "moreblocks:panel_stonebrick", 		"gloopblocks:panel_stone_brick_mossy" },
	{ "moreblocks:micro_stonebrick", 		"gloopblocks:micro_stone_brick_mossy" },
	{ "moreblocks:stair_stonebrick_alt", 		"gloopblocks:stair_stone_brick_mossy_alt" },

	{ "default:stone", 				"gloopblocks:stone_mossy" },
	{ "default:stair_stone", 			"gloopblocks:stair_stone_mossy" },
	{ "default:slab_stone", 			"gloopblocks:slab_stone_mossy" },
	{ "moreblocks:stair_stone", 			"gloopblocks:stair_stone_mossy" },
	{ "moreblocks:stair_stone_inner", 		"gloopblocks:stair_stone_mossy_inner" },
	{ "moreblocks:stair_stone_outer", 		"gloopblocks:stair_stone_mossy_outer" },
	{ "moreblocks:stair_stone_half", 		"gloopblocks:stair_stone_mossy_half" },
	{ "moreblocks:slab_stone_quarter", 		"gloopblocks:slab_stone_mossy_quarter" },
	{ "moreblocks:slab_stone", 			"gloopblocks:slab_stone_mossy" },
	{ "moreblocks:slab_stone_three_quarter",	"gloopblocks:slab_stone_mossy_three_quarter" },
	{ "moreblocks:panel_stone", 			"gloopblocks:panel_stone_mossy" },
	{ "moreblocks:micro_stone", 			"gloopblocks:micro_stone_mossy" },
	{ "moreblocks:stair_stone_alt", 		"gloopblocks:stair_stone_mossy_alt" },
}

for i in ipairs(mossyobjects) do
	minetest.register_abm({
		nodenames = { mossyobjects[i][1] },
		neighbors = {"default:water_source", "default:water_flowing"},
		interval = 120,
		chance = 50,
		action = function(pos, node)
			if minetest.find_node_near(pos, 2, "air") then
				fdir = node.param2
				minetest.add_node(pos, {name = mossyobjects[i][2], param2 = fdir})
			end
		end,
	})
end

-- Hook into the default lavacooling function to generate basalt and pumice

default.cool_lava_source = function(pos)
	if gloopblocks_search_nearby_nodes(pos,"default:water_source")
	or gloopblocks_search_nearby_nodes(pos,"default:water_flowing") then
		minetest.set_node(pos, {name="default:obsidian"})
	end
end

default.cool_lava_flowing = function(pos)
	if gloopblocks_search_nearby_nodes(pos,"default:water_source") then
		minetest.set_node(pos, {name="gloopblocks:basalt"})
	elseif gloopblocks_search_nearby_nodes(pos,"default:water_flowing") then
		minetest.set_node(pos, {name="gloopblocks:pumice"})
	end
end

gloopblocks_search_nearby_nodes = function(pos, node)
	if minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name == node then return true end
	if minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name == node then return true end
	if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == node then return true end
	if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == node then return true end
	if minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name == node then return true end
	if minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name == node then return true end
	return false
end

dofile(minetest.get_modpath("gloopblocks").."/crafts.lua")

print("Gloopblocks Loaded!")
