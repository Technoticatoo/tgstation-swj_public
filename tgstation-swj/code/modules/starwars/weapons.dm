//E11
/obj/item/gun/energy/e_gun/E11
	name = "E-11 Blaster Rifle"
	desc = "Combined lethal firepower with impressive range and a versatile design, an advanced cooling system resulted in this blaster's superior performance. Contains two settings: Stun and Kill!"
	icon = 'icons/starwars/weapons.dmi'
	icon_state = "e11"
	item_state = null	//so the human update icon uses the icon_state instead.
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/e11, /obj/item/ammo_casing/energy/laser/e11)
	modifystate = 1
	can_flashlight = 1
	ammo_x_offset = -3
	flight_x_offset = 15
	flight_y_offset = 10

//a280
/obj/item/gun/energy/laser/a280
	name = "A280 Blaster Rifle"
	desc = "It is highly effective in piercing through armor and provides more power than other blaster rifles at long range. It features a power charge system and integrated muzzle compensator."
	icon = 'icons/starwars/weapons.dmi'
	icon_state = "a280"
	item_state = "a280"
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(MAT_METAL=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/laser/a280)
	ammo_x_offset = 1
	shaded_charge = 1

//E12D
/obj/item/gun/energy/ionrifle/e12d
	name = "E-12D Ion Disruptor"
	desc = "Based of the original E-11's design, this Ion Disruptor will short out any and all electrical circuits caught in the blast."
	icon = 'icons/starwars/weapons.dmi'
	icon_state = "e12d"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	ammo_x_offset = 4
	flight_x_offset = 18
	flight_y_offset = 11
	ammo_type = list(/obj/item/ammo_casing/energy/ion/e12d)