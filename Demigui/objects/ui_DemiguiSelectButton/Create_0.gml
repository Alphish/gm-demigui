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

pointer_handler = new DemiguiPointerHandler(id).with_click_handler(function(_pointer) {
    value_property.set_value(select_value);
});
