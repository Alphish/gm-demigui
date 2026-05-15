// Inherit the parent event
event_inherited();

on_value_change = function(_value) {
    if (_value == select_value)
        behavior.add_modifier(id, "active");
    else
        behavior.remove_modifier(id, "active");
};

value_observer = value_property.value_changed.add_handler(on_value_change);
on_value_change(value_property.get_value());

if (accepts_pointer) {
    pointer_handler.with_click_handler(function(_pointer) {
        value_property.set_value(select_value);
    });
}

if (accepts_actions) {
    action_handler.with_action_handler(function(_processor) {
        if (!action_handler.check_action("confirm", _processor))
            return false;
        
        value_property.set_value(select_value);
        return true;
    });
}
