
minetest.register_node("scaffolding:scaffolding", {
		description = "scaffolding",
		drawtype = "nodebox",
		tiles = {"scaffolding_wooden_scaffolding_top.png", "scaffolding_wooden_scaffolding_top.png", "scaffolding_wooden_scaffolding.png",
		"scaffolding_wooden_scaffolding.png", "scaffolding_wooden_scaffolding.png", "scaffolding_wooden_scaffolding.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		climbable = true,
		walkable = false,
		is_ground_content = true,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		sounds = default.node_sound_wood_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
	})

minetest.register_node("scaffolding:iron_scaffolding", {
		description = "scaffolding",
		drawtype = "nodebox",
		tiles = {"scaffolding_iron_scaffolding_top.png", "scaffolding_iron_scaffolding_top.png", "scaffolding_iron_scaffolding.png",
		"scaffolding_iron_scaffolding.png", "scaffolding_iron_scaffolding.png", "scaffolding_iron_scaffolding.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		climbable = true,
		walkable = true,
		is_ground_content = true,
		groups = {snappy=2,cracky=3},
		sounds = default.node_sound_wood_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
	})

minetest.register_craft({
	output = 'scaffolding:scaffolding 6',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:stick', '', 'default:stick'},
		{'default:wood', 'default:wood', 'default:wood'},
	}
})

minetest.register_craft({
	output = 'scaffolding:iron_scaffolding 6',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'default:wood', 'default:wood', 'default:wood'},
	}
})

scaffolding_nodenames={"scaffolding:scaffolding"}

minetest.register_on_dignode(function(pos, node)
	local i=1
	while scaffolding_nodenames[i]~=nil do
		if node.name==scaffolding_nodenames[i] then
			np={x=pos.x, y=pos.y+1, z=pos.z}
			while minetest.env:get_node(np).name==scaffolding_nodenames[i] do
				minetest.env:remove_node(np)
				minetest.env:add_item(np, scaffolding_nodenames[i])
				np={x=np.x, y=np.y+1, z=np.z}
			end
		end
		i=i+1
	end
end)

iron_scaffolding_nodenames={"scaffolding:iron_scaffolding"}

minetest.register_on_dignode(function(pos, node)
	local i=1
	while iron_scaffolding_nodenames[i]~=nil do
		if node.name==iron_scaffolding_nodenames[i] then
			np={x=pos.x, y=pos.y, z=pos.z+1}
			while minetest.env:get_node(np).name==iron_scaffolding_nodenames[i] do
				minetest.env:remove_node(np)
				minetest.env:add_item(np, iron_scaffolding_nodenames[i])
				np={x=np.x, y=np.y, z=np.z+1}
			end
		end
		i=i+1
	end
end)

minetest.register_on_dignode(function(pos, node)
	local i=1
	while iron_scaffolding_nodenames[i]~=nil do
		if node.name==iron_scaffolding_nodenames[i] then
			np={x=pos.x, y=pos.y, z=pos.z-1}
			while minetest.env:get_node(np).name==iron_scaffolding_nodenames[i] do
				minetest.env:remove_node(np)
				minetest.env:add_item(np, iron_scaffolding_nodenames[i])
				np={x=np.x, y=np.y, z=np.z-1}
			end
		end
		i=i-1
	end
end)

minetest.register_on_dignode(function(pos, node)
	local i=1
	while iron_scaffolding_nodenames[i]~=nil do
		if node.name==iron_scaffolding_nodenames[i] then
			np={x=pos.x+1, y=pos.y, z=pos.z}
			while minetest.env:get_node(np).name==iron_scaffolding_nodenames[i] do
				minetest.env:remove_node(np)
				minetest.env:add_item(np, iron_scaffolding_nodenames[i])
				np={x=np.x+1, y=np.y, z=np.z}
			end
		end
		i=i+1
	end
end)

minetest.register_on_dignode(function(pos, node)
	local i=1
	while iron_scaffolding_nodenames[i]~=nil do
		if node.name==iron_scaffolding_nodenames[i] then
			np={x=pos.x-1, y=pos.y, z=pos.z}
			while minetest.env:get_node(np).name==iron_scaffolding_nodenames[i] do
				minetest.env:remove_node(np)
				minetest.env:add_item(np, iron_scaffolding_nodenames[i])
				np={x=np.x-1, y=np.y, z=np.z}
			end
		end
		i=i-1
	end
end)

if minetest.setting_get("log_mods") then
	minetest.log("action", "scaffolding loaded")
end
-- slight tuning by pitriss
