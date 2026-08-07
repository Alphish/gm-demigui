event_inherited();

demigui_control_handle_property(property, function(_value) {
    style_manager.set_modifier("active", value == _value);
});
