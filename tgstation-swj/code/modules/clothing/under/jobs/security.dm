/*
 * Contains:
 *		Security
 *		Interrogator
 *		Navy uniforms
 */

/*
 * Security
 */

/obj/item/clothing/under/rank/security
	name = "security jumpsuit"
	desc = "A tactical security jumpsuit for officers complete with imperial belt buckle."
	icon_state = "rsecurity"
	item_state = "r_suit"
	item_color = "rsecurity"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/obj/item/clothing/under/rank/security/grey
	name = "grey security jumpsuit"
	desc = "A tactical relic of years past before the Empire decided it was cheaper to dye the suits red instead of washing out the blood."
	icon_state = "security"
	item_state = "gy_suit"
	item_color = "security"

/obj/item/clothing/under/rank/security/skirt
	name = "security jumpskirt"
	desc = "A \"tactical\" security jumpsuit with the legs replaced by a skirt."
	icon_state = "secskirt"
	item_state = "r_suit"
	item_color = "secskirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE //you know now that i think of it if you adjust the skirt and the sprite disappears isn't that just like flashing everyone


/obj/item/clothing/under/rank/warden
	name = "security suit"
	desc = "A formal security suit for officers complete with imperial belt buckle."
	icon_state = "rwarden"
	item_state = "r_suit"
	item_color = "warden"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = 3
	random_sensor = FALSE

/obj/item/clothing/under/rank/warden/grey
	name = "grey security suit"
	desc = "A formal relic of years past before the Empire decided it was cheaper to dye the suits red instead of washing out the blood."
	icon_state = "warden"
	item_state = "gy_suit"
	item_color = "warden"

/*
 * Interrogator
 */
/obj/item/clothing/under/rank/det
	name = "hard-worn suit"
	desc = "Someone who wears this means business."
	icon_state = "detective"
	item_state = "det"
	item_color = "detective"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = 3
	random_sensor = FALSE

/obj/item/clothing/under/rank/det/grey
	name = "noir suit"
	desc = "A hard-boiled private investigator's grey suit, complete with tie clip."
	icon_state = "greydet"
	item_state = "greydet"
	item_color = "greydet"
	alt_covers_chest = TRUE

/*
 * Captain of the Guard
 */
/obj/item/clothing/under/rank/head_of_security
	name = "Captain of the Guard's jumpsuit"
	desc = "A security jumpsuit decorated for those few with the dedication to achieve the position of Captain of the Guard."
	icon_state = "rhos"
	item_state = "r_suit"
	item_color = "hos"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	strip_delay = 60
	alt_covers_chest = TRUE
	sensor_mode = 3
	random_sensor = FALSE

/obj/item/clothing/under/rank/head_of_security/grey
	name = "Captain of the Guard's grey jumpsuit"
	desc = "There are old men, and there are bold men, but there are very few old, bold men."
	icon_state = "hos"
	item_state = "gy_suit"
	item_color = "hos"

/obj/item/clothing/under/rank/head_of_security/alt
	name = "Captain of the Guard's turtleneck"
	desc = "A stylish alternative to the normal Captain of the Guard jumpsuit, complete with tactical pants."
	icon_state = "hosalt"
	item_state = "bl_suit"
	item_color = "hosalt"

/*
 * Navy uniforms
 */

/obj/item/clothing/under/rank/security/navyblue
	name = "Stormtrooper's formal uniform"
	desc = "The latest in fashionable security outfits."
	icon_state = "officerblueclothes"
	item_state = "officerblueclothes"
	item_color = "officerblueclothes"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/head_of_security/navyblue
	desc = "The insignia on this uniform tells you that this uniform belongs to the Captain of the Guard."
	name = "Captain of the Guard's formal uniform"
	icon_state = "hosblueclothes"
	item_state = "hosblueclothes"
	item_color = "hosblueclothes"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/warden/navyblue
	desc = "The insignia on this uniform tells you that this uniform belongs to the Master Sergeant."
	name = "warden's formal uniform"
	icon_state = "wardenblueclothes"
	item_state = "wardenblueclothes"
	item_color = "wardenblueclothes"
	alt_covers_chest = TRUE

/*
 *Blueshirt
 */

/obj/item/clothing/under/rank/security/blueshirt
	desc = "I'm a little busy right now, Calhoun."
	icon_state = "blueshift"
	item_state = "blueshift"
	item_color = "blueshift"
	can_adjust = FALSE


