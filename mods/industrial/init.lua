-- Industrial Mod
-- by RAPHAEL
--
-- License: Do what you want but give credit where credit is due
--
-- Some code/textures taken from/modded from the following mods:
-- * secret_passages
-- * moreblocks
-- * default

-- Reworked by pitriss. Some items removed, and fixed recipes.


-- white brick (because I missed it)
minetest.register_craft({
	output = 'industrial:white_brick 2',
	recipe = {
		{'default:stone', 'default:stone'},
		{'default:stone', 'default:stone'},
		{'default:stone', 'default:stone'},
	}
})

minetest.register_node("industrial:white_brick", {
	description = "White Brick",
	tiles = {"industrial_white_brick.png"},
	inventory_image = minetest.inventorycube("industrial_white_brick.png"),
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
-- end white brick

-- industrial crate
minetest.register_craft({
	output = 'industrial:crate',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'', 'default:wood', ''},
		{'default:wood', 'default:wood', 'default:wood'},
	}
})

minetest.register_node("industrial:crate", {
	description = "Industrial Crate",
	tiles = {"industrial_crate_front.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Crate")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
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

local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end

-- end industrial crate

-- industrial safe (some reason it doesn't line up right on placement anymore?)
minetest.register_craft({
	output = 'industrial:safe',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'', 'default:steel_ingot', ''},
		{'default:wood', 'default:wood', 'default:wood'},
	}
})

minetest.register_node("industrial:safe", {
	description = "Industrial Safe",
	tiles = {"industrial_safe_top.png", "industrial_safe_top.png", "industrial_safe_side.png",
		"industrial_safe_side.png", "industrial_safe_side.png", "industrial_safe_lock.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Industrial Safe (owned by "..
				meta:get_string("owner")..")")
	end,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Industrial Safe")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.env:get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access an industrial safe belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return count
	end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access an industrial safe belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access an industrial safe belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in industrial safe chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to industrial safe at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from industrial safe at "..minetest.pos_to_string(pos))
	end,
})
-- end industrial safe

-- filingcabinet
minetest.register_craft({
	output = 'industrial:filingcabinet 2',
	recipe = {
		{'default:chest', 'default:chest'},
	}
})

minetest.register_node("industrial:filingcabinet", {
	description = "Industrial filing cabinet",
	tiles = {"industrial_filingcabinetside.png", "industrial_filingcabinetside.png", "industrial_filingcabinetside.png", "industrial_filingcabinetside.png", "industrial_filingcabinetside.png", "industrial_filingcabinetfront.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Filing Cabinet")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
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

local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end
-- end filing cabinet

-- random steel color like block for various uses
minetest.register_craft({
	output = 'industrial:steelgray 3',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
	}
})

minetest.register_node("industrial:steelgray", {
	description = "steel gray",
	tiles = {"industrial_steelgray.png"},
	inventory_image = minetest.inventorycube("industrial_steelgray.png"),
	is_ground_content = true,
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	sounds = default.node_sound_stone_defaults(),
})
-- end steel block

---- start high voltage sign
minetest.register_craft({
	output = 'industrial:highvoltagesign',
	recipe = {
		{'technic:hv_cable', 'default:sign_wall'},
	}
})

minetest.register_node("industrial:highvoltagesign", {
	description = "High Voltage Sign",
	drawtype = "signlike",
	tiles = {"industrial_highvoltagesign.png"},
	inventory_image = "industrial_highvoltagesign.png",
	wield_image = "industrial_highvoltagesign.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	metadata_name = "sign",
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2},
	sounds = default.node_sound_defaults(),
	legacy_wallmounted = true,
})
---- end high voltage sign

-- exit sign
minetest.register_craft({
	output = 'industrial:exitsign',
	recipe = {
		{'default:wood', 'default:sign_wall'},
	}
})

minetest.register_node("industrial:exitsign", {
	description = "Exit Sign",
	drawtype = "signlike",
	tiles = {"industrial_exitsign.png"},
	inventory_image = "industrial_exitsign.png",
	wield_image = "industrial_exitsign.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	metadata_name = "sign",
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2},
	sounds = default.node_sound_defaults(),
	legacy_wallmounted = true,
})
-- end exit sign
