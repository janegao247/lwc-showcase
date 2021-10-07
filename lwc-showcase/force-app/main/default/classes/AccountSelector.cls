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
      public List<Account> selectAccountsByIndustryWithNameLike( String pIndustry,String pSearchKey ) {
        return [ 
          SELECT Id, Name, Phone, Website, Account_Owner__c, Industry,AnnualRevenue
          FROM Account
          WHERE
          Industry =: pIndustry 
          AND Name LIKE: pSearchKey
          ORDER BY Name ASC
        ];
    }
}
