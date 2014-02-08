--[[
Kerova Mod
By AndromedaKerova (AKA; RommieKerova, Rommie, Andromeda) (rommiekerova@gmail.com)
License: WTFPL
Version: 1.0
--]]


-- CHESTS

local dye = {"white", "grey", "dark_grey", "black", "blue", "cyan", "dark_green", "green", "magenta", "orange", "pink", "red", "violet", "yellow"}

for _, row in ipairs(dye) do
	local name = row
	minetest.register_craft({
		output = 'kerova:chest_'..name,
		recipe = {
			{'dye:'..name},
			{'default:chest'},
		}
	})
	minetest.register_craft({
		output = 'kerova:chest_'..name..'_locked',
		recipe = {
			{'dye:'..name},
			{'default:chest_locked'},
		}
	})
end

-- DECORATIVE WOOD
-- #1
minetest.register_craft({
	output = 'kerova:deco_wood_1',
	recipe = {
		{'group:stick','',''},
		{'','default:wood',''},
		{'','',''},
	}
})
-- #2
minetest.register_craft({
	output = 'kerova:deco_wood_2',
	recipe = {
		{'','group:stick',''},
		{'','default:wood',''},
		{'','',''},
	}
})
-- #3
minetest.register_craft({
	output = 'kerova:deco_wood_3',
	recipe = {
		{'','','group:stick'},
		{'','default:wood',''},
		{'','',''},
	}
})
-- #4
minetest.register_craft({
	output = 'kerova:deco_wood_4',
	recipe = {
		{'','',''},
		{'group:stick','default:wood',''},
		{'','',''},
	}
})
-- #5
minetest.register_craft({
	output = 'kerova:deco_wood_5',
	recipe = {
		{'','',''},
		{'','default:wood','group:stick'},
		{'','',''},
	}
})
-- #6
minetest.register_craft({
	output = 'kerova:deco_wood_6',
	recipe = {
		{'','',''},
		{'','default:wood',''},
		{'group:stick','',''},
	}
})
-- #7
minetest.register_craft({
	output = 'kerova:deco_wood_7',
	recipe = {
		{'','',''},
		{'','default:wood',''},
		{'','group:stick',''},
	}
})
-- #8
minetest.register_craft({
	output = 'kerova:deco_wood_8',
	recipe = {
		{'','',''},
		{'','default:wood',''},
		{'','','group:stick'},
	}
})
-- #9
minetest.register_craft({
	output = 'kerova:deco_wood_9',
	recipe = {
		{'','','group:stick'},
		{'','default:wood',''},
		{'group:stick','',''},
	}
})
-- #10
minetest.register_craft({
	output = 'kerova:deco_wood_10',
	recipe = {
		{'','group:stick',''},
		{'group:stick','default:wood','group:stick'},
		{'','group:stick',''},
	}
})


-- GOTHIC FLOOR
minetest.register_craft({
	output = 'kerova:gothic_floor',
	recipe = {
		{'dye:black'},
		{'default:wood'},
	}
})


-- BAMBOO FLOOR
minetest.register_craft({
	output = 'kerova:bamboo_floor',
	recipe = {
		{'default:sapling','group:stick','default:sapling'},
		{'group:stick','default:sapling','group:stick'},
		{'default:sapling','group:stick','default:sapling'},
	}
})

-- Flagstone
minetest.register_craft({
	output = 'kerova:flagstone',
	recipe = {
		{'default:stone'},
		{'moreblocks:iron_stone'},
	}
})

-- Rusticstone
minetest.register_craft({
	output = 'kerova:rusticstone',
	recipe = {
		{'default:stone'},
		{'default:cobble'},
	}
})

-- Rainbow valley left
minetest.register_craft({
	output = 'kerova:rainbow_valley_left',
	recipe = {
		{'group:stick','group:stick','group:stick'},
		{'group:stick','default:paper','default:paper'},
		{'group:stick','group:stick','group:stick'},
	}
})

-- Rainbow valley right
minetest.register_craft({
	output = 'kerova:rainbow_valley_right',
	recipe = {
		{'group:stick','group:stick','group:stick'},
		{'default:paper','default:paper','group:stick'},
		{'group:stick','group:stick','group:stick'},
	}
})

