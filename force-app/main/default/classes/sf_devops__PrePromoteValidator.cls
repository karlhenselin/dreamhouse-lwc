/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class PrePromoteValidator {
    global PrePromoteValidator() {

    }
    global virtual String getRunningMessage() {
        return null;
    }
    global virtual Boolean include(sf_devops.SpiPrePromoteContext context) {
        return null;
    }
    global virtual void invokeCustomAction(sf_devops.SpiPrePromoteContext context) {

    }
    global abstract sf_devops.SpiPrePromoteValidationResponse validate(sf_devops.SpiPrePromoteContext param0);
}
