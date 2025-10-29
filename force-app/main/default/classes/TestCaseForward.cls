@isTest
private class TestCaseForward {
	@testSetup //TESTING DATA
    private static void testData()
    {
        Contact con = new Contact();
        con.Salutation = 'Mr';
        con.LastName = 'Deploy';
        con.FirstName = 'Flex';
        con.Level__c = 'Primary';
        Insert con;
        
        Case cs = new Case();
        cs.Status = 'New';
        cs.Origin = 'Web';
        cs.ContactId = con.Id;
        cs.Subject = 'Test';
        Insert cs;
    }
    
    @isTest
    private static void updateCurrentCaseTest()
    {
        Case csTest = [SELECT ID, Status, IsEscalated FROM Case LIMIT 1];
        
        csTest.IsEscalated = true;
        
        Test.startTest();
        Update csTest;
        Test.stopTest();
        
        Contact conResult = [SELECT ID, Level__c FROM Contact LIMIT 1];
        System.assertEquals('Secondary', conResult.Level__c);
    }
}