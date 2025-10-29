public class Demo4 {
    public void insertaccandcon(){
        Account acc = new Account();
        acc.Name='Apex Demo 4';
        insert acc;
        for(integer i=1;i<=5;i++)
        {
            Contact con = new Contact();
            con.FirstName= 'Demo'+i;
            con.LastName= 'Apex'+i;
            con.AccountId=acc.Id;
            insert con;
        }
    }

}