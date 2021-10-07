public with sharing class AccountSelector {
    public List<Account> selectAccountsByIndustry(
        String pIndustry
      ) {
        return [
          SELECT Id, Name, Phone, Website, Account_Owner__c, Industry,AnnualRevenue
          FROM Account
          WHERE
          Industry =: pIndustry
          ORDER BY Name ASC
        ];
      }
      public List<Account> GetAccountsWithNameLike( String pIndustry,String searchKey ) {
        return [ 
          SELECT Id, Name, Phone, Website, Account_Owner__c, Industry,AnnualRevenue
          FROM Account
          WHERE
          Industry =: pIndustry 
          AND Name LIKE: searchKey
        ];
    }
}
