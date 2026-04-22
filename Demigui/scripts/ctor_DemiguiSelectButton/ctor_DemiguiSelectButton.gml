function DemiguiSelectButton(_instance) : DemiguiControl(_instance) constructor {
    select_value = _instance.select_value;
    value_property = _instance.value_property;
    value_observer = value_property.value_changed.add_handler(method(self, on_value_change));
    
    on_value_change(value_property.get_value());
    
    static on_value_change = function(_value) {
        if (_value == select_value)
            add_modifier("active");
        else
            remove_modifier("active");
    }
    
    // -----
    // Input
    // -----
    
    static check_hover = function(_pointer) {
        return position_meeting(_pointer.x, _pointer.y, instance);
    }
    
    static on_hover = function(_pointer) {
        add_modifier("hover");
    }
    
    static on_unhover = function(_pointer) {
        remove_modifier("hover");
    }
    
    static on_click = function(_pointer) {
        value_property.set_value(select_value);
    }
    
    // -------
    // Cleanup
    // -------
    
    static remove = function() {
        var _base_remove = DemiguiControl.remove;
        _base_remove();
        
        value_observer.remove();
    }
}
