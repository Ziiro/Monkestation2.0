/mob/living/carbon/human/revive(full_heal_flags = NONE, excess_healing = 0, force_grab_ghost = FALSE)
	if(..())
		if(dna && dna.species)
			INVOKE_ASYNC(dna.species, TYPE_PROC_REF(/datum/species/ipc, spec_revival), src) // temporary snowflake but works as a proof-of-concept for the solution. to do: pass species a var or something.
