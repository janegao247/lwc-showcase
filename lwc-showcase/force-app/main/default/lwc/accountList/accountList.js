import { LightningElement, wire } from 'lwc';
import { refreshApex } from "@salesforce/apex";
import GetFinancialAccountsWithNameLike from "@salesforce/apex/AccountController.GetFinancialAccountsWithNameLike";


const columns = [
    {
        label: 'Name', editable: true, sortable: true,
        fieldName: 'Name',
    },
    { label: 'Website', fieldName: 'Website', type: 'url', editable: true },
    { label: 'Phone', fieldName: 'Phone', type: 'phone', editable: true },
    { label: 'Account Owner', fieldName: 'Account_Owner__c', editable: true, sortable: true },
    { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency', editable: true },
];
export default class AccountList extends LightningElement {
    data = [];
    columns = columns;
    rowOffset = 0;
    defaultSortDirection = 'asc';
    sortDirection = 'asc';
    sortedBy;

    connectedCallback() {
        this.handleGetAccounts();
    }

    handleGetAccounts(searchKey) {
        GetFinancialAccountsWithNameLike({ searchKey })
            .then(result => {
                this.data = result;
            })
            .catch(error => {
            });
    }

    handleKeyChange(event) {
        const searchKey = event.target.value;
        this.handleGetAccounts(searchKey);
    }

    sortBy(field, reverse, primer) {
        const key = primer
            ? function (x) {
                return primer(x[field]);
            }
            : function (x) {
                return x[field];
            };

        return function (a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    }

    onHandleSort(event) {
        const { fieldName: sortedBy, sortDirection } = event.detail;
        const cloneData = [...this.data];

        cloneData.sort(this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1));
        this.data = cloneData;
        this.sortDirection = sortDirection;
        this.sortedBy = sortedBy;
    }
}