-----------------------------------------------------------------------------------------------
local title		= "Ferns" -- former "Archae Plantae"
local version 	= "0.1.2"
local mname		= "ferns" -- former "archaeplantae"
-----------------------------------------------------------------------------------------------
-- (by Mossmanikin)
-- License (everything): 	WTFPL
-----------------------------------------------------------------------------------------------
abstract_ferns = {}

local conf_name = "config.txt"
local conf_abs_path = minetest.get_modpath("ferns") .. "/" .. conf_name

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f)
   	return true
   else
   	return false
   end
end

if file_exists(conf_abs_path) then
	dofile(minetest.get_modpath("ferns").."/config.txt")
-- Config found but not all variables must be in it.

	if Lady_fern == nil then
		Lady_fern = true
	end
	if Horsetails == nil then
		Horsetails = true
	end
	if Tree_Fern == nil then
		Tree_Fern = true
	end
	if Giant_Tree_Fern == nil then
		Giant_Tree_Fern = true
	end

	if Ferns_near_Tree == nil then
		Ferns_near_Tree = true
	end
	if Ferns_near_Rock == nil then
		Ferns_near_Rock = true
	end
	if Ferns_near_Ores == nil then
		Ferns_near_Ores = false
	end
	if Ferns_in_Groups == nil then
		Ferns_in_Groups = false
	end

	if Horsetails_Spawning == nil then
		Horsetails_Spawning = true
	end
	if Horsetails_on_Grass == nil then
		Horsetails_on_Grass = true
	end
	if Horsetails_on_Stony == nil then
		Horsetails_on_Stony = true
	end

	if Tree_Ferns_in_Jungle == nil then
		Tree_Ferns_in_Jungle = true
	end
	if Tree_Ferns_for_Oases == nil then
		Tree_Ferns_for_Oases = true
	end

	if Giant_Tree_Ferns_in_Jungle == nil then
		Giant_Tree_Ferns_in_Jungle = true
	end
	if Giant_Tree_Ferns_for_Oases == nil then
		Giant_Tree_Ferns_for_Oases = true
	end
else
	-- config not found so we should set all variables to default ones
	Lady_fern		= true
	Horsetails 		= true
	Tree_Fern 		= true
	Giant_Tree_Fern = true

	-- Where should they generate/spawn? (if they generate/spawn)
	--  Lady-Fern
	Ferns_near_Tree = true
	Ferns_near_Rock = true
	Ferns_near_Ores = false
	Ferns_in_Groups = false
	--
	--	Horsetails
	Horsetails_Spawning = true
	Horsetails_on_Grass = true
	Horsetails_on_Stony = true
	--
	-- Tree_Fern
	Tree_Ferns_in_Jungle = true
	Tree_Ferns_for_Oases = true
	--
	-- Giant_Tree_Fern
	Giant_Tree_Ferns_in_Jungle = true
	Giant_Tree_Ferns_for_Oases = true
end

if Lady_fern == true then
dofile(minetest.get_modpath("ferns").."/fern.lua")
end

if Horsetails == true then
	dofile(minetest.get_modpath("ferns").."/horsetail.lua")
end

if Tree_Fern == true then
	dofile(minetest.get_modpath("ferns").."/treefern.lua")
end

if Giant_Tree_Fern == true then
	dofile(minetest.get_modpath("ferns").."/gianttreefern.lua")
end

dofile(minetest.get_modpath("ferns").."/crafting.lua")

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------