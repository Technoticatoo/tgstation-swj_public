/datum/job/sith/equip(mob/living/carbon/human/H, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
    ..()
    if (visualsOnly)
        return
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceck(null))
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/forceth(null))
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceln(null))
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceslow(null))



/datum/job/sith
	title = "Sith"
	flag = SITH
	department_head = list("CentCom")
	department_flag = COUNCIL
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Emperor"
	selection_color = "#afafaf"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180
	exp_type = EXP_TYPE_COMMAND
	var/hud_version = "jedi"

	outfit = /datum/outfit/job/sith

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

/datum/job/sith/get_access()
	return get_all_accesses()

/datum/outfit/job/sith
	name = "Sith"
	jobtype = /datum/job/sith

	id = /obj/item/card/id/gold
	belt = /obj/item/pda/sith
	ears = /obj/item/radio/headset/heads/sith/alt
	gloves = /obj/item/clothing/gloves/color/sith
	uniform =  /obj/item/clothing/under/rank/sith
	//suit = /obj/item/clothing/suit/armor/vest/sithcarapace
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/sithat
	backpack_contents = list(/obj/item/melee/transforming/energy/sword/saber/red=1, /obj/item/card/id/departmental_budget/civ=1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/sith/hardsuit
	name = "Sith (Hardsuit)"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/sith
	suit_store = /obj/item/tank/internals/oxygen

/datum/job/sith/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "Sith Lord [H.real_name] on deck, tremble in fear, you who are disloyal!"))


/*
Sith Acolyte
*/
/datum/job/chaplain
	title = "Sith Acolyte"
	flag = COUNCIL
	department_head = list("Sith")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Sith Lord"
	selection_color = "#d9d9d9"

	outfit = /datum/outfit/job/chaplain

	access = list(ACCESS_MORGUE, ACCESS_CHAPEL_OFFICE, ACCESS_CREMATORIUM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_MORGUE, ACCESS_CHAPEL_OFFICE, ACCESS_CREMATORIUM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CIV


/datum/job/chaplain/after_spawn(mob/living/H, mob/M)
	if(H.mind)
		H.mind.isholy = TRUE

	var/obj/item/storage/book/bible/booze/B = new

	if(SSreligion.religion)
		B.deity_name = SSreligion.deity
		B.name = SSreligion.bible_name
		B.icon_state = SSreligion.bible_icon_state
		B.item_state = SSreligion.bible_item_state
		to_chat(H, "There is already an established religion onboard the station. You are an acolyte of [SSreligion.deity]. Defer to the Sith Acolyte.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = SSreligion.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		H.put_in_hands(N)
		return

	var/new_religion = "Dark Side of the Force"
	if(M.client && M.client.prefs.custom_names["religion"])
		new_religion = M.client.prefs.custom_names["religion"]

	var/new_deity = "The Dark Side"
	if(M.client && M.client.prefs.custom_names["deity"])
		new_deity = M.client.prefs.custom_names["deity"]

	B.deity_name = new_deity


	switch(lowertext(new_religion))
		if("Dark Side of the Force")
			B.name = pick("The Sith Code","The Dark Side Scrolls")
		else
			B.name = "The Sith Code"

	SSreligion.religion = new_religion
	SSreligion.bible_name = B.name
	SSreligion.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)

/datum/outfit/job/chaplain
	name = "Sith Acolyte"
	jobtype = /datum/job/chaplain

	belt = /obj/item/pda/chaplain
	uniform = /obj/item/clothing/under/rank/chaplain
	backpack_contents = list(/obj/item/camera/spooky = 1)
	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack

