/obj/item/book/granter/skillbook
	name = "Skill Book"
	desc = "A tome full of wisdom."
	var/open = FALSE
	icon = 'modular_stonehedge/modules_bluemoon/skillbooks/icons/objects/items/books.dmi'
	icon_state = "bookofwidom_0"
	var/base_icon_state = "bookofwisdom"
	unique = TRUE
	firefuel = 2 MINUTES
	dropshrink = 0.6
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'
	force = 5
	associated_skill = /datum/skill/misc/reading
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_SMALL
	// Trait to add to the user after reading
	var/skillbook_trait
	// Associative lazylist of stat strings to number increases
	var/list/stats_to_add
	// Associative lazylist of skill strings to number increases
	var/list/skills_to_add

/obj/item/book/granter/skillbook/getonmobprop(tag)
	. = ..()
	if(tag)
		if(open)
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
		else
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/book/granter/skillbook/attack_self(mob/user)
	if(!open)
		attack_right(user)
		return
	user.update_inv_hands()
	if(isnull(stats_to_add) && isnull(skills_to_add))
		to_chat(user, span_warning("The pages are too smudged to read..."))
		return
	if(!isnull(skillbook_trait) && HAS_TRAIT(user, skillbook_trait))
		to_chat(user, span_warning("You already know the words within..."))
		return
	..()

/obj/item/book/granter/skillbook/rmb_self(mob/user)
	attack_right(user)
	return

/obj/item/book/granter/skillbook/read(mob/user)
	if(!open)
		to_chat(user, span_info("Open me first."))
		return FALSE
	. = ..()

/obj/item/book/granter/skillbook/attackby(obj/item/I, mob/user, params)
	return

/obj/item/book/granter/skillbook/attack_right(mob/user)
	if(!open)
		slot_flags &= ~ITEM_SLOT_HIP
		open = TRUE
		playsound(loc, 'sound/items/book_open.ogg', 100, FALSE, -1)
	else
		slot_flags |= ITEM_SLOT_HIP
		open = FALSE
		playsound(loc, 'sound/items/book_close.ogg', 100, FALSE, -1)
	curpage = 1
	update_icon()
	user.update_inv_hands()

/obj/item/book/granter/skillbook/update_icon()
	icon_state = "[base_icon_state]_[open]"

/obj/item/book/granter/skillbook/read(mob/user)
	attack_self(user)

/obj/item/book/granter/skillbook/on_reading_finished(mob/living/user)
	..()
	if(!isnull(stats_to_add))
		for(var/stat_string in stats_to_add)
			user.change_stat(stat_string, stats_to_add[stat_string])
	if(!isnull(skills_to_add))
		for(var/skill_string in skills_to_add)
			user.mind.adjust_skillrank(skill_string, skills_to_add[skill_string])
	if(!isnull(skillbook_trait))
		ADD_TRAIT(user, skillbook_trait, ABSTRACT_ITEM_TRAIT)
