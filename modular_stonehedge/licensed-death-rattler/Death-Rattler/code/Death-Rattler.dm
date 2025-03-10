// This code is part of Death-Rattler
// Copyright (C) 2024 Moribund/Luctus-Comptus and Sutures/noelle-lavenza
// This code is subject to additional terms as described in modular_stonehedge/licensed-death-rattler/LICENSE.md

// I hate doing this. basically if you are anyone but ratwood/gyran DM me (Moribund) first and you can use whatever the fuck your heart wants from this. not only did he brag about theft and how easy it is he tryed to pull this same shit.




/obj/item/storage/fancy/shhig
	name = "\improper Shhig Brand Zigs"
	gender = PLURAL
	desc = "Shhig's; much like the image of serpents these zigs are synonymous with both healing and killing. Your life expectancy isnt very high anyway."
	icon = 'modular_stonehedge/licensed-death-rattler/Death-Rattler/icon/smokable.dmi'
	icon_state = "smokebox"
	icon_type = "smoke"
	item_state = "smokebox"
	fancy_open = TRUE
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	slot_flags = null
	spawn_type = /obj/item/clothing/mask/cigarette/rollie/snek

/obj/item/storage/fancy/shhig/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 5
	STR.set_holdable(list(/obj/item/clothing/mask/cigarette/rollie/snek))

/obj/item/storage/fancy/shhig/attack_self(mob_user)
	return

/obj/item/clothing/mask/cigarette/rollie/snek
	list_reagents = list(/datum/reagent/drug/nicotine = 30, /datum/reagent/consumable/honey = 30, /datum/reagent/toxin/venom = 10) //honey will give heal. it is NOT great 55% chance per unit tick to heal 1brute,burn,tox. high end perfect rolls 30hp. unlikely. degrades into sugar (chance) which has a chance to degrade into nutrients. simulates appetite surpressant effect.

/obj/item/reagent_containers/hypospray/medipen/sty/snekbt
	name = "Snake Bite"
	desc = "Ask yourself this: 'What am I doing?' It is a glowing viscous sludge you are about to put into your body. This can't be a good idea, can it?"
	icon = 'modular_stonehedge/licensed-death-rattler/Death-Rattler/icon/smokable.dmi'
	icon_state = "bite"
	has_cap = FALSE // no icons
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/drug/snekbt = 5, /datum/reagent/toxin/venom = 5)

/obj/item/reagent_containers/hypospray/medipen/sty/nourish
	name = "NOURISH"
	desc = "nutritional supplement: normal people eat and drink, but true champions NOURISH."
	icon = 'modular_stonehedge/licensed-death-rattler/Death-Rattler/icon/smokable.dmi'
	icon_state = "nourish"
	has_cap = FALSE // no icons
	volume = 135
	amount_per_transfer_from_this = 135
	list_reagents = list(/datum/reagent/consumable/honey = 30, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/water = 100) // as much water as a bucket so full hydrate. enough honey to IF good rng rolls get 30hp. 33% chance to decay into sugar, sugar has a 33% chance to decay into nutrients. so saturation varies.

/datum/reagent/drug/snekbt
	name = "Snake Bite"
	description = "I'm not the one who's so far away..."
	color = "#00FF00"
	metabolization_rate = 0.1
	overdose_threshold = 6

/datum/reagent/drug/snekbt/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/snekbt)
	if(M.has_status_effect(/datum/status_effect/debuff/sleepytime) || M.has_status_effect(/datum/status_effect/debuff/sleepytime/lune))
		M.remove_status_effect(/datum/status_effect/debuff/sleepytime)
		M.remove_status_effect(/datum/status_effect/debuff/sleepytime/lune)
	if(M.has_flaw(/datum/charflaw/addiction/junkie))
		M.sate_addiction()
	return ..()

/atom/movable/screen/fullscreen/snekbt
	icon_state = "curse1"
	plane = BLACKNESS_PLANE
	layer = AREA_LAYER
	blend_mode = 0
	alpha = 255
	show_when_dead = FALSE

/atom/movable/screen/fullscreen/snekbt/Initialize()
	. = ..()
	add_filter("snakebt_blur", 2, list(type="angular_blur",x=5,y=5,size=1))

/datum/reagent/drug/snekbt/overdose_start(mob/living/M, can_overdose = TRUE)
	if(HAS_TRAIT(M, TRAIT_CRACKHEAD))// boathian bullshit isnt going to help you here. its a toxin not a drug
		can_overdose = TRUE
	to_chat(M, span_userdanger("You really, really shouldn't have done that!"))
	M.ForceContractDisease(new /datum/disease/heart_failure(), FALSE, TRUE)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/drug/snekbt/overdose_process(mob/living/M)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	ADD_TRAIT(M, TRAIT_PARALYSIS_L_ARM, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_PARALYSIS_L_LEG, TRAIT_GENERIC)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 5)
	M.adjustOxyLoss(5*REM, 0)
	..()
	return TRUE

/datum/status_effect/buff/snekbt
	id = "Snake Bite"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("strength" = 2, "constitution" = 2, "speed" = -3)
	duration = 27 SECONDS

/datum/stressevent/snekbt
	stressadd = -15
	desc = span_blue("How many will you take with you...?")
	timer = 27 SECONDS

/datum/status_effect/buff/snekbt/on_apply()
	. = ..()
	if(!.) // cancelled somehow
		return
	owner.overlay_fullscreen("snekbt", /atom/movable/screen/fullscreen/snekbt)
	owner.add_stress(/datum/stressevent/snekbt)
	ADD_TRAIT(owner, TRAIT_PROSOPAGNOSIA, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_FAKEDEATH, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_NODISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_NOLIMBDISABLE, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_SCHIZO_AMBIENCE, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_ANTIMAGIC, TRAIT_GENERIC)

/datum/status_effect/buff/snekbt/on_remove()
	owner.remove_stress(/datum/stressevent/snekbt)
	owner.clear_fullscreen("snekbt")
	owner.rogstam_add(-2500)
	owner.rogfat_add(2500) // crash you fucking junkie.
	REMOVE_TRAIT(owner, TRAIT_PROSOPAGNOSIA, TRAIT_GENERIC)
	REMOVE_TRAIT(owner, TRAIT_FAKEDEATH, TRAIT_GENERIC)
	REMOVE_TRAIT(owner, TRAIT_NODISMEMBER, TRAIT_GENERIC)
	REMOVE_TRAIT(owner, TRAIT_NOLIMBDISABLE, TRAIT_GENERIC)
	REMOVE_TRAIT(owner, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	REMOVE_TRAIT(owner, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	REMOVE_TRAIT(owner, TRAIT_SCHIZO_AMBIENCE, TRAIT_GENERIC)
	REMOVE_TRAIT(owner, TRAIT_ANTIMAGIC, TRAIT_GENERIC)
	..()
