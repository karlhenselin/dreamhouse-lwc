public class DuplicateAccountCleaner {

    public void deleteDuplicateAccounts() {
        // Step 1: Query all Accounts sorted by Name and created date.
        List<Account> accounts = [SELECT Id, Name FROM Account ORDER BY Name, CreatedDate ASC];
        
        // Step 2: Map to track duplicate Account Names
        Map<String, Account> uniqueAccounts = new Map<String, Account>();
        
        // List to hold Accounts that need to be deleted
        List<Account> accountsToDelete = new List<Account>();
        
        // Step 3: Iterate over Accounts to find duplicates
        for (Account acc : accounts) {
            if (uniqueAccounts.containsKey(acc.Name)) {
                // If the Name already exists, mark this one for deletion
                accountsToDelete.add(acc);
            } else {
                // If this is the first time we've seen the Name, add it to the unique map
                uniqueAccounts.put(acc.Name, acc);
            }
        }
        
        // Step 4: Delete duplicate Accounts
        if (!accountsToDelete.isEmpty()) {
            try {
                delete accountsToDelete;
                System.debug('Deleted ' + accountsToDelete.size() + ' duplicate Accounts.');
            } catch (DmlException e) {
                System.debug('Error deleting Accounts: ' + e.getMessage());
            }
        } else {
            System.debug('No duplicate Accounts found.');
        }
    }
}