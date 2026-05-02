// Inherit the parent event
event_inherited();

if (is_undefined(command))
    command = new CimpliCommand(function() {}, function() { return false; });
else if (is_callable(command))
    command = new CimpliCommand(command);
else
    throw DemiguiException.invalid_typeof("Button command", "callable or undefined", instance.command);
