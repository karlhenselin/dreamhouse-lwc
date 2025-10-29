import { LightningElement, api, wire } from 'lwc';
import getMetadataList from '@salesforce/apex/MetadataListController.getMetadataList';

const columns = [
    { label: 'Section', fieldName: 'Section', type: 'text' },
    { label: 'Action', fieldName: 'Action', type: 'text' },
    { label: 'Modified By', fieldName: 'ModifiedBy', type: 'text' },
    { label: 'Modified Date', fieldName: 'CreatedDate', type: 'date' },
];

export default class FetchRecords extends LightningElement {
    @api filter = {};

    data;

    @wire(getMetadataList, { timeRange: '$filter.timeRange', selectedUser: '$filter.selectedUser' })
    wiredMetadataList({ data, error }) {
        if (data) {
            this.data = data;
        } else if (error) {
            console.error('Error fetching metadata list', error);
        }
    }

    get columns() {
        return columns;
    }
}