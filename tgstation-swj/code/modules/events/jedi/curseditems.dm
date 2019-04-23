/datum/round_event_control/jedi/cursed_items //fashion disasters
	name = "Cursed Items"
	weight = 3
	typepath = /datum/round_event/jedi/cursed_items
	max_occurrences = 3
	earliest_start = 0 MINUTES

//Note about adding items to this: Because of how NODROP_1 works if an item spawned to the hands can also be equiped to a slot
//it will be able to be put into that slot from the hand, but then get stuck there. To avoid this make a new subtype of any
//item you want to equip to the hand, and set its slots_flags = null. Only items equiped to hands need do this.

/datum/round_event/jedi/cursed_items/start()
	var/item_set = pick("jedimimic", "swords", "bigfatdoobie", "boxing", "voicemodulators", "catgirls2015")
	var/list/loadout[SLOTS_AMT]
	var/ruins_spaceworthiness
	var/ruins_jedi_loadout

	switch(item_set)
		if("jedimimic")
			loadout[SLOT_WEAR_SUIT] = /obj/item/clothing/suit/wizrobe
			loadout[SLOT_SHOES] = /obj/item/clothing/shoes/sandal/magic
			loadout[SLOT_HEAD] = /obj/item/clothing/head/jedi
			ruins_spaceworthiness = 1
		if("swords")
			loadout[SLOT_HANDS] = /obj/item/katana/cursed
		if("bigfatdoobie")
			loadout[SLOT_WEAR_MASK] = /obj/item/clothing/mask/cigarette/rollie/trippy
			ruins_spaceworthiness = 1
		if("boxing")
			loadout[SLOT_WEAR_MASK] = /obj/item/clothing/mask/luchador
			loadout[SLOT_GLOVES] = /obj/item/clothing/gloves/boxing
			ruins_spaceworthiness = 1
		if("voicemodulators")
			loadout[SLOT_WEAR_MASK] = /obj/item/clothing/mask/chameleon
		if("catgirls2015")
			loadout[SLOT_HEAD] = /obj/item/clothing/head/kitty
			ruins_spaceworthiness = 1
			ruins_jedi_loadout = 1

	for(var/mob/living/carbon/human/H in GLOB.alive_mob_list)
		if(ruins_spaceworthiness && !is_station_level(H.z) || isspaceturf(H.loc) || isplasmaman(H))
			continue	//#savetheminers
		if(ruins_jedi_loadout && isjedi(H))
			continue
		if(item_set == "catgirls2015") //Jedi code means never having to say you're sorry
			H.gender = FEMALE
		for(var/i in 1 to loadout.len)
			if(loadout[i])
				var/obj/item/J = loadout[i]
				var/obj/item/I = new J //dumb but required because of byond throwing a fit anytime new gets too close to a list
				H.dropItemToGround(H.get_item_by_slot(i), TRUE)
				H.equip_to_slot_or_del(I, i)
				I.item_flags |= NODROP | DROPDEL
				I.name = "cursed " + I.name

	for(var/mob/living/carbon/human/H in GLOB.alive_mob_list)
		var/datum/effect_system/smoke_spread/smoke = new
		smoke.set_up(0, H.loc)
		smoke.start()