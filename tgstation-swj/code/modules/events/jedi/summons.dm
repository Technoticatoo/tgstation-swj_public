/datum/round_event_control/jedi/summonguns //The Classic
	name = "Summon Guns"
	weight = 1
	typepath = /datum/round_event/jedi/summonguns
	max_occurrences = 1
	earliest_start = 0 MINUTES

/datum/round_event_control/jedi/summonguns/New()
	if(CONFIG_GET(flag/no_summon_guns))
		weight = 0
	..()

/datum/round_event/jedi/summonguns/start()
	rightandwrong(SUMMON_GUNS, null, 10)

/datum/round_event_control/jedi/summonmagic //The Somewhat Less Classic
	name = "Summon Magic"
	weight = 1
	typepath = /datum/round_event/jedi/summonmagic
	max_occurrences = 1
	earliest_start = 0 MINUTES

/datum/round_event_control/jedi/summonmagic/New()
	if(CONFIG_GET(flag/no_summon_magic))
		weight = 0
	..()

/datum/round_event/jedi/summonmagic/start()
	rightandwrong(SUMMON_MAGIC, null, 10)
