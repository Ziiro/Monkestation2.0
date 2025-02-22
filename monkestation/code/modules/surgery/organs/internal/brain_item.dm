// IPC brain stuff. This is for using normal Posibrain objects as an IPC Posibrain.
/obj/item/organ/internal/brain/mmi_holder
	name = "implanted MMI brain" // ignore the fact that, for the moment, this base type is not used. maybe some day.
	slot = ORGAN_SLOT_BRAIN
	zone = BODY_ZONE_CHEST
	status = ORGAN_ROBOTIC
	var/remove_on_qdel = FALSE // The actual "organ" deletes itself on removal, because it's just a holder.
	var/obj/item/mmi/stored_mmi
	var/mmi_type = /obj/item/mmi/

/obj/item/organ/internal/brain/mmi_holder/posibrain
	name = "positronic brain"
	mmi_type = /obj/item/mmi/posibrain/ipc

/obj/item/organ/internal/brain/mmi_holder/Destroy()
	QDEL_NULL(stored_mmi)
	return ..()

/obj/item/organ/internal/brain/mmi_holder/Insert(mob/living/carbon/receiver, special = FALSE, no_id_transfer = FALSE)
	receiver.organs |= src
	receiver.organs_slot[slot] = src
	owner = receiver
	loc = null
	//the above bits are copypaste from organ/proc/Insert, because I couldn't go through the parent here.

	if(stored_mmi.brainmob)
		if(receiver.key)
			receiver.ghostize()
		var/mob/living/brain/B = stored_mmi.brainmob
		if(stored_mmi.brainmob.mind)
			B.mind.transfer_to(receiver)
		else
			receiver.key = B.key

	if(ishuman(receiver))
		var/mob/living/carbon/human/H = receiver
		if(HAS_TRAIT(H, TRAIT_REVIVES_BY_HEALING) && H > SYNTH_BRAIN_WAKE_THRESHOLD)
			if(!HAS_TRAIT(H, TRAIT_DEFIB_BLACKLISTED))
				H.revive(FALSE)

	update_from_mmi()

/obj/item/organ/internal/brain/mmi_holder/Remove(var/mob/living/user, special = 0)
	if(!special)
		if(stored_mmi)
			. = stored_mmi
			if(owner.mind)
				owner.mind.transfer_to(stored_mmi.brainmob)
			stored_mmi.loc = owner.loc
			if(stored_mmi.brainmob)
				var/mob/living/brain/B = stored_mmi.brainmob
				spawn(0)
					if(B)
						B.stat = 0
			stored_mmi = null

	..()
	spawn(0)//so it can properly keep surgery going
		qdel(src)

/obj/item/organ/internal/brain/mmi_holder/proc/update_from_mmi()
	if(!stored_mmi)
		return
	name = stored_mmi.name
	desc = stored_mmi.desc
	icon = stored_mmi.icon
	icon_state = stored_mmi.icon_state

/obj/item/organ/internal/brain/mmi_holder/posibrain/New(var/obj/item/mmi/MMI)
	. = ..()
	if(MMI)
		stored_mmi = MMI
		MMI.forceMove(src)
	else
		stored_mmi = new /obj/item/mmi/posibrain/ipc(src)
	spawn(5)
		if(owner && stored_mmi)
			stored_mmi.name = "positronic brain ([owner.real_name])"
			stored_mmi.brainmob.real_name = owner.real_name
			stored_mmi.brainmob.name = stored_mmi.brainmob.real_name
			stored_mmi.icon_state = "posibrain-occupied"
			update_from_mmi()

/obj/item/organ/internal/brain/mmi_holder/emp_act(severity)
	switch(severity)
		if(1)
			owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, 55)
			to_chat(owner, "<span class='warning'>Alert: Posibrain heavily damaged.</span>")
		if(2)
			owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15)
			to_chat(owner, "<span class='warning'>Alert: Posibrain damaged.</span>")
