/mob/living/simple_animal/hostile/buzzdroid
	name = "buzz droid"
	desc = "A small ball shaped droid equipped with several cutters and a plasma torch."
	icon = 'icons/mob/robots.dmi'
	icon_state = "buzz_droid"
	icon_living = "buzz_droid"
	icon_dead = "buzz_droid0"
	icon_gib = "buzz_droid_gib"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 0
	maxHealth = 25
	health = 25
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "punches"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/item/assembly/prox_sensor,/obj/effect/decal/cleanable/oil)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 0
	faction = list("droid")
	status_flags = CANPUSH
	del_on_death = 1

	do_footstep = TRUE