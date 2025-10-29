/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class SpiPrePromoteContext extends sf_devops.BaseSpiContext {
    global SpiPrePromoteContext() {

    }
    global abstract List<sf_devops.SpiChangeBundle> getSelectedChangeBundles();
    global abstract List<sf_devops.SpiWorkItem> getSelectedWorkItems();
    global abstract Id getTargetStageId();
    global abstract Boolean getUndeployedOnly();
    global abstract List<Id> getVisibleChangeBundleIds();
    global abstract List<Id> getVisibleWorkItemIds();
}
