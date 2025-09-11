function DemiguiStyleVariant(_key, _modifiers) constructor {
    key = _key;
    required_modifiers = _modifiers;
    values = {};
    
    // -----
    // Setup
    // -----
    
    static with_value = function(_key, _value) {
        values[$ _key] = _value;
        return self;
    }
    
    // --------
    // Applying
    // --------
    
    static apply = function(_target, _modifiers) {
        static modifier_check = function(_modifier) {
            return self[$ _modifier] == true;
        };
        
        if (is_undefined(_modifiers) && array_length(required_modifiers) > 0)
            return; // no modifiers when some are expected
        
        if (!array_all(required_modifiers, method(_modifiers, modifier_check)))
            return; // modifiers not applicable
        
        _target.accept_values(values);
    }
}
