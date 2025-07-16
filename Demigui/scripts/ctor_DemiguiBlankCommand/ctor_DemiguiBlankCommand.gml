function DemiguiBlankCommand() constructor {
    static can_execute = function() {
        return false;
    }
    
    static execute = function() {}
}

DemiguiBlankCommand.instance = new DemiguiBlankCommand();
