public with sharing class Batch_PastOpportunitiesLost implements Database.Batchable<SObject>{
  public Batch_PastOpportunitiesLost(){}

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return database.getQueryLocator(
          [
            SELECT
              Id,
              StageName,
              CloseDate
            FROM Opportunity 
            WHERE
            StageName != 'Closed Won'
            AND CloseDate < TODAY
          ]
        );
      }

      public void execute(Database.BatchableContext context, List<Opportunity> scope) {
        OpportunityCleanUpService cleanupService = OpportunityCleanUpService.build();
    
        ServiceResult result = cleanupService.execute(scope);
    
        delete new List<SObject>(result.ToDelete);
      }
    
      public void finish(Database.BatchableContext context) {
      }
}
