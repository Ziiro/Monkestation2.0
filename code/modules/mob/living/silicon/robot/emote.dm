/datum/emote/silicon
	// MONKESTATION REMOVAL - Replaced with `/datum/emote/silicon/can_run_emote()`, which is used to
	// enable silicon emotes for users with synthetic voice boxes.
	//mob_type_allowed_typecache = list(/mob/living/silicon, /mob/living/simple_animal/bot)
	emote_type = EMOTE_AUDIBLE
	trait_required = TRAIT_SILICON_EMOTES_ALLOWED

/datum/emote/silicon/boop
	key = "boop"
	key_third_person = "boops"
	message = "boops."

/datum/emote/silicon/beep
	key = "beep"
	key_third_person = "beeps"
	message = "beeps."
	message_param = "beeps at %t."
	sound = 'sound/machines/twobeep.ogg'
	emote_type = EMOTE_AUDIBLE


/datum/emote/silicon/buzz
	key = "buzz"
	key_third_person = "buzzes"
	message = "buzzes."
	message_param = "buzzes at %t."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/machines/buzz-sigh.ogg'


/datum/emote/silicon/buzz2
	key = "buzz2"
	message = "buzzes twice."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/machines/buzz-two.ogg'

/datum/emote/silicon/chime
	key = "chime"
	key_third_person = "chimes"
	message = "chimes."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/machines/chime.ogg'

/datum/emote/silicon/honk
	key = "honk"
	key_third_person = "honks"
	message = "honks."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'sound/items/bikehorn.ogg'

/datum/emote/silicon/ping
	key = "ping"
	key_third_person = "pings"
	message = "pings."
	message_param = "pings at %t."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/machines/ping.ogg'

/datum/emote/silicon/sad
	key = "sad"
	message = "plays a sad trombone..."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/misc/sadtrombone.ogg'

/datum/emote/silicon/warn
	key = "warn"
	message = "blares an alarm!"
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/machines/warning-buzzer.ogg'

/datum/emote/silicon/slowclap
	key = "slowclap"
	message = "activates their slow clap processor."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/machines/slowclap.ogg'
