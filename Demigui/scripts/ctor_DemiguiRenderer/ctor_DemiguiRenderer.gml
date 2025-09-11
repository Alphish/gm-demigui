function DemiguiRenderer(_component) constructor {
    static accept_value_properties = {};
    
    component = _component;
    update_required = true;
    
    static update = function() {
        if (!update_required)
            return;
        
        update_begin();
        
        accept_values(component.style_values);
        if (!is_undefined(component.style))
            component.style.apply(self, component.style_modifiers);
        
        update_complete();
        update_required = false;
    }
    
    static update_begin = function() {
        throw DemiguiException.not_implemented(self, nameof(update_begin));
    }
    
    static accept_values = function(_values) {
        if (!is_struct(_values))
            return;
        
        struct_foreach(_values, function(_key, _value) {
            if (is_callable(self[$ "accept_" + _key])) {
                self[$ "accept_" + _key](_value);
                return;
            }
            
            if (struct_exists(accept_value_properties, _key)) {
                var _property = accept_value_properties[$ _key];
                self[$ _property] = _value;
            }
        });
    }
    
    static update_complete = function() {
        // perform no special actions by default
    }
    
    static draw = function(_x, _y) {
        throw DemiguiException.not_implemented(self, nameof(draw));
    }
}
