public class ApexUtilSalesforce {
	public static boolean checkName(String pName)
    {
        if(pName.length()>2)
        {
            return true;
        }
        else
        {
           return false;
        }
    }
}