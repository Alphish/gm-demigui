function DemiguiActionTable() constructor {
    actions = {};
    
    // -----
    // Setup
    // -----
    
    static with_action = function(_action) {
        if (struct_exists(actions, _action.key))
            throw DemiguiException.duplicate_key("action", _action.key);
        
        actions[$ _action.key] = _action;
        return self;
    }
    
    static with_call_action = function(_key, _callback) {
        var _action = new DemiguiActionCall(_key, _callback);
        return with_action(_action);
    }
    
    // ------
    // Checks
    // ------
    
    static update = function() {
        // actions are set up individually by default
    }
    
    static check = function(_key) {
        if (!struct_exists(actions, _key))
            return false;
        
        return actions[$ _key].check();
    }
    
    static clear = function() {
        struct_foreach(actions, function(_key, _value) {
            _value.clear();
        });
    }
}
