/datum/crafting_recipe/roguetown/farming
	req_table = FALSE
	verbage_simple = "mix"
	skillcraft = /datum/skill/labor/farming
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/farming/fertilizer
	name = "Fertilizer"
	result = list(/obj/item/fertilizer/,
				/obj/item/fertilizer/,
				/obj/item/fertilizer/,
	)
	reqs = list(/obj/item/compost = 1, /obj/item/natural/bone = 1, /obj/item/natural/poo = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/farming/logbushseed
	name = "Druid-bush Seeds"
	result = /obj/item/seeds/logbush
	reqs = list(/obj/item/seeds = 1,
				/obj/item/natural/cured/essence = 1)
	skillcraft = /datum/skill/magic/druidic
	craftdiff = 1 // Easier for druids, but with high INT, anyone could make it
