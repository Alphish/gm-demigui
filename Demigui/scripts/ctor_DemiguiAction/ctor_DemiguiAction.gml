function DemiguiAction(_key) constructor {
    key = _key;
    
    static check = function() {
        throw DemiguiException.not_implemented(self, nameof(check));
    }
    
    static clear = function() {
        // nothing by default
    }
}
