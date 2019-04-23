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
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Emperor"
	selection_color = "#ccccff"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
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

