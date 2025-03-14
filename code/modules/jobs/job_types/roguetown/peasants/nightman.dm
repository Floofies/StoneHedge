/datum/job/roguetown/nightman
	title = "Nightmaster"
	f_title = "Nightmistress"
	flag = NIGHTMASTER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS

	tutorial = "You are renting out the brothel in a joint operation with the barkeep. Providing security for the Courtesans and helping them find work... And deal in other shady businesses behind closed doors."

	allowed_ages = ALL_AGES_LIST
	outfit = /datum/outfit/job/roguetown/nightman
	display_order = JDO_NIGHTMASTER
	give_bank_account = TRUE
	min_pq = 5
	max_pq = null

/datum/outfit/job/roguetown/nightman/pre_equip(mob/living/carbon/human/H)
	..()
	beltr = /obj/item/storage/keyring/nightman
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", -1)
		H.grant_language(/datum/language/thievescant)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou/leather
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		backl = /obj/item/storage/backpack/rogue/satchel
		if(H.dna?.species)
			if(iself(H) || ishalfelf(H))
				armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
			if(H.gender == MALE)
				H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()
			else if(isdwarf(H))
				armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	else
		switch(H.patron?.type)
			if(/datum/patron/divine/viiritri) //Eoran loadouts
				shoes = /obj/item/clothing/shoes/roguetown/sandals
				armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless/random
				wrists = /obj/item/clothing/neck/roguetown/psicross/eora
				// Bluemoon edit - Removed conditional forced peaceflower equip: head = /obj/item/clothing/head/peaceflower
			else
				armor = /obj/item/clothing/suit/roguetown/armor/armordress/alt
				shoes = /obj/item/clothing/shoes/roguetown/shortboots
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
