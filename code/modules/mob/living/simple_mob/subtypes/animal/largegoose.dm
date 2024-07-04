/mob/living/simple_mob/animal/largegoose
	name = "buff goose"
	desc = "It's big and very angry!"
	tt_desc = "E Branta canadensis"
	icon = 'icons/mob/64x64.dmi'
	icon_state = "buffgoose"
	icon_living = "buffgoose"
	icon_dead = "buffgoose_dead"

	faction = "geese"

	maxHealth = 250
	health = 250

	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	harm_intent_damage = 5
	melee_damage_lower = 7 //they're meant to be annoying, not threatening.
	melee_damage_upper = 7 //unless there's like a dozen of them, then you're screwed.
	movement_cooldown = 1
	attacktext = list("pecked")
	attack_sound = 'sound/weapons/bite.ogg'

	organ_names = /decl/mob_organ_names/largegoose

	has_langs = list(LANGUAGE_ANIMAL)

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/chicken
	meat_amount = 6

/datum/say_list/largegoose
	speak = list("HONK!")
	emote_hear = list("honks loudly!")
	say_maybe_target = list("Honk?")
	say_got_target = list("HONK!!!")

/mob/living/simple_mob/animal/largegoose/handle_special()
	if((get_AI_stance() in list(STANCE_APPROACH, STANCE_FIGHT)) && !is_AI_busy() && isturf(loc))
		if(health <= (maxHealth * 0.25)) // At a quarter of its health, and fighting someone currently.
			berserk()

/mob/living/simple_mob/animal/largegoose/verb/berserk()
	set name = "Berserk"
	set desc = "Enrage and become vastly stronger for a period of time, however you will be weaker afterwards."
	set category = "Abilities"

	add_modifier(/datum/modifier/berserk, 30 SECONDS)

/decl/mob_organ_names/largegoose
	hit_zones = list("head", "chest", "left leg", "right leg", "left wing", "right wing", "neck")
/mob/living/simple_mob/animal/largegoose/elite
	icon = 'icons/mob/75x100.dmi'
	icon_state = "elitegoose"
	icon_living = "elitegoose"
	icon_dead = "elitegoose_dead"
	name = "elite goose"
	desc = "A seasoned and stylish soldier"

	maxHealth = 500
	health = 500
	melee_damage_lower = 10
	melee_damage_upper = 10
	movement_cooldown = 2
