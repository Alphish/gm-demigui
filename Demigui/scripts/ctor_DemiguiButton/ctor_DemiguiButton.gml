function DemiguiButton(_instance, _joint = undefined) : DemiguiControl(_instance, _joint) constructor {
    is_hovered = false;
    
    if (is_undefined(instance.command))
        command = DemiguiBlankCommand.instance;
    else if (is_callable(instance.command))
        command = new DemiguiCommand(instance.command);
    else
        throw DemiguiException.invalid_typeof("Button command", "callable or undefined", instance.command);
    
    // -----
    // Input
    // -----
    
    static check_hover = function(_pointer) {
        return position_meeting(_pointer.x, _pointer.y, instance);
    }
    
    static on_hover = function(_pointer) {
        is_hovered = true;
    }
    
    static on_unhover = function(_pointer) {
        is_hovered = false;
    }
    
    static on_click = function(_pointer) {
        command.execute();
    }
}
