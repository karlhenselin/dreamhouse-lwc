trigger CaseTrigger on Case (after update) {
	if (trigger.isAfter)
    {
        if (trigger.isUpdate)
        {
            CaseForward.updateCurrentCase(trigger.new, trigger.oldMap);
        }
    }
}