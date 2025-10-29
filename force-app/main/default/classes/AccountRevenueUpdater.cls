public class AccountRevenueUpdater {
    // Method to update the AnnualRevenue of the Account based on related Opportunities
    public static void updateAccountRevenue(Id accountId) {
        // Query Opportunities related to the Account that are in 'Closed Won' stage
        List<Opportunity> opportunities = [SELECT Amount FROM Opportunity WHERE AccountId = :accountId AND StageName = 'Closed Won'];

        // Calculate the total amount of the closed-won Opportunities
        Decimal totalRevenue = 0;
        for (Opportunity opp : opportunities) {
            totalRevenue += opp.Amount;
        }

        // Query the Account and update the AnnualRevenue field
        Account accountToUpdate = [SELECT Id, AnnualRevenue FROM Account WHERE Id = :accountId LIMIT 1];
        accountToUpdate.AnnualRevenue = totalRevenue;

        // Update the Account record
        update accountToUpdate;
        
        // Developer 2 - feature/CH19003
    }
}