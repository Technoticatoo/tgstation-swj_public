/datum/job/prisoner
	title = "Prisoner"
	flag = PRISONER
	department_head = list("Lieutenant")
	department_flag = CIVILIAN
	faction = "Prisoners"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Lieutenant"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/curator

	access = list(ACCESS_LIBRARY)
	minimal_access = list(ACCESS_LIBRARY, ACCESS_CONSTRUCTION,ACCESS_MINING_STATION)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CIV


/datum/outfit/job/curator
	name = "Curator"
	jobtype = /datum/job/curator

	belt = /obj/item/pda/curator
	uniform = /obj/item/clothing/under/rank/curator
	l_hand = /obj/item/storage/bag/books
	r_pocket = /obj/item/key/displaycase
	l_pocket = /obj/item/laser_pointer
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	backpack_contents = list(
		/obj/item/melee/curator_whip = 1,
		/obj/item/soapstone = 1,
		/obj/item/barcodescanner = 1
	)


/datum/outfit/job/curator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return