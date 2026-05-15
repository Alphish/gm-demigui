// Inherit the parent event
event_inherited();

if (is_undefined(command))
    command = new CimpliCommand(function() {}, function() { return false; });
else if (is_callable(command))
    command = new CimpliCommand(command);
else
    throw DemiguiException.invalid_typeof("Button command", "callable or undefined", instance.command);

if (accepts_pointer) {
    pointer_handler.with_click_handler(function(_pointer) {
        command.execute();
    });
}

if (accepts_actions) {
    action_handler.with_action_handler(function(_processor) {
        if (!action_handler.check_action("confirm", _processor))
            return false;
        
        command.execute();
        return true;
    });
}
