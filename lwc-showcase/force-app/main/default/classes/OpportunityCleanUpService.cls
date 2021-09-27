public with sharing class OpportunityCleanUpService {

    private OpportunityCleanUpService() {
    }
  
    public ServiceResult execute(List<Opportunity> Opportunities) {
      List<Opportunity> OpportunitiesToUpdate = new List<Opportunity>();
  
      for (Opportunity currentOpportunity : Opportunities) {
        currentOpportunity.StageName = OpportunityStages.CLOSED_LOST;
        OpportunitiesToUpdate.add(currentOpportunity);
      }
  
      ServiceResult result = new ServiceResult();
      result.ToUpdate.addAll((List<SObject>)OpportunitiesToUpdate);
  
      return result;
    }
  
    public static OpportunityCleanUpService build() {
      return new OpportunityCleanUpService();
    }
}
