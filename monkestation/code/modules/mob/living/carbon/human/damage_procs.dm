/mob/living/carbon/human/revive(full_heal_flags = NONE, excess_healing = 0, force_grab_ghost = FALSE)
	if(..())
		if(dna && dna.species)
			INVOKE_ASYNC(src,dna.species.spec_revival(src))
