/obj/effect/proc_holder/spell/targeted/forcehealothers
	name = "Force Healing"
	desc = "Use the force to heal."
	clothes_req = FALSE
	invocation = "May the force heal you!"
	invocation_type = "shout"
	var/amt_knockdown = 0
	var/amt_unconscious = 0
	var/amt_stun = 0
	charge_max = 100
	cooldown_min = 50
	school = "restoration"
	sound = 'sound/magic/staff_healing.ogg'
	action_icon_state = "force_heal_targeted"

	//set to negatives for healing
	var/amt_heal_fire = -10
	var/amt_heal_brute = -10
	var/amt_heal_oxy = -10
	var/amt_heal_tox = -10

	var/destroys = "none" //can be "none", "gib" or "disintegrate"

	var/summon_type = null //this will put an obj at the target's location

	var/check_anti_magic = TRUE
	var/check_holy = FALSE
	action_icon_state = "force_heal"

/obj/effect/proc_holder/spell/targeted/forcehealothers/cast(list/targets,mob/user = usr)
	for(var/mob/living/target in targets)
		if(!target)
			continue
		//damage/healing
		target.visible_message("<span class='warning'>The force heals [target]!</span>", "<span class='notice'>You are healed by the force!</span>")
		target.adjustBruteLoss(amt_heal_brute)
		target.adjustFireLoss(amt_heal_fire)
		target.adjustToxLoss(amt_heal_tox)
		target.adjustOxyLoss(amt_heal_oxy)