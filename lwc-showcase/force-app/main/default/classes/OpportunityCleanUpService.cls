public with sharing class OpportunityCleanUpService {

    private OpportunityCleanUpService() {
    }
  
    public ServiceResult execute(List<Opportunity> Opportunities) {
      List<Opportunity> OpportunitiesToDelete = new List<Opportunity>();
  
      for (Opportunity currentOpportunity : Opportunities) {

        if (currentOpportunity.CloseDate < Date.today()) {
            OpportunitiesToDelete.add(currentOpportunity);
        }
      }
  
      ServiceResult result = new ServiceResult();
      result.ToDelete.addAll((List<SObject>)OpportunitiesToDelete);
  
      return result;
    }
  
    public static OpportunityCleanUpService build() {
      return new OpportunityCleanUpService();
    }
}
