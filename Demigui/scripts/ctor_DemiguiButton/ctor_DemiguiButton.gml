function DemiguiButton(_instance) : DemiguiControl(_instance) constructor {
    if (is_undefined(instance.command))
        command = new CimpliCommand(function() {}, function() { return false; });
    else if (is_callable(instance.command))
        command = new CimpliCommand(instance.command);
    else
        throw DemiguiException.invalid_typeof("Button command", "callable or undefined", instance.command);
    
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
        command.execute();
    }
}
