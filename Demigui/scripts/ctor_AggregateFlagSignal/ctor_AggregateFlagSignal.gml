function AggregateFlagSignal(_flags) constructor {
    flags = _flags;
    current_value = calculate_value();
    sets_value = false;
    value_changed = undefined;
    
    var _handler = method(self, handle_flag_change);
    for (var i = 0, _count = array_length(flags); i < _count; i++) {
        flags[i].when_value_changed_subject().add_handler(_handler);
    }
    
    static get_value = function() {
        return current_value;
    }
    
    static set_value = function(_value) {
        if (_value != false && _value != true)
            throw $"Invalid aggregate flag input value.";
        
        if (_value == current_value)
            return;
        
        current_value = _value;
        
        sets_value = true;
        for (var i = 0, _count = array_length(flags); i < _count; i++) {
            flags[i].set_value(current_value);
        }
        sets_value = false;
        
        if (!is_undefined(value_changed))
            value_changed.send(current_value);
    }
    
    static calculate_value = function() {
        var _reference = flags[0].get_value();
        for (var i = 0, _count = array_length(flags); i < _count; i++) {
            if (flags[i].get_value() != _reference)
                return undefined;
        }
        return _reference;
    }
    
    static handle_flag_change = function() {
        if (sets_value)
            return;
        
        var _new_value = calculate_value();
        if (current_value == _new_value)
            return;
        
        current_value = _new_value;
        if (!is_undefined(value_changed))
            value_changed.send(current_value);
    }
    
    static when_value_changed_subject = function() {
        value_changed ??= new CimpliEventSubject(self);
        return value_changed;
    }
}
