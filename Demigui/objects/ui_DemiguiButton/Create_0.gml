// Inherit the parent event
event_inherited();

if (is_undefined(command))
    command = DemiguiBlankCommand.instance;
else if (is_callable(command))
    command = new DemiguiCommand(command);

is_hovered = false;
is_enabled = command.can_execute();

can_hover = function() {
    is_enabled = command.can_execute();
    return is_enabled;
}

on_click = function() {
    command.execute();
}
