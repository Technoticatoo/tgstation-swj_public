// Stormtrooper
/obj/item/clothing/head/helmet/space/hardsuit/stormtrooper
	name = "Stormtrooper Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Armoured and mass produced for troopers of the Imperial Army."
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "stormtrooper_helmet"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30,"energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)

/obj/item/clothing/suit/space/hardsuit/stormtrooper
	name = "Stormtrooper Armour"
	desc = "A special armour designed for work in a hazardous, low pressure environment. Armoured and mass produced for troopers of the Imperial Army."
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "stormtrooper_suit"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/stormtrooper


// Stormtrooper Commander
/obj/item/clothing/head/helmet/space/hardsuit/stcommander
	name = "Stormtrooper Commander Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Armoured and mass produced for Commanders of the Imperial Army."
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "stcommander_helmet"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80,"energy" = 80, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)


/obj/item/clothing/suit/space/hardsuit/stcommander
	name = "Stormtrooper Commander Armour"
	desc = "A special armour designed for work in a hazardous, low pressure environment. Armoured and mass produced for Commanders of the Imperial Army."
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "stcommander_suit"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80,"energy" = 80, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/stcommander


// Scouttrooper
/obj/item/clothing/head/helmet/space/hardsuit/scouttrooper
	name = "Scout Trooper Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Armoured and mass produced for scouts of the Imperial Army."
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "scouttrooper_helmet"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30,"energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)


/obj/item/clothing/suit/space/hardsuit/scouttrooper
	name = "Scout Trooper Armour"
	desc = "A special armour designed for work in a hazardous, low pressure environment. Armoured and mass produced for scouts of the Imperial Army."
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "scouttrooper_suit"
	armor = list("melee" = 25, "bullet" = 15, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/scouttrooper

// Sith Hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/sith
	name = "Sith Hardsuit Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. A Sith does not need armour, the force bends to their will... But they still cannot fly in space without help!"
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "sith_helmet"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80,"energy" = 80, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)


/obj/item/clothing/suit/space/hardsuit/sith
	name = "Sith Hardsuit"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. A Sith does not need armour, the force bends to their will... But they still cannot fly in space without help!"
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "sith_suit"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80,"energy" = 80, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/sith
	jetpack = /obj/item/tank/jetpack/suit

// Flame Trooper
/obj/item/clothing/head/helmet/space/hardsuit/flametrooper
	name = "Flametrooper Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. This specification has been fireproofed to protect the trooper inside from the heat!"
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "flametrooper_helmet"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30,"energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 75)
	resistance_flags = FIRE_PROOF
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/flametrooper
	name = "Flametrooper Armour"
	desc = "A special armour designed for work in a hazardous, low pressure environment. This specification has been fireproofed to protect the trooper inside from the heat!"
	alternate_worn_icon = 'icons/starwars/hardsuit_mob.dmi'
	icon = 'icons/starwars/hardsuit_obj.dmi'
	icon_state = "flametrooper_suit"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 75)
	resistance_flags = FIRE_PROOF
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/flametrooper