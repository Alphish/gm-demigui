event_inherited();

if (property.get_value() == value)
    style_manager.add_modifier("active");

property.value_changed.add_handler(function(_value) {
    style_manager.set_modifier("active", value == _value);
});
