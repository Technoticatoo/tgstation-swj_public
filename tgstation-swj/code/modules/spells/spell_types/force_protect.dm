/obj/effect/proc_holder/spell/self/forceprotect //This spell exists mainly for debugging purposes, and also to show how casting works
	name = "Force Protect"
	desc = "The Force protects you from damage."
	clothes_req = FALSE
	charge_max = 100
	cooldown_min = 50
	invocation = "May the Force protect me!"
	invocation_type = "shout"
	school = "transmutation"
	//sound = 'sound/magic/staff_healing.ogg'
	action_icon_state = "force_armor"


/obj/effect/proc_holder/spell/self/forceheal/cast(mob/living/carbon/human/user) //Note the lack of "list/targets" here. Instead, use a "user" var depending on mob requirements.
	//Also, notice the lack of a "for()" statement that looks through the targets. This is, again, because the spell can only have a single target.
	user.visible_message("<span class='warning'>A wreath of force protects [user]!</span>", "<span class='notice'>You wreath yourself in the protection of the force!</span>")
	user.AddComponent(/datum/component/force_armor,3,/obj/item/stack/sheet/animalhide/force_armor,list("melee" = 10, "bullet" = 5, "laser" = 5))