//How often to check for promotion possibility
#define HEAD_UPDATE_PERIOD 300

/datum/antagonist/rev
	name = "Rebel"
	roundend_category = "rebels" // if by some miracle rebels without rebellion happen
	antagpanel_category = "Rebellion"
	job_rank = ROLE_REV
	antag_moodlet = /datum/mood_event/rebellion
	var/hud_type = "rev"
	var/datum/team/rebellion/rev_team

/datum/antagonist/rev/can_be_owned(datum/mind/new_owner)
	. = ..()
	if(.)
		if(new_owner.assigned_role in GLOB.command_positions)
			return FALSE
		if(new_owner.unconvertable)
			return FALSE
		if(new_owner.current && new_owner.current.has_trait(TRAIT_MINDSHIELD))
			return FALSE

/datum/antagonist/rev/apply_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	update_rev_icons_added(M)

/datum/antagonist/rev/remove_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	update_rev_icons_removed(M)

/datum/antagonist/rev/proc/equip_rev()
	return

/datum/antagonist/rev/on_gain()
	. = ..()
	create_objectives()
	equip_rev()
	owner.current.log_message("has been converted to the rebellion!", LOG_ATTACK, color="red")

/datum/antagonist/rev/on_removal()
	remove_objectives()
	. = ..()

/datum/antagonist/rev/greet()
	to_chat(owner, "<span class='userdanger'>You are now a rebel! Help your cause. Do not harm your fellow freedom fighters. You can identify your comrades by the red \"R\" icons, and your leaders by the blue \"R\" icons. Help them kill the heads to win the rebellion!</span>")
	owner.announce_objectives()

/datum/antagonist/rev/create_team(datum/team/rebellion/new_team)
	if(!new_team)
		//For now only one rebellion at a time
		for(var/datum/antagonist/rev/head/H in GLOB.antagonists)
			if(!H.owner)
				continue
			if(H.rev_team)
				rev_team = H.rev_team
				return
		rev_team = new /datum/team/rebellion
		rev_team.update_objectives()
		rev_team.update_heads()
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	rev_team = new_team

/datum/antagonist/rev/get_team()
	return rev_team

/datum/antagonist/rev/proc/create_objectives()
	objectives |= rev_team.objectives

/datum/antagonist/rev/proc/remove_objectives()
	objectives -= rev_team.objectives

//Bump up to head_rev
/datum/antagonist/rev/proc/promote()
	var/old_team = rev_team
	var/datum/mind/old_owner = owner
	silent = TRUE
	owner.remove_antag_datum(/datum/antagonist/rev)
	var/datum/antagonist/rev/head/new_revhead = new()
	new_revhead.silent = TRUE
	old_owner.add_antag_datum(new_revhead,old_team)
	new_revhead.silent = FALSE
	to_chat(old_owner, "<span class='userdanger'>You have proved your devotion to the rebellion! You are a head rebel now!</span>")

/datum/antagonist/rev/get_admin_commands()
	. = ..()
	.["Promote"] = CALLBACK(src,.proc/admin_promote)

/datum/antagonist/rev/proc/admin_promote(mob/admin)
	var/datum/mind/O = owner
	promote()
	message_admins("[key_name_admin(admin)] has head-rev'ed [O].")
	log_admin("[key_name(admin)] has head-rev'ed [O].")

/datum/antagonist/rev/head/admin_add(datum/mind/new_owner,mob/admin)
	give_flash = TRUE
	give_hud = TRUE
	remove_clumsy = TRUE
	new_owner.add_antag_datum(src)
	message_admins("[key_name_admin(admin)] has head-rev'ed [new_owner.current].")
	log_admin("[key_name(admin)] has head-rev'ed [new_owner.current].")
	to_chat(new_owner.current, "<span class='userdanger'>You are a member of the rebels' leadership now!</span>")

/datum/antagonist/rev/head/get_admin_commands()
	. = ..()
	. -= "Promote"
	.["Take flash"] = CALLBACK(src,.proc/admin_take_flash)
	.["Give flash"] = CALLBACK(src,.proc/admin_give_flash)
	.["Repair flash"] = CALLBACK(src,.proc/admin_repair_flash)
	.["Demote"] = CALLBACK(src,.proc/admin_demote)

/datum/antagonist/rev/head/proc/admin_take_flash(mob/admin)
	var/list/L = owner.current.get_contents()
	var/obj/item/assembly/flash/flash = locate() in L
	if (!flash)
		to_chat(admin, "<span class='danger'>Deleting flash failed!</span>")
		return
	qdel(flash)

/datum/antagonist/rev/head/proc/admin_give_flash(mob/admin)
	//This is probably overkill but making these impact state annoys me
	var/old_give_flash = give_flash
	var/old_give_hud = give_hud
	var/old_remove_clumsy = remove_clumsy
	give_flash = TRUE
	give_hud = FALSE
	remove_clumsy = FALSE
	equip_rev()
	give_flash = old_give_flash
	give_hud = old_give_hud
	remove_clumsy = old_remove_clumsy

/datum/antagonist/rev/head/proc/admin_repair_flash(mob/admin)
	var/list/L = owner.current.get_contents()
	var/obj/item/assembly/flash/flash = locate() in L
	if (!flash)
		to_chat(admin, "<span class='danger'>Repairing flash failed!</span>")
	else
		flash.crit_fail = 0
		flash.update_icon()

/datum/antagonist/rev/head/proc/admin_demote(datum/mind/target,mob/user)
	message_admins("[key_name_admin(user)] has demoted [owner.current] from head rebel.")
	log_admin("[key_name(user)] has demoted [owner.current] from head rebel.")
	demote()

/datum/antagonist/rev/head
	name = "Head Rebel"
	hud_type = "rev_head"
	var/remove_clumsy = FALSE
	var/give_flash = FALSE
	var/give_hud = TRUE

/datum/antagonist/rev/head/antag_listing_name()
	return ..() + "(Leader)"

/datum/antagonist/rev/proc/update_rev_icons_added(mob/living/M)
	var/datum/atom_hud/antag/revhud = GLOB.huds[ANTAG_HUD_REV]
	revhud.join_hud(M)
	set_antag_hud(M,hud_type)

/datum/antagonist/rev/proc/update_rev_icons_removed(mob/living/M)
	var/datum/atom_hud/antag/revhud = GLOB.huds[ANTAG_HUD_REV]
	revhud.leave_hud(M)
	set_antag_hud(M, null)

/datum/antagonist/rev/proc/can_be_converted(mob/living/candidate)
	if(!candidate.mind)
		return FALSE
	if(!can_be_owned(candidate.mind))
		return FALSE
	var/mob/living/carbon/C = candidate //Check to see if the potential rev is implanted
	if(!istype(C)) //Can't convert simple animals
		return FALSE
	return TRUE

/datum/antagonist/rev/proc/add_rebel(datum/mind/rev_mind,stun = TRUE)
	if(!can_be_converted(rev_mind.current))
		return FALSE
	if(stun)
		if(iscarbon(rev_mind.current))
			var/mob/living/carbon/carbon_mob = rev_mind.current
			carbon_mob.silent = max(carbon_mob.silent, 5)
			carbon_mob.flash_act(1, 1)
		rev_mind.current.Stun(100)
	rev_mind.add_antag_datum(/datum/antagonist/rev,rev_team)
	rev_mind.special_role = ROLE_REV
	return TRUE

/datum/antagonist/rev/head/proc/demote()
	var/datum/mind/old_owner = owner
	var/old_team = rev_team
	silent = TRUE
	owner.remove_antag_datum(/datum/antagonist/rev/head)
	var/datum/antagonist/rev/new_rev = new /datum/antagonist/rev()
	new_rev.silent = TRUE
	old_owner.add_antag_datum(new_rev,old_team)
	new_rev.silent = FALSE
	to_chat(old_owner, "<span class='userdanger'>The Rebellion has been disappointed of your leader traits! You are a regular rebel now!</span>")

/datum/antagonist/rev/farewell()
	if(ishuman(owner.current))
		owner.current.visible_message("<span class='deconversion_message'>[owner.current] looks like [owner.current.p_theyve()] just remembered [owner.current.p_their()] real allegiance!</span>", null, null, null, owner.current)
		to_chat(owner, "<span class='userdanger'>You are no longer a brainwashed rebel! Your memory is hazy from the time you were a rebel...the only thing you remember is the name of the one who brainwashed you...</span>")
	else if(issilicon(owner.current))
		owner.current.visible_message("<span class='deconversion_message'>The frame beeps contentedly, purging the hostile memory engram from the MMI before initalizing it.</span>", null, null, null, owner.current)
		to_chat(owner, "<span class='userdanger'>The frame's firmware detects and deletes your neural reprogramming! You remember nothing but the name of the one who flashed you.</span>")

//blunt trauma deconversions call this through species.dm spec_attacked_by()
/datum/antagonist/rev/proc/remove_rebel(borged, deconverter)
	log_attack("[key_name(owner.current)] has been deconverted from the rebellion by [key_name(deconverter)]!")
	if(borged)
		message_admins("[ADMIN_LOOKUPFLW(owner.current)] has been borged while being a [name]")
	owner.special_role = null
	if(iscarbon(owner.current))
		var/mob/living/carbon/C = owner.current
		C.Unconscious(100)
	owner.remove_antag_datum(type)

/datum/antagonist/rev/head/remove_rebel(borged,deconverter)
	if(!borged)
		return
	. = ..()

/datum/antagonist/rev/head/equip_rev()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return

	if(remove_clumsy && owner.assigned_role == "Clown")
		to_chat(owner, "Your training has allowed you to overcome your clownish nature, allowing you to wield weapons without harming yourself.")
		H.dna.remove_mutation(CLOWNMUT)

	if(give_flash)
		var/obj/item/assembly/flash/T = new(H)
		var/list/slots = list (
			"backpack" = SLOT_IN_BACKPACK,
			"left pocket" = SLOT_L_STORE,
			"right pocket" = SLOT_R_STORE
		)
		var/where = H.equip_in_one_of_slots(T, slots)
		if (!where)
			to_chat(H, "The Syndicate were unfortunately unable to get you a flash.")
		else
			to_chat(H, "The flash in your [where] will help you to persuade the crew to join your cause.")

	if(give_hud)
		var/obj/item/organ/cyberimp/eyes/hud/security/syndicate/S = new(H)
		S.Insert(H, special = FALSE, drop_if_replaced = FALSE)
		to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted, and therefore unable to be recruited.")

/datum/team/rebellion
	name = "Rebellion"
	var/max_headrevs = 3

/datum/team/rebellion/proc/update_objectives(initial = FALSE)
	var/untracked_heads = SSjob.get_all_heads()
	for(var/datum/objective/mutiny/O in objectives)
		untracked_heads -= O.target
	for(var/datum/mind/M in untracked_heads)
		var/datum/objective/mutiny/new_target = new()
		new_target.team = src
		new_target.target = M
		new_target.update_explanation_text()
		objectives += new_target
	for(var/datum/mind/M in members)
		var/datum/antagonist/rev/R = M.has_antag_datum(/datum/antagonist/rev)
		R.objectives |= objectives

	addtimer(CALLBACK(src,.proc/update_objectives),HEAD_UPDATE_PERIOD,TIMER_UNIQUE)

/datum/team/rebellion/proc/head_rebels()
	. = list()
	for(var/datum/mind/M in members)
		if(M.has_antag_datum(/datum/antagonist/rev/head))
			. += M

/datum/team/rebellion/proc/update_heads()
	if(SSticker.HasRoundStarted())
		var/list/datum/mind/head_rebels = head_rebels()
		var/list/datum/mind/heads = SSjob.get_all_heads()
		var/list/sec = SSjob.get_all_sec()

		if(head_rebels.len < max_headrevs && head_rebels.len < round(heads.len - ((8 - sec.len) / 3)))
			var/list/datum/mind/non_heads = members - head_rebels
			var/list/datum/mind/promotable = list()
			for(var/datum/mind/khrushchev in non_heads)
				if(khrushchev.current && !khrushchev.current.incapacitated() && !khrushchev.current.restrained() && khrushchev.current.client && khrushchev.current.stat != DEAD)
					if(ROLE_REV in khrushchev.current.client.prefs.be_special)
						promotable += khrushchev
			if(promotable.len)
				var/datum/mind/new_leader = pick(promotable)
				var/datum/antagonist/rev/rev = new_leader.has_antag_datum(/datum/antagonist/rev)
				rev.promote()

	addtimer(CALLBACK(src,.proc/update_heads),HEAD_UPDATE_PERIOD,TIMER_UNIQUE)


/datum/team/rebellion/roundend_report()
	if(!members.len)
		return

	var/list/result = list()

	result += "<div class='panel redborder'>"

	var/num_revs = 0
	var/num_survivors = 0
	for(var/mob/living/carbon/survivor in GLOB.alive_mob_list)
		if(survivor.ckey)
			num_survivors++
			if(survivor.mind)
				if(is_rebel(survivor))
					num_revs++
	if(num_survivors)
		result += "Command's Approval Rating: <B>[100 - round((num_revs/num_survivors)*100, 0.1)]%</B><br>"


	var/list/targets = list()
	var/list/datum/mind/headrevs = get_antag_minds(/datum/antagonist/rev/head)
	var/list/datum/mind/revs = get_antag_minds(/datum/antagonist/rev,TRUE)
	if(headrevs.len)
		var/list/headrev_part = list()
		headrev_part += "<span class='header'>The head rebels were:</span>"
		headrev_part += printplayerlist(headrevs,TRUE)
		result += headrev_part.Join("<br>")

	if(revs.len)
		var/list/rev_part = list()
		rev_part += "<span class='header'>The rebels were:</span>"
		rev_part += printplayerlist(revs,TRUE)
		result += rev_part.Join("<br>")

	var/list/heads = SSjob.get_all_heads()
	if(heads.len)
		var/head_text = "<span class='header'>The heads of staff were:</span>"
		head_text += "<ul class='playerlist'>"
		for(var/datum/mind/head in heads)
			var/target = (head in targets)
			head_text += "<li>"
			if(target)
				head_text += "<span class='redtext'>Target</span>"
			head_text += "[printplayer(head, 1)]</li>"
		head_text += "</ul><br>"
		result += head_text

	result += "</div>"

	return result.Join()

/datum/team/rebellion/antag_listing_entry()
	var/common_part = ""
	var/list/parts = list()
	parts += "<b>[antag_listing_name()]</b><br>"
	parts += "<table cellspacing=5>"

	var/list/heads = get_team_antags(/datum/antagonist/rev/head,TRUE)

	for(var/datum/antagonist/A in heads | get_team_antags())
		parts += A.antag_listing_entry()

	parts += "</table>"
	parts += antag_listing_footer()
	common_part = parts.Join()

	var/heads_report = "<b>Heads of Staff</b><br>"
	heads_report += "<table cellspacing=5>"
	for(var/datum/mind/N in SSjob.get_living_heads())
		var/mob/M = N.current
		if(M)
			heads_report += "<tr><td><a href='?_src_=holder;[HrefToken()];adminplayeropts=[REF(M)]'>[M.real_name]</a>[M.client ? "" : " <i>(No Client)</i>"][M.stat == DEAD ? " <b><font color=red>(DEAD)</font></b>" : ""]</td>"
			heads_report += "<td><A href='?priv_msg=[M.ckey]'>PM</A></td>"
			heads_report += "<td><A href='?_src_=holder;[HrefToken()];adminplayerobservefollow=[REF(M)]'>FLW</a></td>"
			var/turf/mob_loc = get_turf(M)
			heads_report += "<td>[mob_loc.loc]</td></tr>"
		else
			heads_report += "<tr><td><a href='?_src_=vars;[HrefToken()];Vars=[REF(N)]'>[N.name]([N.key])</a><i>Head body destroyed!</i></td>"
			heads_report += "<td><A href='?priv_msg=[N.key]'>PM</A></td></tr>"
	heads_report += "</table>"
	return common_part + heads_report

/datum/team/rebellion/is_gamemode_hero()
	return SSticker.mode.name == "rebellion"