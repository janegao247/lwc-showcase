import { LightningElement, wire, track } from "lwc";
import { NavigationMixin } from "lightning/navigation";
import { CurrentPageReference } from "lightning/navigation";
// import getUserInfo from "@salesforce/apex/ServiceContractController.getUserInfo";

export default class MegaMenu extends NavigationMixin(LightningElement) {
  currentPageReference = null;
  urlPageName = null;
  isHomePage = false;
  toggle = 0;
  @track loggedUser;
  @track showTms = false;
  @track showEquities = false;
  @track showNetwork = true;

  // connectedCallback() {
  //   this.invokeApexMethods();
  // }
  // async invokeApexMethods() {
  //   try {
  //     this.loggedUser = await getUserInfo();
  //     if (this.loggedUser.Account.Firm_Activity__c) {
  //       var activityString = this.loggedUser.Account.Firm_Activity__c;
  //       //condition for network tab
  //       if (
  //         activityString === "Data Vendor" ||
  //         activityString === "Sponsored Firm" ||
  //         activityString === "Data Vendor;Sponsored Firm" ||
  //         activityString === "Sponsored Firm;Data Vendor"
  //       ) {
  //         this.showNetwork = false;
  //       }
  //       //condition for eq or tms tabs
  //       if (activityString.includes("PO") || activityString.includes("TSX")) {
  //         this.showEquities = true;
  //       }
  //       if (activityString.includes("FAP") || activityString.includes("AP")) {
  //         this.showTms = true;
  //       }
  //     } else {
  //       //when firm activity is empty, they cannot see any of the three tabs
  //       this.showNetwork = false;
  //       this.showTms = false;
  //       this.showEquities = false;
  //     }
  //   } catch (error) {
  //     console.log("connected call back error on megaMenu" + error);
  //   } finally {
  //   }
  // }
  @wire(CurrentPageReference)
  getStateParameters(currentPageReference) {
    if (currentPageReference) {
      this.urlPageName = currentPageReference.attributes.name;
      if (this.urlPageName == "Home") {
        this.isHomePage = true;
      }
    }
  }
  goToDashboard() {
    this[NavigationMixin.Navigate]({
      type: "comm__namedPage",
      attributes: {
        name: "Home"
      }
    });
    this.template.querySelector(".hamburgerActive").className = "hamburger";
    this.template.querySelector(".navMenuActive").className = "wrapperMenu";
  }

  openMenu() {
    if (this.toggle === 0) {
      this.template.querySelector(".hamburger").className = "hamburgerActive";
      this.template.querySelector(".wrapperMenu").className = "navMenuActive";
      this.toggle = 1;
    } else if (this.toggle === 1) {
      this.template.querySelector(".hamburgerActive").className = "hamburger";
      this.template.querySelector(".navMenuActive").className = "wrapperMenu";
      this.toggle = 0;
    }
  }
}