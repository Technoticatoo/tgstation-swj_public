/obj/machinery/vending/imperial
	name = "Imperial Stormtrooper Armory Dispenser"
	desc = "An equipment vendor for all Imperial Stormtroopers."
	product_ads = "For the Empire!;For the Emperor!;Crack rebel skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Stun them, bro.;Why not have a dethstick?"
	icon = 'icons/starwars/vending.dmi'
	icon_state = "stormtrooper"
	icon_deny = "stormtrooper-deny"
	req_access = list(ACCESS_SECURITY)
	products = list(/obj/item/gun/energy/e_gun/E11 = 3,
					/obj/item/gun/energy/ionrifle/e12d = 1,
		            /obj/item/clothing/shoes/imperial = 3,
		            /obj/item/clothing/under/imperial = 3,
		            /obj/item/clothing/under/imperial/stormtrooper = 3,
		            /obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper = 3,
		            /obj/item/grenade/flashbang = 10,
		            /obj/item/restraints/handcuffs = 20,
		            /obj/item/storage/backpack/security = 3,
		            /obj/item/radio/headset/headset_sec = 3,
		            /obj/item/clothing/gloves/combat = 3,
		            /obj/item/tank/internals/oxygen/red = 3)
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	default_price = 100
	extra_price = 150
	payment_department = ACCOUNT_SEC