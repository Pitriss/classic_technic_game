local time_scale = 1
local time_speed = tonumber(minetest.setting_get("time_speed"))

if time_speed and time_speed > 0 then
	time_scale = 72 / time_speed
end

function farming:add_plant(full_grown, names, interval, chance)

	if interval*time_scale >= 1 then
		interval = interval*time_scale
	else
		interval = 1
	end

	minetest.register_abm({
		nodenames = names,
		interval = interval,
		chance = chance,
		action = function(pos, node)
			pos.y = pos.y-1
			if minetest.env:get_node(pos).name ~= "farming:soil_wet" then
				return
			end
			pos.y = pos.y+1
			if not minetest.env:get_node_light(pos) then
				return
			end
			if minetest.env:get_node_light(pos) < 8 then
				return
			end
			local step = nil
			for i,name in ipairs(names) do
				if name == node.name then
					step = i
					break
				end
			end
			if step == nil then
				return
			end
			local new_node = {name=names[step+1]}
			if new_node.name == nil then
				new_node.name = full_grown
			end
			minetest.env:set_node(pos, new_node)
		end
}	)
end

function farming:generate_tree(pos, trunk, leaves, underground, replacements)
	pos.y = pos.y-1
	local nodename = minetest.env:get_node(pos).name
	local ret = true
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = false
			break
		end
	end
	pos.y = pos.y+1
	if not minetest.env:get_node_light(pos) then
		return
	end
	if ret or minetest.env:get_node_light(pos) < 8 then
		return
	end

	node = {name = ""}
	for dy=1,4 do
		pos.y = pos.y+dy
		if minetest.env:get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y-dy
	end
	node.name = trunk
	for dy=0,4 do
		pos.y = pos.y+dy
		minetest.env:set_node(pos, node)
		pos.y = pos.y-dy
	end

	if not replacements then
		replacements = {}
	end

	node.name = leaves
	pos.y = pos.y+3
	for dx=-2,2 do
		for dz=-2,2 do
			for dy=0,3 do
				pos.x = pos.x+dx
				pos.y = pos.y+dy
				pos.z = pos.z+dz

				if dx == 0 and dz == 0 and dy==3 then
					if minetest.env:get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.env:set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.env:set_node(pos, {name=name})
							end
						end
					end
				elseif dx == 0 and dz == 0 and dy==4 then
					if minetest.env:get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.env:set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.env:set_node(pos, {name=name})
							end
						end
					end
				elseif math.abs(dx) ~= 2 and math.abs(dz) ~= 2 then
					if minetest.env:get_node(pos).name == "air" then
						minetest.env:set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.env:set_node(pos, {name=name})
							end
						end
					end
				else
					if math.abs(dx) ~= 2 or math.abs(dz) ~= 2 then
						if minetest.env:get_node(pos).name == "air" and math.random(1, 5) <= 4 then
							minetest.env:set_node(pos, node)
							for name,rarity in pairs(replacements) do
								if math.random(1, rarity) == 1 then
								minetest.env:set_node(pos, {name=name})
								end
							end
						end
					end
				end

				pos.x = pos.x-dx
				pos.y = pos.y-dy
				pos.z = pos.z-dz
			end
		end
	end
end

--
-- Place seeds
--
function farmingplus_place_seed(itemstack, placer, pointed_thing, plantname)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y+1 then
		return
	end

	-- check if you can replace the node above the pointed node
	if not minetest.registered_nodes[above.name].buildable_to then
		return
	end

	-- check if pointing at soil
	if minetest.get_item_group(under.name, "soil") <= 1 then
		return
	end

	-- add the node and remove 1 item from the itemstack
	minetest.add_node(pt.above, {name=plantname})
	if not minetest.setting_getbool("creative_mode") then
		itemstack:take_item()
	end
	return itemstack
end

farming.seeds = {
	["farming:pumpkin_seed"]=60,
	["farming_plus:strawberry_seed"]=30,
	["farming_plus:rhubarb_seed"]=30,
	["farming_plus:potatoe_seed"]=30,
	["farming_plus:tomato_seed"]=30,
	["farming_plus:orange_seed"]=30,
	["farming_plus:carrot_seed"]=30,
}

-- ========= ALIASES FOR FARMING MOD BY SAPIER =========
-- potatoe -> potatoe
minetest.register_alias("farming:potatoe_node", "farming_plus:potatoe")
--minetest.register_alias("farming:potatoe", "farming:potatoe_item") cant do this
minetest.register_alias("farming:potatoe_straw", "farming_plus:potatoe")
minetest.register_alias("farming:seed_potatoe", "farming_plus:potatoe_seed")
for lvl = 1, 6, 1 do
	minetest.register_entity(":farming:potatoe_lvl"..lvl, {
		on_activate = function(self, staticdata)
			minetest.env:set_node(self.object:getpos(), {name="farming_plus:potatoe_1"})
		end
	})
end


minetest.register_alias("farming:cotton", "farming:cotton_3")
minetest.register_alias("farming:wheat_harvested", "farming:wheat")
minetest.register_alias("farming:dough", "farming:flour")
minetest.register_abm({
	nodenames = {"farming:wheat"},
	interval = 1,
	chance = 1,
	action = function(pos)
		minetest.env:set_node(pos, {name="farming:wheat_8"})
	end,
})

-- ========= STRAWBERRIES =========
dofile(minetest.get_modpath("farming_plus").."/strawberries.lua")

-- ========= RHUBARB =========
dofile(minetest.get_modpath("farming_plus").."/rhubarb.lua")

-- ========= POTATOES =========
dofile(minetest.get_modpath("farming_plus").."/potatoes.lua")

-- ========= TOMATOES =========
dofile(minetest.get_modpath("farming_plus").."/tomatoes.lua")

-- ========= ORANGES =========
dofile(minetest.get_modpath("farming_plus").."/oranges.lua")

-- ========= BANANAS =========
dofile(minetest.get_modpath("farming_plus").."/bananas.lua")

-- ========= CARROTS =========
dofile(minetest.get_modpath("farming_plus").."/carrots.lua")

-- ========= COCOA =========
dofile(minetest.get_modpath("farming_plus").."/cocoa.lua")

-- ========= PUMPKIN =========
dofile(minetest.get_modpath("farming_plus").."/pumpkin.lua")

-- ========= WEED =========
dofile(minetest.get_modpath("farming_plus").."/weed.lua")
