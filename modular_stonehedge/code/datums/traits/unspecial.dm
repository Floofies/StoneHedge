//BE SPECIAL converted most to regular quirk traits for consistency in characters -- vide noir.
//Will need rebalancing costs and stuff.

//includes non special related, original traits aswell cuz we dumb.

/datum/quirk/greaternightvision
	name = "Darkvision"
	desc = "I can easily see in the dark."
	value = 2

/datum/quirk/greaternightvision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(!eyes)
		return
	eyes.see_in_dark = 14 // Same as full darksight eyes
	eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	H.update_sight()

/datum/quirk/thickskin
	name = "Tough" //probably perfect for raw power classes, strange for unrelated ones but i guess.
	desc = "I can take more beatings than others and being on high alert does not tire me."
	value = 4

/datum/quirk/thickskin/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_BREADY, QUIRK_TRAIT)
	H.change_stat("constitution", 2)

/*
/datum/quirk/charger
	name = "Charger"
	desc = "I am like a raging bull, whoever gets in my way will fall."
	value = 3

/datum/quirk/charger/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_CHARGER, QUIRK_TRAIT)
	H.change_stat("constitution", 1)
*/

/datum/quirk/curseofcain
	name = "Flawed Immortality"
	desc = "Some fell magick has rendered me inwardly unliving - I do not hunger, and I do not breathe."
	value = 4

/datum/quirk/curseofcain/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NOHUNGER, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_NOBREATH, QUIRK_TRAIT)
	H.change_stat("endurance", 1)

/datum/quirk/deadened
	name = "Deadened"
	desc = "Ever since <b>it</b> happened, I've never been able to feel anything emotionally."
	value = 2

/datum/quirk/deadened/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NOMOOD, QUIRK_TRAIT)

/datum/quirk/value
	name = "Skilled Appraiser"
	desc = "I know how to estimate an item's value, more or less."
	value = 2

/datum/quirk/value/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_SEEPRICES, QUIRK_TRAIT)

/datum/quirk/night_owl
	name = "Night Owl"
	desc = "I've always preferred Lune over Elysius. I am no longer fatigued by being tired."
	value = 1

/datum/quirk/night_owl/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NIGHT_OWL, QUIRK_TRAIT)

/datum/quirk/beautiful
	name = "Beautiful"
	desc = "My face is a work of art"
	value = 1

/datum/quirk/beautiful/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, QUIRK_TRAIT)

//positive
/datum/quirk/duelist
	name = "Sword Training"
	desc = "I sword training and stashed a short sword."
	value = 2

/datum/quirk/duelist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.special_items["Short Sword"] = /obj/item/rogueweapon/sword/short

/datum/quirk/fence
	name = "Fencer"
	desc = "I have trained in agile sword fighting. I dodge more easily without wearing anything and have stashed my rapier nearby."
	value = 4

/datum/quirk/fence/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_DODGEADEPT, QUIRK_TRAIT)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.special_items["Rapier"] = /obj/item/rogueweapon/sword/rapier
	H.verbs += list(/mob/living/carbon/human/proc/declare_duel)
	H.cmode_music = 'sound/music/combat_combattante.ogg'

/datum/quirk/training2
	name = "Mace Training"
	desc = "I have mace training and stashed a mace."
	value = 2

/datum/quirk/training2/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.special_items["Mace"] = /obj/item/rogueweapon/mace/spiked

/datum/quirk/training4
	name = "Polearms Training"
	desc = "I have polearm training and stashed a spear."
	value = 2

/datum/quirk/training4/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.special_items["Spear"] = /obj/item/rogueweapon/spear

/datum/quirk/training5
	name = "Knife Training"
	desc = "I have knife training and stashed a parrying dagger."
	value = 2

/datum/quirk/training5/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.special_items["Dagger"] = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying

/datum/quirk/training6
	name = "Axe Training"
	desc = "I have training with axes and am a capable jumberjack. I've also stashed an iron axe."
	value = 2

/datum/quirk/training6/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 3, TRUE)
	H.mind.special_items["Axe"] = /obj/item/rogueweapon/stoneaxe/woodcut

/datum/quirk/training7
	name = "Firearms Training"
	desc = "I have journeyman firearms skills."
	value = 1

/datum/quirk/training7/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 3, TRUE)

/datum/quirk/training8
	name = "Shield Training"
	desc = "I have shield training and stashed a shield. As long as I have a shield in one hand I can catch arrows with ease."
	value = 2

/datum/quirk/training8/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
	H.mind.special_items["Shield"] = /obj/item/rogueweapon/shield/wood
	ADD_TRAIT(H, TRAIT_SHIELDEXPERT, QUIRK_TRAIT)

/datum/quirk/training9
	name = "Unarmed Training"
	desc = "I have journeyman unarmed training and stashed some dusters."
	value = 2

/datum/quirk/training9/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.special_items["Dusters"] = /obj/item/rogueweapon/duster

/datum/quirk/pugilist
	name = "Fists of iron"
	desc = "I have journeyman unarmed training and my punches are hard as iron."
	value = 4

/datum/quirk/pugilist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	ADD_TRAIT(H, TRAIT_PUGILIST, QUIRK_TRAIT)

/datum/quirk/mtraining1
	name = "Medical Training"
	desc = "I have basic medical training and stashed some med supplies."
	value = 2

/datum/quirk/mtraining1/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
	H.mind.special_items["Patch Kit"] = /obj/item/storage/fancy/ifak
	H.mind.special_items["Surgery Kit"] = /obj/item/storage/fancy/skit

/datum/quirk/greenthumb
	name = "Green Thumb"
	desc = "I've always been rather good at tending to plants, and I have some powerful fertilizer stashed away and a women of ill repute. (Raises skill to journeyman)"
	value = 1

/datum/quirk/greenthumb/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 4, TRUE)
	H.mind.special_items["Fertilizer 1"] = /obj/item/fertilizer
	H.mind.special_items["Fertilizer 2"] = /obj/item/fertilizer
	H.mind.special_items["Fertilizer 3"] = /obj/item/fertilizer
	H.mind.special_items["Whore"] = /obj/item/rogueweapon/hoe // I too respect a humble farmer.

/datum/quirk/eagle_eyed
	name = "Eagle Eyed"
	desc = "I was always good at spotting distant things."
	value = 2

/datum/quirk/eagle_eyed/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("perception", 2)

/datum/quirk/training10
	name = "Bow Training"
	desc = "I have journeyman bow training and stashed a bow."
	value = 2

/datum/quirk/training10/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 3, TRUE)
	H.mind.special_items["Bow"] = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	H.mind.special_items["Quiver"] = /obj/item/quiver/arrows

/datum/quirk/mule
	name = "Mule"
	desc = "I've been dealing drugs and I have a stash hidden away"
	value = 2

/datum/quirk/mule/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.special_items["Stash One"] = /obj/item/storage/backpack/rogue/satchel/mule
	H.mind.special_items["Stash Two"] = /obj/item/storage/backpack/rogue/satchel/mule
	H.mind.special_items["Dagger"] = /obj/item/rogueweapon/huntingknife/idagger
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)

/datum/quirk/bookworm
	name = "Bookworm"
	desc = "I love books and I became quite skilled at reading and writing. What's more, my mind is much sharper for the experience."
	value = 2

/datum/quirk/bookworm/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
	H.change_stat("intelligence", 2)

/datum/quirk/arsonist
	name = "Arsonist"
	desc = "I like seeing things combust and burn. I have stashed two firebombs."
	value = 3

/datum/quirk/arsonist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.special_items["Firebomb One"] = /obj/item/bomb
	H.mind.special_items["Firebomb Two"] = /obj/item/bomb
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)

/datum/quirk/pineapple
	name = "No safeword."
	desc = "I enjoy whipping people until they squirm and whine, I am skilled at using whips, and have a hidden one somewhere."
	value = 2

/datum/quirk/pineapple/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.special_items["Whip"] = /obj/item/rogueweapon/whip
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)

/datum/quirk/packed_lunch
	name = "Packed Lunch"
	desc = "I don't like going around hungry so I packed my lunch!"
	value = 1

/datum/quirk/packed_lunch/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/bag = new /obj/item/storage/roguebag/lunch(get_turf(H))
	H.put_in_hands(bag, forced = TRUE)

/datum/quirk/thief
	name = "Thief"
	desc = "Life's not easy around here, but I've made mine a little easier by taking things of others. I am a great at picking pockets and locks. I've stashed some picks nearby."
	value = 3

/datum/quirk/thief/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 4, TRUE)
	H.mind.special_items["Lockpicks"] = /obj/item/lockpickring/mundane


/datum/quirk/languagesavant
	name = "Polyglot"
	desc = "I have always picked up on languages easily. I know the languages of all the races found in this land, and my flexible tongue is certainly useful in the bedchamber."
	value = 2//Believe it or not, this is a really niche quirk with very few actual use-cases.

/datum/quirk/languagesavant/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/dwarvish)
	H.grant_language(/datum/language/elvish)
	H.grant_language(/datum/language/hellspeak)
	H.grant_language(/datum/language/celestial)
	H.grant_language(/datum/language/orcish)
	H.grant_language(/datum/language/beast)
	H.grant_language(/datum/language/draconic)
	H.grant_language(/datum/language/faexin)
	H.grant_language(/datum/language/canilunzt)
	H.grant_language(/datum/language/grenzelhoftian)
	H.grant_language(/datum/language/thievescant)
	ADD_TRAIT(H, TRAIT_GOODLOVER, QUIRK_TRAIT)

/datum/quirk/civilizedbarbarian
	name = "Tavern Brawler"
	desc = "I am a barstool warrior. Improvised weapons are more effective in my hands."
	value = 2

/datum/quirk/civilizedbarbarian/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC) //Need to make trait improve hitting people with chairs, mugs, goblets.

/datum/quirk/mastercraftsmen // Named this way to absorb the old quirk. Keeps old saves cleaner without them needing to reset quirks.
	name = "Jack of All Trades"
	desc = "I've always had steady hands. I'm experienced enough in most fine craftsmanship to make a career out of it, if I can procure my own tools."
	value = 3 //

/datum/quirk/mastercraftsmen/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 3, TRUE)

/datum/quirk/masterbuilder
	name = "Practiced Builder"
	desc = "I have experience in putting up large structures and foundations for buildings. I can even use a sawmill if I can find one, and I have a handcart and two sacks hidden away for transporting my construction materials."
	value = 1 // I have a lot of respect for people who actually bother making buildings that will be deleted within an hour or two.

/datum/quirk/masterbuilder/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 4, TRUE) // Needed to install things like levers in a house. This unfortunately means construction workers can make illegal firearms.
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE) // Pretty sure some crafting stations use this. Also stone axes and whatever other basic tools they need.
	H.mind.special_items["Handcart"] = /obj/structure/handcart //TO-DO: Implement sawmill and the trait to use it. Giving them a handcart to move materials with.
	H.mind.special_items["Sack 1"] = /obj/item/storage/roguebag
	H.mind.special_items["Sack 2"] = /obj/item/storage/roguebag

/datum/quirk/mastersmith
	name = "Practiced Smith"
	desc = "I am a metalworker by trade, and I have the tools for my practice stashed away." // Needs looking at after the smithing rework goes through.
	value = 1 // Armor-making. Weapon-making. Everyone wants the gamer gear.

/datum/quirk/mastersmith/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.special_items["Hammer"] = /obj/item/rogueweapon/hammer/claw // works same as normal hammer.
	H.mind.special_items["Tongs"] = /obj/item/rogueweapon/tongs
	H.mind.special_items["Coal"] = /obj/item/rogueore/coal

/datum/quirk/mastertailor
	name = "Practiced Tailor"
	desc = "I'm particularly skilled in working with needle, thread, and loom. I also have a needle, thread, and scissors hidden away."
	value = 1

/datum/quirk/mastertailor/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)//Being skilled with a needle offers some overlap with stitching up peoples' wounds. Also, weaving isn't a skill anymore so...
	H.mind.special_items["Scissors"] = /obj/item/rogueweapon/huntingknife/scissors/steel
	H.mind.special_items["Needle"] = /obj/item/needle
	H.mind.special_items["Thread"] = /obj/item/natural/bundle/fibers/full
	ADD_TRAIT(H, TRAIT_TAILOR, TRAIT_GENERIC)

/datum/quirk/bleublood
	name = "Noble Lineage"
	desc = "I am of noble blood."
	value = 1

/datum/quirk/bleublood/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NOBLE, QUIRK_TRAIT)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)

/datum/quirk/richpouch
	name = "Rich Pouch"
	desc = "I have a pouch full of mammons."
	value = 1

/datum/quirk/richpouch/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/pouch = new /obj/item/storage/belt/rogue/pouch/coins/rich(get_turf(H))
	H.put_in_hands(pouch, forced = TRUE)


/datum/quirk/swift
	name = "Speedster"
	desc = "I am very athletic and fast. Not only can I avoid collisions while sprinting, but I can also better dodge hits coming my way if I'm not wearing any armor."
	value = 4

/datum/quirk/swift/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_SWIFTRUNNER, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_GOODRUNNER, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_DODGEADEPT, QUIRK_TRAIT)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.change_stat("speed", 2)

/datum/quirk/gourmand
	name = "Gourmand"
	desc = "I can eat even the most spoiled, raw, or toxic food and water as if they were delicacies. I'm even immune to the berry poison some folk like to coat their arrows with."
	value = 2

/datum/quirk/gourmand/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NASTY_EATER, QUIRK_TRAIT)

//neutral
/datum/quirk/backproblems
	name = "Giant"
	desc = "I've always been called a giant (atleast among my kin). I am valued for my stature, but, this world made for smaller folk has forced me to move cautiously."
	value = 0 //-2 speed is -30% movement speed, and the single point of constitution is traded for a significantly larger sprite. Remove the speed penalty or it stays neutral.

/datum/quirk/backproblems/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", 2)
	H.change_stat("constitution", 1)
	H.change_stat("speed", -2)
	H.transform = H.transform.Scale(1.25, 1.25)
	H.transform = H.transform.Translate(0, (0.25 * 16))
	H.update_transform()

//negative
/datum/quirk/nimrod
	name = "Nimrod"
	desc = "In the past I learned slower than my peers, and I tend to be clumsy."
	value = -6

/datum/quirk/nimrod/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("speed", -2)
	H.change_stat("intelligence", -4)

/datum/quirk/nopouch
	name = "No Pouch"
	desc = "I lost my pouch recently, I'm without a zenny.."
	value = -1

/datum/quirk/nopouch/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/pouch = locate(/obj/item/storage/belt/rogue/pouch) in H
	if(H.wear_neck == pouch)
		H.wear_neck = null
	if(H.beltl == pouch)
		H.beltl = null
	if(H.beltr == pouch)
		H.beltr = null
	qdel(pouch)

/datum/quirk/hussite
	name = "Excommunicated"
	desc = "I've been denounced by powerful men of faith, for reasons legitimate or not, and can no longer use divine magic, if I could in the first place. I came to Stonehedge on a rumor that the local Adventurers' Guild could put in a good word for me with the local shrine and find the Gods' forgiveness."
	value = -1

/datum/quirk/hussite/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	GLOB.excommunicated_players += H.real_name
	H.devotion?.excommunicate()

/datum/quirk/bounty
	name = "Hunted Man (NOT WANTED BY GROVE)"
	desc = "Someone put a bounty on my head, whether for legitimate reasons or not. The local Adventurers' Guild might be able to protect me if I can make some friends there, but my life will always be in danger from those seeking to collect. (I can get attacked by other people for bounty as justification, for capture or death.)"
	value = -3

/datum/quirk/bounty/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/bounty_reason = ""
	var/employer = "unknown employer"
	var/employer_gender
	if(prob(65))
		employer_gender = MALE
	else
		employer_gender = FEMALE
	if(employer_gender == MALE)
		employer = pick(list("Baron", "Lord", "Nobleman", "Prince"))
	else
		employer = pick(list("Duchess", "Lady", "Noblelady", "Princess"))
	employer = "[employer] [random_human_name(employer_gender, FALSE, FALSE)]"
	var/amount = rand(150,300)
	bounty_reason = pick_list_replacements("bounties.json", "bounties_reasons")
	add_bounty(H.real_name, amount, FALSE, bounty_reason, employer)
	to_chat(H, span_notice("Whether I done it or not, I have been accused of [bounty_reason], and a [employer] put a bounty on my head!"))

/datum/quirk/outlaw
	name = "Outlaw (WANTED BY GROVE)"
	desc = "I'm on the wrong side of the law, I've managed to avoid capture so far but the law is coming for me, it's only a matter of time."
	value = -4

/datum/quirk/outlaw/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.apply_status_effect(/datum/status_effect/grove_outlaw, "Wanted Fugitive")
	make_outlaw(H.real_name, TRUE)
	H.mind.special_items["Rag Mask"] = /obj/item/clothing/mask/rogue/ragmask

/datum/quirk/sillyvoice
	name = "Annoying"
	desc = "People really hate my voice for some reason."
	value = -1

/datum/quirk/sillyvoice/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_COMICSANS, QUIRK_TRAIT)

/datum/quirk/unlucky
	name = "Unlucky"
	desc = "Ever since you knocked over that glass vase, you just feel... off"
	value = -6

/datum/quirk/unlucky/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.STALUC = rand(1, 10)


/datum/quirk/jesterphobia
	name = "Jesterphobic"
	desc = "I have a severe, irrational fear of Jesters"
	value = -1

/datum/quirk/jesterphobia/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_JESTERPHOBIA, QUIRK_TRAIT)

/datum/quirk/wild_night
	name = "Wild Night"
	desc = "I don't remember what I did last night, and now I'm lost!"
	value = -1

/datum/quirk/wild_night/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/turf/location = get_spawn_turf_for_job("Pilgrim")
	H.forceMove(location)

/datum/quirk/atrophy
	name = "Atrophy"
	desc = "When growing up I could barely feed myself. This has left my body weak and fragile."
	value = -6

/datum/quirk/atrophy/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", -2)
	H.change_stat("constitution", -2)
	H.change_stat("endurance", -2)

/datum/quirk/nude_sleeper
	name = "Picky Sleeper"
	desc = "I just can't seem to fall asleep unless I'm <i>truly</i> comfortable..."
	value = -3 //Sleeping people are already rather vulnerable. Having to take off literally everything is more than just bothersome.

/datum/quirk/nude_sleeper/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NUDE_SLEEPER, QUIRK_TRAIT)

// disgustingly hooking into quirks to provide a convenient way to become a vampire
/datum/quirk/vampire
	name = "Cursed Blood (Vampire)"
	desc = "You are gifted by Undeath. A lone vampire forced to roam the lands and drink blood to survive, albeit 'immortal'. Whether you are Ancient or a new vampire, you are no lord or no spawn and have no reason to antagonize the mortals beyond occasionally finding blood to keep you going. (You are a vampire but NOT an ANTAGONIST.)"
//	desc = "You've existed long before the gods existed, you know the truth and have no reason to worship them. You are faithless. After attaining power, Levishth has cursed your people, bringing bad omens where ever you go. For this reason, the people of Stonehedge have shunned you and discriminated against you, there is no possible way an antediluvian will ever hold a position of power in Stonehedge, let alone be welcomed. Levishth has only shown favor to one antediluvian, rewarding them with the title of Vampire Lord, and gifting them powers far beyond that of a regular nitecreacher. Your pale skin, fangs, and eerie eyes are EASILY identifable features, so it is best to stay covered at all times in public areas."
	value = 5

/datum/quirk/vampire/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/antagonist/vampirelord/lesser/secret/new_antag = new ()
	H.mind.add_antag_datum(new_antag)

/datum/antagonist/vampirelord/lesser/secret
	ashes = FALSE
	is_solo = TRUE
	confess_lines = list(
		"THE CRIMSON CALLS!",
		"THE SUN IS ENEMY!",
	)

/datum/antagonist/vampirelord/lesser/secret/on_gain()
	. = ..()
	owner.current.verbs -= /mob/living/carbon/human/proc/vampire_telepathy

/datum/antagonist/vampirelord/lesser/secret/roundend_report()
	return

/datum/antagonist/vampirelord/lesser/secret/move_to_spawnpoint()
	return

/datum/quirk/hypersensitivity
	name = "Hypersensitivity"
	desc = "I am so senstiive even my pants are enough to constantly arouse me... I must not wear pants or wear things that don't touch my groin. Atleast my experiences with certain things make me good in bed."
	value = -3 // this thing really really sucks to have. I watched someone suffer all round with it.

/datum/quirk/hypersensitivity/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.add_curse(/datum/curse/nympho, TRUE)
	ADD_TRAIT(H, TRAIT_GOODLOVER, QUIRK_TRAIT)

/datum/quirk/loveless
	name = "Loveless"
	desc = "I am unable to show any kind of affection or love, whether carnal or platonic."
	value = -3

/datum/quirk/loveless/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.add_curse(/datum/curse/eora, TRUE)

/datum/quirk/pacifist
	name = "Pacifist"
	desc = "Violence disgusts me. I cannot bring myself to wield any kind of physical weapon."
	value = -6

/datum/quirk/pacifist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_PACIFISM, QUIRK_TRAIT)


/datum/quirk/endowed
	name = "Endowment Curse"
	desc = "I was cursed with endowment... This makes life hard."
	value = -2

/datum/quirk/endowed/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.apply_status_effect(/datum/status_effect/debuff/bigboobs/permanent)

/datum/quirk/endowedlite
	name = "Naturally Endowed"
	desc = "I have massive bits, they are natural and not emburdening like an enchanted endowment."
	value = 0

/datum/quirk/endowedlite/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.apply_status_effect(/datum/status_effect/debuff/bigboobs/permanent/lite)

/datum/quirk/vore
    name = "Vore"
    desc = "You can engage in Vore."
    value = 0
    mob_trait = TRAIT_VORE

/datum/quirk/vore/add()
    var/mob/living/carbon/human/H = quirk_holder
    var/list/vore_verbs = list(
        /mob/living/carbon/verb/toggle_vore_mode_verb,
        /mob/living/verb/insidePanel,
        /mob/living/verb/escapeOOC,
        /mob/living/verb/lick,
        /mob/living/verb/preyloop_refresh
    )
    H.verbs |= vore_verbs
    H.vore_flags |= SHOW_VORE_PREFS

/datum/quirk/vore/remove()
    var/mob/living/carbon/human/H = quirk_holder
    var/list/vore_verbs = list(
        /mob/living/carbon/verb/toggle_vore_mode_verb,
        /mob/living/verb/insidePanel,
        /mob/living/verb/escapeOOC,
        /mob/living/verb/lick,
        /mob/living/verb/preyloop_refresh
    )
    H.verbs -= vore_verbs
    H.vore_flags &= ~SHOW_VORE_PREFS
    H.disable_vore_mode()

/datum/quirk/maniac
	name = "Cursed"
	desc = "I keep experiencing vivid hallucinations. What is happening here?!"
	value = -4 //it can stun you and knock you down if you get hit by a certain hallucination and make your screen shake in combat.

/datum/quirk/maniac/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.add_curse(/datum/curse/zizo, TRUE)
	ADD_TRAIT(H, TRAIT_SCHIZO_AMBIENCE, QUIRK_TRAIT)
	H.cmode_music = 'sound/music/combat_maniac2.ogg' //You gotta understand it's very important.

/datum/quirk/maniacextra
	name = "Cursed (Extra)"
	desc = "I keep experiencing vivid hallucinations. What is happening here?! (Same as Cursed, except the fourth wonder sequence will start when the round starts ending.)"
	value = -6

/datum/quirk/maniacextra/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.add_curse(/datum/curse/zizo, TRUE)
	ADD_TRAIT(H, TRAIT_SCHIZO_AMBIENCE, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_SOONTOWAKEUP, QUIRK_TRAIT)
	H.cmode_music = 'sound/music/combat_maniac2.ogg'

/datum/quirk/guarded
	name = "Guarded"
	desc = "I have long kept my true capabilities a secret. Sometimes being deceptively weak can save one's life. Such a virtue allows me to see and avoid feints easier."
	value = 3

/datum/quirk/guarded/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_FEINTMASTER, QUIRK_TRAIT)

/datum/quirk/rotcured
	name = "Rot-Cured"
	desc = "I was once afflicted with the accursed rot, and was cured. It has left me changed: my limbs are weaker, but I feel no pain and have no need to breathe..."

/datum/quirk/rotcured/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_EASYDISMEMBER, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_NOPAIN, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_NOBREATH, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_ROTMAN, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_TOXIMMUNE, QUIRK_TRAIT)
	H.update_body()

/datum/quirk/ambidextrous
	name = "Ambidextrous"
	desc = "I am able to use my right and left hands equally well."
	value = 1

/datum/quirk/ambidextrous/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_AMBIDEXTROUS, QUIRK_TRAIT)

/datum/quirk/doggo
	name = "Strong Bite"
	desc = "Biting people has never been so easy."
	value = 3 //It is literally strong.

/datum/quirk/doggo/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_STRONGBITE, QUIRK_TRAIT)

/datum/quirk/prosopagnosia
	name = "Face-blind"
	desc = "I am unable to recognize faces at all."
	value = -3

/datum/quirk/prosopagnosia/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_PROSOPAGNOSIA, QUIRK_TRAIT)

/datum/quirk/martialeye
	name = "Martial Eye"
	desc = "Unlike others, I can gauge someone's speed and exertion at a glance."
	value = 3

/datum/quirk/martialeye/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_MARTIALEYE, QUIRK_TRAIT)

/datum/quirk/sloppysleeper
	name = "Sloppy Sleeper"
	desc = "I fall asleep quickly, and can even sleep in some armor if I'm wearing any."
	value = 3

/datum/quirk/sloppysleeper/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_FASTSLEEP, QUIRK_TRAIT)
	ADD_TRAIT(H, TRAIT_SLOPPYSLEEPER, QUIRK_TRAIT)
