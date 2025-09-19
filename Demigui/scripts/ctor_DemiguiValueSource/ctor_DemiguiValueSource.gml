function DemiguiValueSource(_value) constructor {
    value = _value;
    
    value_changed = new DemiguiEventSubject(self);
    
    static get_value = function() {
        return value;
    }
    
    static set_value = function(_value) {
        if (value == _value)
            return;
        
        value = _value;
        value_changed.raise(_value);
    }
}
