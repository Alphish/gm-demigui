function DemiguiSelectButton(_instance, _joint = undefined) : DemiguiControl(_instance, _joint) constructor {
    select_value = _instance.select_value;
    value_source = _instance.value_source;
    value_subscription = value_source.value_changed.subscribe(method(self, on_value_change));
    
    on_value_change(value_source.get_value());
    
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
        value_source.set_value(select_value);
    }
    
    // -------
    // Cleanup
    // -------
    
    static remove = function() {
        var _base_remove = DemiguiControl.remove;
        _base_remove();
        
        value_subscription.unsubscribe();
    }
}
