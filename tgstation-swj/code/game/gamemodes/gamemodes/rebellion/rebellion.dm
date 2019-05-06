// To add a rev to the list of rebellionaries, make sure it's rev (with if(SSticker.mode.name == "rebellion)),
// then call SSticker.mode:add_rebel(_THE_PLAYERS_MIND_)
// nothing else needs to be done, as that proc will check if they are a valid target.
// Just make sure the converter is a head before you call it!
// To remove a rev (from brainwashing or w/e), call SSticker.mode:remove_rebel(_THE_PLAYERS_MIND_),
// this will also check they're not a head, so it can just be called freely
// If the game somtimes isn't registering a win properly, then SSticker.mode.check_win() isn't being called somewhere.


/datum/game_mode/rebellion
	name = "rebellion"
	config_tag = "rebellion"
	antag_flag = ROLE_REV
	false_report_weight = 10
	restricted_jobs = list("Stormtrooper", "Master Sergeant", "Interrogator", "AI", "Cyborg","Captain", "Lieutenant", "Stormtrooper Commander", "Chief Engineer", "Science Director", "Chief Medical Officer")
	required_players = 5
	required_enemies = 2
	recommended_enemies = 3
	enemy_minimum_age = 14

	announce_span = "danger"
	announce_text = "Some crewmembers are attempting a coup!\n\
	<span class='danger'>Rebels</span>: Expand your cause and overthrow the heads of staff by execution or otherwise.\n\
	<span class='notice'>Crew</span>: Prevent the rebels from taking over the station."

	var/finished = 0
	var/check_counter = 0
	var/max_headrevs = 3
	var/datum/team/rebellion/rebellion
	var/list/datum/mind/headrev_candidates = list()
	var/end_when_heads_dead = TRUE

///////////////////////////
//Announces the game type//
///////////////////////////
/datum/game_mode/rebellion/announce()
	to_chat(world, "<B>The current game mode is - Rebellion!</B>")
	to_chat(world, "<B>Some crewmembers are attempting to start a rebellion!<BR>\nRebels - Kill the Captain, HoP, HoS, CE, RD and CMO. Convert other crewmembers (excluding the heads of staff, and Stormtroopers) to your cause by flashing them. Protect your leaders.<BR>\nPersonnel - Protect the heads of staff. Kill the leaders of the rebellion, and brainwash the other rebels (by beating them in the head).</B>")


///////////////////////////////////////////////////////////////////////////////
//Gets the round setup, cancelling if there's not enough players at the start//
///////////////////////////////////////////////////////////////////////////////
/datum/game_mode/rebellion/pre_setup()

	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		restricted_jobs += protected_jobs

	if(CONFIG_GET(flag/protect_assistant_from_antagonist))
		restricted_jobs += "Assistant"

	for (var/i=1 to max_headrevs)
		if (antag_candidates.len==0)
			break
		var/datum/mind/lenin = antag_pick(antag_candidates)
		antag_candidates -= lenin
		headrev_candidates += lenin
		lenin.restricted_roles = restricted_jobs

	if(headrev_candidates.len < required_enemies)
		setup_error = "Not enough headrev candidates"
		return FALSE

	return TRUE

/datum/game_mode/rebellion/post_setup()
	var/list/heads = SSjob.get_living_heads()
	var/list/sec = SSjob.get_living_sec()
	var/weighted_score = min(max(round(heads.len - ((8 - sec.len) / 3)),1),max_headrevs)

	for(var/datum/mind/rev_mind in headrev_candidates)	//People with return to lobby may still be in the lobby. Let's pick someone else in that case.
		if(isnewplayer(rev_mind.current))
			headrev_candidates -= rev_mind
			var/list/newcandidates = shuffle(antag_candidates)
			if(newcandidates.len == 0)
				continue
			for(var/M in newcandidates)
				var/datum/mind/lenin = M
				antag_candidates -= lenin
				newcandidates -= lenin
				if(isnewplayer(lenin.current)) //We don't want to make the same mistake again
					continue
				else
					var/mob/Nm = lenin.current
					if(Nm.job in restricted_jobs)	//Don't make the HOS a replacement revhead
						antag_candidates += lenin	//Let's let them keep antag chance for other antags
						continue

					headrev_candidates += lenin
					break

	while(weighted_score < headrev_candidates.len) //das vi danya
		var/datum/mind/trotsky = pick(headrev_candidates)
		antag_candidates += trotsky
		headrev_candidates -= trotsky

	rebellion = new()

	for(var/datum/mind/rev_mind in headrev_candidates)
		log_game("[key_name(rev_mind)] has been selected as a head rev")
		var/datum/antagonist/rev/head/new_head = new()
		new_head.give_flash = TRUE
		new_head.give_hud = TRUE
		new_head.remove_clumsy = TRUE
		rev_mind.add_antag_datum(new_head,rebellion)

	rebellion.update_objectives()
	rebellion.update_heads()

	SSshuttle.registerHostileEnvironment(src)
	..()


/datum/game_mode/rebellion/process()
	check_counter++
	if(check_counter >= 5)
		if(!finished)
			SSticker.mode.check_win()
		check_counter = 0
	return FALSE

//////////////////////////////////////
//Checks if the revs have won or not//
//////////////////////////////////////
/datum/game_mode/rebellion/check_win()
	if(check_rev_victory())
		finished = 1
	else if(check_heads_victory())
		finished = 2
	return

///////////////////////////////
//Checks if the round is over//
///////////////////////////////
/datum/game_mode/rebellion/check_finished()
	if(CONFIG_GET(keyed_list/continuous)["rebellion"])
		if(finished)
			SSshuttle.clearHostileEnvironment(src)
		return ..()
	if(finished != 0 && end_when_heads_dead)
		return TRUE
	else
		return ..()

///////////////////////////////////////////////////
//Deals with converting players to the rebellion//
///////////////////////////////////////////////////
/proc/is_rebel(mob/M)
	return M && istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/rev)

/proc/is_head_rebel(mob/M)
	return M && istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/rev/head)

//////////////////////////
//Checks for rev victory//
//////////////////////////
/datum/game_mode/rebellion/proc/check_rev_victory()
	for(var/datum/objective/mutiny/objective in rebellion.objectives)
		if(!(objective.check_completion()))
			return FALSE
	return TRUE

/////////////////////////////
//Checks for a head victory//
/////////////////////////////
/datum/game_mode/rebellion/proc/check_heads_victory()
	for(var/datum/mind/rev_mind in rebellion.head_rebels())
		var/turf/T = get_turf(rev_mind.current)
		if(!considered_afk(rev_mind) && considered_alive(rev_mind) && is_station_level(T.z))
			if(ishuman(rev_mind.current))
				return FALSE
	return TRUE


/datum/game_mode/rebellion/set_round_result()
	..()
	if(finished == 1)
		SSticker.mode_result = "win - heads killed"
		SSticker.news_report = REVS_WIN
	else if(finished == 2)
		SSticker.mode_result = "loss - rev heads killed"
		SSticker.news_report = REVS_LOSE

//TODO What should be displayed for revs in non-rev rounds
/datum/game_mode/rebellion/special_report()
	if(finished == 1)
		return "<span class='redtext big'>The heads of staff were killed or exiled! The rebels win!</span>"
	else if(finished == 2)
		return "<span class='redtext big'>The heads of staff managed to stop the rebellion!</span>"

/datum/game_mode/rebellion/generate_report()
	return "Employee unrest has spiked in recent weeks, with several attempted mutinies on heads of staff. Some crew have been observed using flashbulb devices to blind their colleagues, \
		who then follow their orders without question and work towards dethroning departmental leaders. Watch for behavior such as this with caution. If the crew attempts a mutiny, you and \
		your heads of staff are fully authorized to execute them using lethal weaponry - they will be later cloned and interrogated at Central Command."

/datum/game_mode/rebellion/extended
	name = "extended_rebellion"
	config_tag = "extended_rebellion"
	end_when_heads_dead = FALSE

/datum/game_mode/rebellion/speedy
	name = "speedy_rebellion"
	config_tag = "speedy_rebellion"
	end_when_heads_dead = FALSE
	var/endtime = null
	var/fuckingdone = FALSE

/datum/game_mode/rebellion/speedy/pre_setup()
	endtime = world.time + 20 MINUTES
	return ..()

/datum/game_mode/rebellion/speedy/process()
	. = ..()
	if(check_counter == 0)
		if (world.time > endtime && !fuckingdone)
			fuckingdone = TRUE
			for (var/obj/machinery/nuclearbomb/N in GLOB.nuke_list)
				if (!N.timing)
					N.timer_set = 200
					N.set_safety()
					N.set_active()