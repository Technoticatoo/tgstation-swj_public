//Paper Jedi Boss
/mob/living/simple_animal/hostile/boss/paper_jedi
	name = "Mjor the Creative"
	desc = "A jedi with a taste for the arts."
	mob_biotypes = list(MOB_INORGANIC, MOB_HUMANOID)
	boss_abilities = list(/datum/action/boss/jedi_summon_minions, /datum/action/boss/jedi_mimic)
	faction = list("hostile","stickman")
	del_on_death = TRUE
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "paperjedi"
	ranged = 1
	environment_smash = ENVIRONMENT_SMASH_NONE
	minimum_distance = 3
	retreat_distance = 3
	obj_damage = 0
	melee_damage_lower = 10
	melee_damage_upper = 20
	health = 1000
	maxHealth = 1000
	loot = list(/obj/effect/temp_visual/paperwiz_dying)
	projectiletype = /obj/item/projectile/temp
	projectilesound = 'sound/weapons/emitter.ogg'
	attack_sound = 'sound/hallucinations/growl1.ogg'
	var/list/copies = list()

	do_footstep = TRUE


//Summon Ability
//Lets the jedi summon his art to fight for him
/datum/action/boss/jedi_summon_minions
	name = "Summon Minions"
	icon_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	button_icon_state = "art_summon"
	usage_probability = 40
	boss_cost = 30
	boss_type = /mob/living/simple_animal/hostile/boss/paper_jedi
	needs_target = FALSE
	say_when_triggered = "Rise, my creations! Jump off your pages and into this realm!"
	var/static/summoned_minions = 0

/datum/action/boss/jedi_summon_minions/Trigger()
	if(summoned_minions <= 6 && ..())
		var/list/minions = list(
		/mob/living/simple_animal/hostile/stickman,
		/mob/living/simple_animal/hostile/stickman/ranged,
		/mob/living/simple_animal/hostile/stickman/dog)
		var/list/directions = GLOB.cardinals.Copy()
		for(var/i in 1 to 3)
			var/minions_chosen = pick_n_take(minions)
			new minions_chosen (get_step(boss,pick_n_take(directions)), 1)
		summoned_minions += 3;


//Mimic Ability
//Summons mimics of himself with magical papercraft
//Hitting a decoy hurts nearby people excluding the jedi himself
//Hitting the jedi himself destroys all decoys
/datum/action/boss/jedi_mimic
	name = "Craft Mimicry"
	icon_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	button_icon_state = "mimic_summon"
	usage_probability = 30
	boss_cost = 40
	boss_type = /mob/living/simple_animal/hostile/boss/paper_jedi
	say_when_triggered = ""

/datum/action/boss/jedi_mimic/Trigger()
	if(..())
		var/mob/living/target
		if(!boss.client) //AI's target
			target = boss.target
		else //random mob
			var/list/threats = boss.PossibleThreats()
			if(threats.len)
				target = pick(threats)
		if(target)
			var/mob/living/simple_animal/hostile/boss/paper_jedi/wiz = boss
			var/directions = GLOB.cardinals.Copy()
			for(var/i in 1 to 3)
				var/mob/living/simple_animal/hostile/boss/paper_jedi/copy/C = new (get_step(target,pick_n_take(directions)))
				wiz.copies += C
				C.original = wiz
				C.say("My craft defines me, you could even say it IS me!")
			wiz.say("My craft defines me, you could even say it IS me!")
			wiz.forceMove(get_step(target,pick_n_take(directions)))
			wiz.minimum_distance = 1 //so he doesn't run away and ruin everything
			wiz.retreat_distance = 0
		else
			boss.atb.refund(boss_cost)

/mob/living/simple_animal/hostile/boss/paper_jedi/copy
	desc = "'Tis a ruse!"
	health = 1
	maxHealth = 1
	alpha = 200
	boss_abilities = list()
	melee_damage_lower = 1
	melee_damage_upper = 5
	minimum_distance = 0
	retreat_distance = 0
	ranged = 0
	loot = list()
	var/mob/living/simple_animal/hostile/boss/paper_jedi/original

//Hit a fake? eat pain!
/mob/living/simple_animal/hostile/boss/paper_jedi/copy/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	if(amount > 0) //damage
		if(original)
			original.minimum_distance = 3
			original.retreat_distance = 3
			original.copies -= src
			for(var/c in original.copies)
				qdel(c)
		for(var/mob/living/L in range(5,src))
			if(L == original || istype(L, type))
				continue
			L.adjustBruteLoss(50)
		qdel(src)
	else
		. = ..()

//Hit the real guy? copies go bai-bai
/mob/living/simple_animal/hostile/boss/paper_jedi/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(. > 0)//damage
		minimum_distance = 3
		retreat_distance = 3
		for(var/copy in copies)
			qdel(copy)

/mob/living/simple_animal/hostile/boss/paper_jedi/copy/examine(mob/user)
	..()
	qdel(src) //I see through your ruse!

//fancy effects
/obj/effect/temp_visual/paper_scatter
	name = "scattering paper"
	desc = "Pieces of paper scattering to the wind."
	layer = ABOVE_OPEN_TURF_LAYER
	icon = 'icons/effects/effects.dmi'
	icon_state = "paper_scatter"
	anchored = TRUE
	duration = 5
	randomdir = FALSE

/obj/effect/temp_visual/paperwiz_dying
	name = "craft portal"
	desc = "A wormhole sucking the jedi into the void. Neat."
	layer = ABOVE_OPEN_TURF_LAYER
	icon = 'icons/effects/effects.dmi'
	icon_state = "paperwiz_poof"
	anchored = TRUE
	duration = 18
	randomdir = FALSE

/obj/effect/temp_visual/paperwiz_dying/Initialize()
	. = ..()
	visible_message("<span class='boldannounce'>The jedi cries out in pain as a gate appears behind him, sucking him in!</span>")
	playsound(get_turf(src),'sound/magic/mandswap.ogg', 50, 1, 1)
	playsound(get_turf(src),'sound/hallucinations/wail.ogg', 50, 1, 1)

/obj/effect/temp_visual/paperwiz_dying/Destroy()
	for(var/mob/M in range(7,src))
		shake_camera(M, 7, 1)
	var/turf/T = get_turf(src)
	playsound(T,'sound/magic/summon_magic.ogg', 50, 1, 1)
	new /obj/effect/temp_visual/paper_scatter(T)
	new /obj/item/clothing/suit/wizrobe/paper(T)
	new /obj/item/clothing/head/collectable/paper(T)
	return ..()






