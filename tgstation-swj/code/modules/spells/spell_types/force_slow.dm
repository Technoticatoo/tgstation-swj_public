/obj/effect/proc_holder/spell/targeted/forceslow
	name = "Force Slow"
	desc = "Slow your target to a crawl!."
	clothes_req = FALSE
	invocation = "Force Choke"
	invocation_type = "emote"
	var/amt_knockdown = 0
	var/destroys = "none" //can be "none", "gib" or "disintegrate"

	var/summon_type = null //this will put an obj at the target's location

	var/check_anti_magic = TRUE
	var/check_holy = FALSE
	action_icon_state = "force_slow"

/obj/effect/proc_holder/spell/targeted/forceslow/cast(list/targets,mob/user = usr)
	for(var/mob/living/target in targets)
		playsound(target,sound, 50,1)
		if(target.anti_magic_check(check_anti_magic, check_holy))
			return
		switch(destroys)
			if("gib")
				target.gib()
			if("disintegrate")
				target.dust()

		if(!target)
			continue
		//damage/healing
		//disabling
		target.Knockdown(amt_knockdown)
		target.toggle_move_intent()

		//summoning
		if(summon_type)
			new summon_type(target.loc, target)