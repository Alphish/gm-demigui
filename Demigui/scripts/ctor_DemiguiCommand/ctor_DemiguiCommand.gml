function DemiguiCommand(_callback) constructor {
    static can_execute = function() {
        return true;
    }
    
    execute = _callback;
}
