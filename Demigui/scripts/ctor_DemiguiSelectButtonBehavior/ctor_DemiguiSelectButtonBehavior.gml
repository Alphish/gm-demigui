function DemiguiSelectButtonBehavior() : DemiguiComponentBehavior() constructor {
    // -----
    // Input
    // -----
    
    static check_hover = function(_instance, _pointer) {
        return position_meeting(_pointer.x, _pointer.y, _instance);
    }
    
    static on_hover = function(_instance, _pointer) {
        add_modifier(_instance, "hover");
    }
    
    static on_unhover = function(_instance, _pointer) {
        remove_modifier(_instance, "hover");
    }
    
    static on_click = function(_instance, _pointer) {
        _instance.value_property.set_value(_instance.select_value);
    }
}
