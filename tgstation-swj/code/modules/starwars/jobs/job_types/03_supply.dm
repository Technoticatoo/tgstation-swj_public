/*
Quartermaster
*/
/datum/job/qm
	title = "Quartermaster"
	flag = QUARTERMASTER
	department_head = list("Lieutenant")
	department_flag = SUPPLY
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Lieutenant"
	selection_color = "#d7b088"

	outfit = /datum/outfit/job/quartermaster

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_VAULT)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_VAULT)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR

/datum/outfit/job/quartermaster
	name = "Quartermaster"
	jobtype = /datum/job/qm

	belt = /obj/item/pda/quartermaster
	ears = /obj/item/radio/headset/headset_cargo
	uniform = /obj/item/clothing/under/rank/cargo
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/clipboard
	backpack_contents = list(/obj/item/card/id/departmental_budget/car=1)

	chameleon_extras = /obj/item/stamp/qm

/*
Away Team Leader
*/
/datum/job/away_lead
	title = "Away Team Leader"
	flag = AWAYLEAD
	department_head = list("Quartermaster")
	department_flag = SUPPLY
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the quartermaster"
	selection_color = "#d8b48d"

	outfit = /datum/outfit/job/away_lead

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CAR

/datum/outfit/job/away_lead
	name = "Away Team Leader"
	jobtype = /datum/job/away_lead

	belt = /obj/item/pda/cargo
	ears = /obj/item/radio/headset/headset_cargo
	uniform = /obj/item/clothing/under/rank/cargotech
	l_hand = /obj/item/export_scanner

/*
Cargo Technician
*/
/datum/job/cargo_tech
	title = "Cargo Technician"
	flag = CARGOTECH
	department_head = list("Quartermaster")
	department_flag = SUPPLY
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the quartermaster and the Lieutenant"
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/cargo_tech

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CAR

/datum/outfit/job/cargo_tech
	name = "Cargo Technician"
	jobtype = /datum/job/cargo_tech

	belt = /obj/item/pda/cargo
	ears = /obj/item/radio/headset/headset_cargo
	uniform = /obj/item/clothing/under/rank/cargotech
	l_hand = /obj/item/export_scanner

/*
Requisitions Officer
*/
/datum/job/req_off
	title = "Requisitions Officer"
	flag = REQOFF
	department_head = list("Quartermaster")
	department_flag = SUPPLY
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the quartermaster"
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/req_off

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CAR

/datum/outfit/job/req_off
	name = "Requisitions Officer"
	jobtype = /datum/job/req_off

	belt = /obj/item/pda/cargo
	ears = /obj/item/radio/headset/headset_cargo
	uniform = /obj/item/clothing/under/rank/cargotech
	l_hand = /obj/item/export_scanner

/*
Shaft Miner
*/
/datum/job/mining
	title = "Shaft Miner"
	flag = MINER
	department_head = list("Lieutenant")
	department_flag = SUPPLY
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the quartermaster and the Lieutenant"
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/miner

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_CAR

/datum/outfit/job/miner
	name = "Shaft Miner"
	jobtype = /datum/job/mining

	belt = /obj/item/pda/shaftminer
	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/rank/miner/lavaland
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/survival
	r_pocket = /obj/item/flashlight/seclite
	backpack_contents = list(
		/obj/item/storage/bag/ore=1,\
		/obj/item/kitchen/knife/combat/survival=1,\
		/obj/item/mining_voucher=1,\
		/obj/item/stack/marker_beacon/ten=1)

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag
	box = /obj/item/storage/box/survival_mining

	chameleon_extras = /obj/item/gun/energy/kinetic_accelerator

/datum/outfit/job/miner/equipped
	name = "Shaft Miner (Equipment)"
	suit = /obj/item/clothing/suit/hooded/explorer
	mask = /obj/item/clothing/mask/gas/explorer
	glasses = /obj/item/clothing/glasses/meson
	suit_store = /obj/item/tank/internals/oxygen
	internals_slot = SLOT_S_STORE
	backpack_contents = list(
		/obj/item/storage/bag/ore=1,
		/obj/item/kitchen/knife/combat/survival=1,
		/obj/item/mining_voucher=1,
		/obj/item/t_scanner/adv_mining_scanner/lesser=1,
		/obj/item/gun/energy/kinetic_accelerator=1,\
		/obj/item/stack/marker_beacon/ten=1)

/datum/outfit/job/miner/equipped/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(istype(H.wear_suit, /obj/item/clothing/suit/hooded))
		var/obj/item/clothing/suit/hooded/S = H.wear_suit
		S.ToggleHood()

/datum/outfit/job/miner/equipped/hardsuit
	name = "Shaft Miner (Equipment + Hardsuit)"
	suit = /obj/item/clothing/suit/space/hardsuit/mining
	mask = /obj/item/clothing/mask/breath



