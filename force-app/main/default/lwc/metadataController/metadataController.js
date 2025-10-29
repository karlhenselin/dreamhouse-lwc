// metadataController.js
import { LightningElement, track } from 'lwc';

export default class MetadataController extends LightningElement {
    @track selectedTimeframe = 'All Time';
    @track selectedUser = 'All Users';

    timeframeOptions = [
        { label: 'All Time', value: 'All Time' },
        { label: 'Last 1 Day', value: 'Last 1 Day' },
        { label: 'Last 2 Days', value: 'Last 2 Days' },
        { label: 'Last 1 Week', value: 'Last 1 Week' },
        { label: 'Last 1 Month', value: 'Last 1 Month' },
        { label: 'Last 6 Months', value: 'Last 6 Months' },
        { label: 'Last 1 Year', value: 'Last 1 Year' }
    ];
    userOptions = [
        { label: 'All Users', value: 'All Users' },
        { label: 'Current User', value: 'Current User' }
    ];

    handleTimeframeChange(event) {
        this.selectedTimeframe = event.detail.value;
    }

    handleUserChange(event) {
        this.selectedUser = event.detail.value;
    }

    handleButtonClick() {
        const event = new CustomEvent('getmetadatalist', {
            detail: {
                timeframe: this.selectedTimeframe,
                user: this.selectedUser
            }
        });
        this.dispatchEvent(event);
    }
}