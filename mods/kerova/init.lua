--[[
Kerova Mod
By AndromedaKerova (AKA; RommieKerova, Rommie, Andromeda) (rommiekerova@gmail.com)
License: WTFPL
Version: 1.0
--]]

dofile(minetest.get_modpath("kerova").."/craft.lua")

-- Thing that checks permission to open locked chests
local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end

-- CHESTS NODES
local dye = {"white", "grey", "dark_grey", "black", "blue", "cyan", "dark_green", "green", "magenta", "orange", "pink", "red", "violet", "yellow"}

for _, row in ipairs(dye) do
	local name = row
	minetest.register_node("kerova:chest_"..name, {
		description = name.." chest",
		tiles = {"kerova_chest_top_"..name..".png", "kerova_chest_top_"..name..".png", "kerova_chest_"..name..".png",
			"kerova_chest_"..name..".png", "kerova_chest_"..name..".png", "kerova_chest_front_"..name..".png"},
		paramtype2 = "facedir",
		groups = {choppy=2,oddly_breakable_by_hand=2},
		sounds = default.node_sound_wood_defaults(),
		legacy_facedir_simple = true,
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec",default.chest_formspec)
			meta:set_string("infotext", name.." chest")
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
		end,
		can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("main")
		end,
		on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			minetest.log("action", player:get_player_name()..
					" moves stuff in chest at "..minetest.pos_to_string(pos))
		end,
		on_metadata_inventory_put = function(pos, listname, index, stack, player)
			minetest.log("action", player:get_player_name()..
					" moves stuff to chest at "..minetest.pos_to_string(pos))
		end,
		on_metadata_inventory_take = function(pos, listname, index, stack, player)
			minetest.log("action", player:get_player_name()..
					" takes stuff from chest at "..minetest.pos_to_string(pos))
		end,
	})
	minetest.register_node("kerova:chest_"..name.."_locked", {
		description = name.." locked chest",
		tiles = {"kerova_chest_top_"..name..".png", "kerova_chest_top_"..name..".png", "kerova_chest_"..name..".png",
			"kerova_chest_"..name..".png", "kerova_chest_"..name..".png", "kerova_chest_lock_"..name..".png"},
		paramtype2 = "facedir",
		groups = {choppy=2,oddly_breakable_by_hand=2},
		sounds = default.node_sound_wood_defaults(),
		legacy_facedir_simple = true,
		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			meta:set_string("owner", placer:get_player_name() or "")
			meta:set_string("infotext", name.." locked chest (owned by "..
					meta:get_string("owner")..")")
		end,
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", name.." locked chest")
			meta:set_string("owner", "")
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
		end,
		can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("main") and has_locked_chest_privilege(meta, player)
		end,
		allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			local meta = minetest.get_meta(pos)
			if not has_locked_chest_privilege(meta, player) then
				minetest.log("action", player:get_player_name()..
						" tried to access a locked chest belonging to "..
						meta:get_string("owner").." at "..
						minetest.pos_to_string(pos))
				return 0
			end
			return count
		end,
		allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			if not has_locked_chest_privilege(meta, player) then
				minetest.log("action", player:get_player_name()..
						" tried to access a locked chest belonging to "..
						meta:get_string("owner").." at "..
						minetest.pos_to_string(pos))
				return 0
			end
			return stack:get_count()
		end,
		allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			if not has_locked_chest_privilege(meta, player) then
				minetest.log("action", player:get_player_name()..
						" tried to access a locked chest belonging to "..
						meta:get_string("owner").." at "..
						minetest.pos_to_string(pos))
				return 0
			end
			return stack:get_count()
		end,
		on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			minetest.log("action", player:get_player_name()..
					" moves stuff in locked chest at "..minetest.pos_to_string(pos))
		end,
		on_metadata_inventory_put = function(pos, listname, index, stack, player)
			minetest.log("action", player:get_player_name()..
					" moves stuff to locked chest at "..minetest.pos_to_string(pos))
		end,
		on_metadata_inventory_take = function(pos, listname, index, stack, player)
			minetest.log("action", player:get_player_name()..
					" takes stuff from locked chest at "..minetest.pos_to_string(pos))
		end,
		on_rightclick = function(pos, node, clicker)
			local meta = minetest.get_meta(pos)
			if has_locked_chest_privilege(meta, clicker) then
				minetest.show_formspec(
					clicker:get_player_name(),
					"kerova:chest_"..name.."_locked",
					default.get_locked_chest_formspec(pos)
				)
			end
		end,
	})
end

-- DECORATIVE WOOD NODES
local numvar = nil
for numvar = 1, 10, 1 do
	local txtvar = tostring(numvar)
	minetest.register_node("kerova:deco_wood_"..txtvar, {
		description = "Decorative Wood Tile #"..txtvar,
		tiles = {"kerova_deco_wood_"..txtvar..".png"},
		groups = {choppy=2,oddly_breakable_by_hand=2,wood=1},
		sounds = default.node_sound_wood_defaults(),
	})
	register_stair_slab_panel_micro("kerova", "deco_wood_"..txtvar, "kerova:deco_wood_"..txtvar,
		{choppy=2,oddly_breakable_by_hand=2,wood=1},
		{"kerova_deco_wood_"..txtvar..".png"},
		"Deco_wood "..txtvar,
		"deco_wood_"..txtvar,
		"facedir",
	0)
end

-- GOTHIC FLOOR
-- Floor
minetest.register_node("kerova:gothic_floor", {
	description = "Gothic Floor",
	tiles = {"kerova_gothic_floor.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
register_stair_slab_panel_micro("kerova", "gothic_floor", "kerova:gothic_floor",
	{choppy=2,oddly_breakable_by_hand=2,wood=1},
	{"kerova_gothic_floor.png"},
	"Gothic floor",
	"gothic_floor",
	"facedir",
0)

-- BAMBOO FLOOR
minetest.register_node("kerova:bamboo_floor", {
	description = "Bamboo Floor",
	tiles = {"kerova_bamboo_floor.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
register_stair_slab_panel_micro("kerova", "bamboo_floor", "kerova:bamboo_floor",
	{choppy=2,oddly_breakable_by_hand=2,wood=1},
	{"kerova_bamboo_floor.png"},
	"Bamboo floor",
	"bamboo_floor",
	"facedir",
0)

-- FLAGSTONE WALL
minetest.register_node("kerova:flagstone", {
	description = "Flagstone",
	tiles = {"kerova_flagstone.png"},
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})
register_stair_slab_panel_micro("kerova", "flagstone", "kerova:flagstone",
	{cracky=2, stone=1},
	{"kerova_flagstone.png"},
	"Flagstone",
	"flagstone",
	"facedir",
0)

-- RUSTICSTONE WALL
minetest.register_node("kerova:rusticstone", {
	description = "Rustic Stone",
	tiles = {"kerova_rusticstone.png"},
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})
register_stair_slab_panel_micro("kerova", "rusticstone", "kerova:rusticstone",
	{cracky=2, stone=1},
	{"kerova_rusticstone.png"},
	"Rusticstone",
	"rusticstone",
	"facedir",
0)

-- RAINBOW VALLEY (SIGNLIKE)
-- Left
minetest.register_node("kerova:rainbow_valley_left", {
	description = "Rainbow Valley Left",
	drawtype = "signlike",
	tiles = {"kerova_rainbow_valley_left.png"},
	inventory_image = "kerova_rainbow_valley_left.png",
	wield_image = "kerova_rainbow_valley_left.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
})
-- Right
minetest.register_node("kerova:rainbow_valley_right", {
	description = "Rainbow Valley Right",
	drawtype = "signlike",
	tiles = {"kerova_rainbow_valley_right.png"},
	inventory_image = "kerova_rainbow_valley_right.png",
	wield_image = "kerova_rainbow_valley_right.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
})

for i,v in ipairs({"kerova:deco_wood_1", "kerova:deco_wood_2", "kerova:deco_wood_3", "kerova:deco_wood_3", "kerova:deco_wood_4", "kerova:deco_wood_5", "kerova:deco_wood_6", "kerova:deco_wood_7", "kerova:deco_wood_8", "kerova:deco_wood_9", "kerova:deco_wood_10", "kerova:gothic_floor", "kerova:bamboo_floor", "kerova:flagstone", "kerova:rusticstone",}) do
	table.insert(circular_saw.known_stairs, v);
end