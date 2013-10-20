-- LIGHTS+
--updated 13/07/2013
--Mod adding simple on/off lights by qwrwed.

--Super Light - useless because max light source is 14

--[[minetest.register_node("lightsplus:super_light", {
	description = "Super Light",
	tiles = {"lightsplus_light.png"},
	groups = {choppy=3,cracky=2},
})

minetest.register_node("lightsplus:super_light_on", {
	description = "Active Super Light",
	tile_images = {"lightsplus_light.png"},
	drop = 'lightsplus:super_light',
	light_source = 20,
	groups = {choppy=3,cracky=3,not_in_creative_inventory=1},
})
minetest.register_craft({
	output = '"lightsplus:super_light"',
	recipe = {
		{'lightsplus:light', 'lightsplus:light', 'lightsplus:light'},
		{'lightsplus:light', 'lightsplus:light', 'lightsplus:light'},
		{'lightsplus:light', 'lightsplus:light', 'lightsplus:light'},
	}
})

local on_light_puncher = function (pos, node, puncher)
  if node.name == 'lightsplus:super_light' then
    minetest.env:add_node(pos, {name="lightsplus:super_light_on"})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:super_light_on' then
	minetest.env:add_node(pos, {name="lightsplus:super_light",})
    nodeupdate(pos)
  end
end]]

-- Normal Light
minetest.register_node("lightsplus:light", {
	description = "Light",
	tiles = {"lightsplus_light.png"},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:light_on", {
	description = "Active Light",
	tile_images = {"lightsplus_light.png"},
	drop = 'lightsplus:light',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
})
-- Slab Light
minetest.register_node("lightsplus:slab_light", {
	description = "Slab Light",
	tile_images = {"lightsplus_light.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:slab_light_on", {
	description = "Active Slab Light",
	tile_images = {"lightsplus_light.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'lightsplus:slab_light',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=2},
})

-- Wall Slab Light
minetest.register_node("lightsplus:slab_light_wall", {
	description = "Wall Slab Light",
	tile_images = {"lightsplus_light.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:slab_light_wall_on", {
	description = "Active Wall Slab Light",
	tile_images = {"lightsplus_light.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
	drop = 'lightsplus:slab_light',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=2},
})
--Inverted Slab Light
minetest.register_node("lightsplus:slab_light_inv", {
	description = "Inverted Slab Light",
	tile_images = {"lightsplus_light.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:slab_light_inv_on", {
	description = "Active Inverted Slab Light",
	tile_images = {"lightsplus_light.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
	drop = 'lightsplus:slab_light_inv',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=2},
})

--Gold Lights
-- Normal
minetest.register_node("lightsplus:light_gold", {
	description = "Gold Light",
	tiles = {"lightsplus_light_gold.png"},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:light_on_gold", {
	description = "Active Gold Light",
	tile_images = {"lightsplus_light_gold.png"},
	drop = 'lightsplus:light',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
})
-- Slab
minetest.register_node("lightsplus:slab_light_gold", {
	description = "Gold Slab Light",
	tile_images = {"lightsplus_light_gold.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:slab_light_on_gold", {
	description = "Active Gold Slab Light",
	tile_images = {"lightsplus_light_gold.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	drop = 'lightsplus:slab_light',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=2},
})

-- Wall Slab
minetest.register_node("lightsplus:slab_light_wall_gold", {
	description = "Gold Wall Slab Light",
	tile_images = {"lightsplus_light_gold.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:slab_light_wall_on_gold", {
	description = "Active Gold Wall Slab Light",
	tile_images = {"lightsplus_light_gold.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
	},
	drop = 'lightsplus:slab_light',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=2},
})
--Inverted Slab
minetest.register_node("lightsplus:slab_light_inv_gold", {
	description = "Inverted Gold Slab Light",
	tile_images = {"lightsplus_light_gold.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:slab_light_inv_on_gold", {
	description = "Active Inverted Gold Slab Light",
	tile_images = {"lightsplus_light_gold.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
	},
	drop = 'lightsplus:slab_light_inv',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=2},
})
--Crafts
--Light
minetest.register_craft({
	output = 'lightsplus:light 10',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:torch', 'default:torch', 'default:torch'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})
--Gold Lights
minetest.register_craft({
	type = "shapeless",
	output = "lightsplus:light_gold",
	recipe = {'lightsplus:light', 'default:gold_ingot'},
})

minetest.register_craft({
	type = "shapeless",
	output = "lightsplus:light_gold",
	recipe = {'lightsplus:light', 'moreores:gold_ingot'},
})

--Slab Light
minetest.register_craft({
	output = 'lightsplus:slab_light_gold 6',
	recipe = {
		{'lightsplus:light_gold', 'lightsplus:light_gold', 'lightsplus:light_gold'},
	}
})
--Back to a Light
minetest.register_craft({
	output = 'lightsplus:light_gold',
	recipe = {
		{'lightsplus:slab_light_gold'},
		{'lightsplus:slab_light_gold'},
	}
})
--From Inverted
minetest.register_craft({
	output = 'lightsplus:slab_light_gold',
	recipe = {
		{'lightsplus:slab_light_inv_gold'},
		}
})
--Wall Slab Light
minetest.register_craft({
	output = 'lightsplus:slab_light_wall_gold 6',
	recipe = {
		{'lightsplus:light_gold'},
		{'lightsplus:light_gold'},
		{'lightsplus:light_gold'},
	}
})
--Back to a Light
minetest.register_craft({
	output = 'lightsplus:light_gold',
	recipe = {
		{'lightsplus:slab_light_wall_gold', 'lightsplus:slab_light_wall_gold'},
	}
})
--Inverted Slab Light
minetest.register_craft({
	output = 'lightsplus:slab_light_inv_gold',
	recipe = {
		{'lightsplus:slab_light_gold'},
		}
})
--Back To a Light
minetest.register_craft({
	output = 'lightsplus:light_gold',
	recipe = {
		{'lightsplus:slab_light_inv_gold'},
		{'lightsplus:slab_light_inv_gold'},
	}
})

--Normal Lights
minetest.register_craft({
	output = 'lightsplus:slab_light 6',
	recipe = {
		{'lightsplus:light', 'lightsplus:light', 'lightsplus:light'},
	}
})
--Back to a Light
minetest.register_craft({
	output = 'lightsplus:light',
	recipe = {
		{'lightsplus:slab_light'},
		{'lightsplus:slab_light'},
	}
})
--From Inverted
minetest.register_craft({
	output = 'lightsplus:slab_light',
	recipe = {
		{'lightsplus:slab_light_inv'},
		}
})
--Wall Slab Light
minetest.register_craft({
	output = 'lightsplus:slab_light_wall 6',
	recipe = {
		{'lightsplus:light'},
		{'lightsplus:light'},
		{'lightsplus:light'},
	}
})
--	Back to a Light
minetest.register_craft({
	output = 'lightsplus:light',
	recipe = {
		{'lightsplus:slab_light_wall', 'lightsplus:slab_light_wall'},
	}
})
--	Inverted Slab Light
minetest.register_craft({
	output = 'lightsplus:slab_light_inv',
	recipe = {
		{'lightsplus:slab_light'},
		}
})
--	Back To a Light
minetest.register_craft({
	output = 'lightsplus:light',
	recipe = {
		{'lightsplus:slab_light_inv'},
		{'lightsplus:slab_light_inv'},
	}
})

local on_light_puncher = function (pos, node, puncher)
  if node.name == 'lightsplus:light' then
    minetest.env:add_node(pos, {name="lightsplus:light_on"})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:light_on' then
	minetest.env:add_node(pos, {name="lightsplus:light",})
    nodeupdate(pos)
  end
  if node.name == 'lightsplus:slab_light' then
    minetest.env:add_node(pos, {name="lightsplus:slab_light_on"})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:slab_light_on' then
	minetest.env:add_node(pos, {name="lightsplus:slab_light",})
    nodeupdate(pos)
  end
  if node.name == 'lightsplus:slab_light_inv' then
    minetest.env:add_node(pos, {name="lightsplus:slab_light_inv_on"})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:slab_light_inv_on' then
	minetest.env:add_node(pos, {name="lightsplus:slab_light_inv",})
    nodeupdate(pos)
  end
  if node.name == 'lightsplus:slab_light_wall' then
    minetest.env:add_node(pos, {name="lightsplus:slab_light_wall_on", param2=node.param2})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:slab_light_wall_on' then
	minetest.env:add_node(pos, {name="lightsplus:slab_light_wall", param2=node.param2})
    nodeupdate(pos)
  end
    if node.name == 'lightsplus:light_gold' then
    minetest.env:add_node(pos, {name="lightsplus:light_on_gold"})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:light_on_gold' then
	minetest.env:add_node(pos, {name="lightsplus:light_gold",})
    nodeupdate(pos)
  end
  if node.name == 'lightsplus:slab_light_gold' then
    minetest.env:add_node(pos, {name="lightsplus:slab_light_on_gold"})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:slab_light_on_gold' then
	minetest.env:add_node(pos, {name="lightsplus:slab_light_gold",})
    nodeupdate(pos)
  end
  if node.name == 'lightsplus:slab_light_inv_gold' then
    minetest.env:add_node(pos, {name="lightsplus:slab_light_inv_on_gold"})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:slab_light_inv_on_gold' then
	minetest.env:add_node(pos, {name="lightsplus:slab_light_inv_gold",})
    nodeupdate(pos)
  end
  if node.name == 'lightsplus:slab_light_wall_gold' then
    minetest.env:add_node(pos, {name="lightsplus:slab_light_wall_on_gold", param2=node.param2})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:slab_light_wall_on_gold' then
	minetest.env:add_node(pos, {name="lightsplus:slab_light_wall_gold", param2=node.param2})
    nodeupdate(pos)
  end
    if node.name == 'lightsplus:light_flat' then
    minetest.env:add_node(pos, {name="lightsplus:light_flat_on", param2=node.param2,})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:light_flat_on' then
    minetest.env:add_node(pos, {name="lightsplus:light_flat", param2=node.param2,})
    nodeupdate(pos)
  end
  if node.name == 'lightsplus:light_flat_gold' then
    minetest.env:add_node(pos, {name="lightsplus:light_flat_on_gold", param2=node.param2,})
    nodeupdate(pos)
  elseif node.name == 'lightsplus:light_flat_on_gold' then
    minetest.env:add_node(pos, {name="lightsplus:light_flat_gold", param2=node.param2,})
    nodeupdate(pos)
  end
end
--NEWLIGHTS - LionsDen's modification



--   Slab Light
minetest.register_node("lightsplus:light_flat", {
	description = "Flat Light",
	tile_images = {"lightsplus_light.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	drawtype = "nodebox",
	node_box = {
			type = "wallmounted",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
		selection_box = {
			type = "wallmounted",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:light_flat_on", {
	description = "Active Flat Light",
	tile_images = {"lightsplus_light.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	drawtype = "nodebox",
	node_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
	selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
	drop = 'lightsplus:light_flat',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=2},
})



--   Crafts
--   Flat Light
minetest.register_craft({
	output = 'lightsplus:light_flat 16',
	recipe = {
		{'lightsplus:light'},
	}
})


--	Back to a (slab) Light
minetest.register_craft({
	type = "shapeless",
	output = "lightsplus:slab_light",
	recipe = {'lightsplus:light_flat 8'},
})

--	Gold Flat Light
minetest.register_node("lightsplus:light_flat_gold", {
	description = "Gold Flat Light",
	tile_images = {"lightsplus_light_gold.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	drawtype = "nodebox",
	node_box = {
			type = "wallmounted",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
		selection_box = {
			type = "wallmounted",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("lightsplus:light_flat_on_gold", {
	description = "Active Gold Flat Light",
	tile_images = {"lightsplus_light_gold.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	drawtype = "nodebox",
	node_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
	selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
	drop = 'lightsplus:light_flat_gold',
	light_source = 14,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=2},
})



--   Crafts
--   Gold Flat Light
minetest.register_craft({
	output = 'lightsplus:light_flat_gold 16',
	recipe = {
		{'lightsplus:light_gold'},
	}
})


--   Back to a (slab) Light
minetest.register_craft({
	type = "shapeless",
	output = "lightsplus:slab_light_gold",
	recipe = {'lightsplus:light_flat_gold 8'},
})




minetest.register_alias("newlights:light", "lightsplus:light")
minetest.register_alias("newlights:light_on", "lightsplus:light_on")
minetest.register_alias("newlights:slab_light", "lightsplus:light_flat")
minetest.register_alias("newlights:slab_light_on", "lightsplus:light_flat_on")



--   Register the function for use.

print("[Lights+] Loaded!")

minetest.register_on_punchnode(on_light_puncher)