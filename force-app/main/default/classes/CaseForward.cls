public class CaseForward {
	public static void updateCurrentCase(List<Case> csList, Map<Id, Case> oldMap)
    {
        Set<ID> conId = new Set<ID>();
        for (Case cs : csList)
        {
            if (cs.IsEscalated == true & cs.IsEscalated != oldMap.get(cs.Id).IsEscalated)
            {
                //cs.IsEscalated = true;
                conId.add(cs.ContactId);
            }
        }
        
        if (!conId.isEmpty())
        {
            Contact con = getContact(conId);
            
            con.Level__c = 'Secondary';
            
            Update con;
        }
    }
    
    private static Contact getContact(Set<ID> conId)
    {
        return [SELECT ID, Name FROM Contact WHERE ID IN :conId LIMIT 1];
    }
}