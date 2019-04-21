/obj/effect/proc_holder/spell/targeted/rod_form
	name = "Rod Form"
	desc = "Take on the form of an immovable rod, destroying all in your path. Purchasing this spell multiple times will also increase the rod's damage and travel range."
	clothes_req = TRUE
	human_req = FALSE
	charge_max = 250
	cooldown_min = 100
	range = -1
	include_user = TRUE
	invocation = "CLANG!"
	invocation_type = "shout"
	action_icon_state = "immrod"

/obj/effect/proc_holder/spell/targeted/rod_form/cast(list/targets,mob/user = usr)
	for(var/mob/living/M in targets)
		var/turf/start = get_turf(M)
		var/obj/effect/immovablerod/jedi/W = new(start, get_ranged_target_turf(M, M.dir, (15 + spell_level * 3)))
		W.jedi = M
		W.max_distance += spell_level * 3 //You travel farther when you upgrade the spell
		W.damage_bonus += spell_level * 20 //You do more damage when you upgrade the spell
		W.start_turf = start
		M.forceMove(W)
		M.notransform = TRUE
		M.status_flags |= GODMODE

//Jedi Version of the Immovable Rod

/obj/effect/immovablerod/jedi
	var/max_distance = 13
	var/damage_bonus = 0
	var/mob/living/jedi
	var/turf/start_turf
	notify = FALSE

/obj/effect/immovablerod/jedi/Move()
	if(get_dist(start_turf, get_turf(src)) >= max_distance)
		qdel(src)
	..()

/obj/effect/immovablerod/jedi/Destroy()
	if(jedi)
		jedi.status_flags &= ~GODMODE
		jedi.notransform = FALSE
		jedi.forceMove(get_turf(src))
	return ..()

/obj/effect/immovablerod/jedi/penetrate(mob/living/L)
	if(L.anti_magic_check())
		L.visible_message("<span class='danger'>[src] hits [L], but it bounces back, then vanishes!</span>" , "<span class='userdanger'>[src] hits you... but it bounces back, then vanishes!</span>" , "<span class ='danger'>You hear a weak, sad, CLANG.</span>")
		qdel(src)
		return
	L.visible_message("<span class='danger'>[L] is penetrated by an immovable rod!</span>" , "<span class='userdanger'>The rod penetrates you!</span>" , "<span class ='danger'>You hear a CLANG!</span>")
	L.adjustBruteLoss(70 + damage_bonus)
