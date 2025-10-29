({
    doInit : function(cmp, event, helper) {
        helper.getFlows(cmp);
    },
    handleToggleSelectedFlows : function(cmp, event, helper){
        helper.showLoading(cmp);
        let flows = cmp.get("v.selectedFlows");
        console.log(flows);
        if (flows && flows.length > 0){
            let promises = [];
            flows.forEach(function(row) {
                promises.push(helper.updateFlowPromise(cmp, row));
            });
            Promise.all(promises).then(function(results){
                console.log(results); 
                helper.getFlows(cmp);
                helper.hideLoading(cmp);
            });
        }
    },
    handleEnableAllFlows : function(cmp, event, helper){
        helper.showLoading(cmp);
        let flows = cmp.get("v.flows");
        if (flows && flows.length > 0){
            let promises = [];
            flows.forEach(function(row){
                if (row.Active == false) promises.push(helper.updateFlowPromise(cmp, row));          
            });
            Promise.all(promises).then(function(results){
                console.log(results); 
                helper.getFlows(cmp);
                helper.hideLoading(cmp);
            });
        }
    },
    handleDisableAllFlows : function(cmp, event, helper){
        helper.showLoading(cmp);
        let flows = cmp.get("v.flows");
        if (flows && flows.length > 0){
            let promises = [];
            flows.forEach(function(row) {
                if (row.Active) promises.push(helper.updateFlowPromise(cmp, row));              
            });
            Promise.all(promises).then(function(results){
                console.log(results); 
                helper.getFlows(cmp);
                helper.hideLoading(cmp);
            });
        }
    },
    handleRowSelection : function(cmp, event, helper){
        let flows = event.getParam('selectedRows');
        console.log(flows);
        cmp.set("v.selectedFlows", flows);
    },
    handleRowAction: function(cmp, event, helper) {
        var action = event.getParam('action');               
        if (action.name =='change_status') {
            var row = event.getParam('row');        
            console.log(row);   
            helper.updateFlow(cmp, row);
        }
    }
})