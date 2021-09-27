@IsTest
public with sharing class Test_OpportunityFactory {
    private Opportunity internal;
    public Test_OpportunityFactory() {
      this.internal = new Opportunity();
    }

    public Test_OpportunityFactory withId() {
        this.internal.Id = Test_Utils.generateId(Opportunity.getSObjectType());
    
        return this;
    }

    public Test_OpportunityFactory withId(Id pId) {
        this.internal.Id = pId;
    
        return this;
    }

    public Test_OpportunityFactory withName(String pName) {
        this.internal.Name = pName;
    
        return this;
    }

    public Test_OpportunityFactory withCloseDate(Integer pDaysFromNow) {
        this.internal.CloseDate = System.today().addDays(pDaysFromNow);
    
        return this;
    }

    public Test_OpportunityFactory withStage(String pStage) {
        this.internal.StageName = pStage;
    
        return this;
    }

    public Opportunity build() {
        return this.internal;
    }
    
    public Opportunity create() {
        insert this.internal;
    
        return this.internal;
    }
}
