@IsTest
public with sharing class OpportunityHandlerTest {
    @IsTest
    public static void GivenClosedWonOpportunities_WhenOpportuntiesUpdate_CloseDateIsUpdated() {
        // Arrange
        Opportunity testOpportunityOld = new Test_OpportunityFactory().withId().withName('testOppNew').withStage(OpportunityStages.PROSPECTING).withCloseDate(300).build();
        Opportunity testOpportunityUpdated = new Test_OpportunityFactory().withId(testOpportunityOld.Id).withName('testOppNew').withStage(OpportunityStages.CLOSED_WON).withCloseDate(300).build();

        // Act
        OpportunityHandler handler = new OpportunityHandler();
        handler.beforeUpdate(
          new List<Opportunity>{ testOpportunityUpdated },
          new Map<Id, Opportunity>{ testOpportunityUpdated.Id => testOpportunityUpdated },
          new List<Opportunity>{ testOpportunityOld },
          new Map<Id, Opportunity>{ testOpportunityOld.Id => testOpportunityOld }
        );
        // Assert
        system.assertEquals(Date.today(), testOpportunityUpdated.CloseDate);
    }

    @IsTest
    public static void GivenNotClosedWonOpportunities_WhenOpportuntiesUpdate_CloseDateNoNotUpdate() {
        // Arrange
        Opportunity testOpportunity = new Test_OpportunityFactory().withName('testOppNew').withStage(OpportunityStages.PROSPECTING).withCloseDate(300).create();
        // Act
        testOpportunity.StageName = OpportunityStages.CLOSED_LOST;
        update testOpportunity;
        // Assert
        system.assertNotEquals(Date.today(), testOpportunity.CloseDate);
    }
}
