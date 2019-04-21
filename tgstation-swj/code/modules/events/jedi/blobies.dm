/datum/round_event_control/jedi/blobies //avast!
	name = "Zombie Outbreak"
	weight = 3
	typepath = /datum/round_event/jedi/blobies
	max_occurrences = 3

/datum/round_event/jedi/blobies/start()

	for(var/mob/living/carbon/human/H in GLOB.dead_mob_list)
		new /mob/living/simple_animal/hostile/blob/blobspore(H.loc)
