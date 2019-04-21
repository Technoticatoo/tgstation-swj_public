/datum/round_event_control/jedi/ghost //The spook is real
	name = "G-G-G-Ghosts!"
	weight = 3
	typepath = /datum/round_event/jedi/ghost
	max_occurrences = 1
	earliest_start = 0 MINUTES

/datum/round_event/jedi/ghost/start()
	var/msg = "<span class='warning'>You suddenly feel extremely obvious...</span>"
	set_observer_default_invisibility(0, msg)


//--//

/datum/round_event_control/jedi/possession //Oh shit
	name = "Possessing G-G-G-Ghosts!"
	weight = 2
	typepath = /datum/round_event/jedi/possession
	max_occurrences = 5
	earliest_start = 0 MINUTES

/datum/round_event/jedi/possession/start()
	for(var/mob/dead/observer/G in GLOB.player_list)
		G.verbs += /mob/dead/observer/verb/boo
		G.verbs += /mob/dead/observer/verb/possess
		to_chat(G, "You suddenly feel a welling of new spooky powers...")
