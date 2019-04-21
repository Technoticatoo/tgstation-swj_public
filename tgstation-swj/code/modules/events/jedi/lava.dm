/datum/round_event_control/jedi/lava //THE LEGEND NEVER DIES
	name = "The Floor Is LAVA!"
	weight = 2
	typepath = /datum/round_event/jedi/lava
	max_occurrences = 3
	earliest_start = 0 MINUTES

/datum/round_event/jedi/lava
	endWhen = 0
	var/started = FALSE

/datum/round_event/jedi/lava/start()
	if(!started)
		started = TRUE
		SSweather.run_weather(/datum/weather/floor_is_lava)
