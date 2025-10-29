import { LightningElement, track } from 'lwc';
import getObjectList from '@salesforce/apex/ObjectListController.getObjectList';
import getObjectData from '@salesforce/apex/ObjectListController.getObjectData';

const columns = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
];

export default class ObjectListControllerLWC extends LightningElement {
    @track sortBy;
    @track timeFrame;
    @track duration;
    @track objectOptions = [];
    @track selectedObjects = [];
    @track objectData = [];
    @track columns = columns;

    sortOptions = [
        { label: 'Last Modified', value: 'LastModified' },
        { label: 'Last Created', value: 'LastCreated' },
        { label: 'Both', value: 'Both' },
    ];

    timeFrameOptions = [
        { label: 'LAST_N_DAYS', value: 'LAST_N_DAYS' },
        { label: 'LAST_N_WEEKS', value: 'LAST_N_WEEKS' },
    ];

    handleSortChange(event) {
        this.sortBy = event.detail.value;
    }

    handleTimeFrameChange(event) {
        this.timeFrame = event.detail.value;
    }

    handleDurationChange(event) {
        this.duration = event.detail.value;
    }

    getObjectList() {
        getObjectList({ sortBy: this.sortBy, timeFrame: this.timeFrame, duration: this.duration })
            .then(result => {
                this.objectOptions = result.map(obj => ({ label: obj, value: obj }));
            })
            .catch(error => {
                console.error('Error fetching object list', error);
            });
    }

    handleObjectChange(event) {
        this.selectedObjects = event.detail.value;
    }

    getObjectData() {
        if (this.selectedObjects.length > 0) {
            getObjectData({ objectApiNames: this.selectedObjects })
                .then(result => {
                    this.objectData = result.flatMap(obj => obj.recordNames.map(name => ({ objectApiName: obj.objectApiName, Name: name })));
                })
                .catch(error => {
                    console.error('Error fetching object data', error);
                });
        } else {
            this.objectData = [];
        }
    }
}