--
-- Cake
--
minetest.register_craft({
	output = "farming:dough",
	recipe = {
		{"bushes:sugar","group:milk", "bushes:sugar"},
		{"farming:flour","farming:flour","farming:flour"},
	},
	replacements = {
		{ "group:milk", "vessels:drinking_glass" }
	}
})

minetest.register_craft({
	type = "cooking",
	output = "farming:cake",
	recipe = "farming:dough",
	cooktime = 30,
})

--
-- Rope
--

minetest.register_craft({
	output = "farming:rope",
	recipe = {
	    {"farming:string"},
		{"farming:string"},
		{"farming:string"},
	}
})

--
-- Other
--

--if coconut milk is registered, add it to group milk
if minetest.registered_items["moretrees:coconut_milk"] then
	local convtable = minetest.registered_items["moretrees:coconut_milk"]
	local convtable2 = {}
	for i,v in pairs(convtable) do
		convtable2[i] = v
	end
	if convtable2.groups == nil then
		convtable2.groups = {milk=1}
	else
		convtable2.groups.milk=1
	end
	minetest.register_craftitem(":moretrees:coconut_milk", convtable2)
end

--why not use every milk for making muffins
minetest.register_craft({
	type = "shapeless",
	output = "moretrees:acorn_muffin_batter",
	recipe = {
		"moretrees:acorn",
		"moretrees:acorn",
		"moretrees:acorn",
		"moretrees:acorn",
		"group:milk",
	},
	replacements = {
		{ "group:milk", "vessels:drinking_glass" }
	}
})
