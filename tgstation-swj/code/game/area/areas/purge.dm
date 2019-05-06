/*
### This file contains a list of all the areas in your station. Format is as follows:
/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = 'ICON FILENAME' 			(defaults to 'icons/turf/areas.dmi')
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = FALSE 				(defaults to true)
	music = null					(defaults to nothing, look in sound/ambience for music)

purge areas
*/




/area/purge/sec/cell_block_1
	name = "Cell Block One"
	icon_state = "maint_chapel"

/area/purge/sec/cell_block_2
	name = "Cell Block Two"
	icon_state = "maint_chapel"

/area/purge/sec/cell_hallway_west
	name = "Cell Block West Hallway"
	icon_state = "security"

/area/purge/sec/cell_hallway_east
	name = "Cell Block East Hallway"
	icon_state = "security"

/area/purge/sec/cell_middle
	name = "Cell Block Central Hall"
	icon_state = "security"

/area/purge/sec/central_ring
	name = "Cell Block Central Ring"
	icon_state = "security"

/area/purge/sec/command_hall
	name = "Command Hall"
	icon_state = "bridge_hallway"

/area/purge/sec/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/purge/sec/captains_quarters
	name = "Captains Quarters"
	icon_state = "captain"

/area/purge/sec/bridge_armory
	name = "Bridge Armory"
	icon_state = "armory"