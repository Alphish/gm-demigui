event_inherited();

demigui_control_handle_property(property, function(_value) {
    style_manager.set_modifier("checked", _value == true);
    style_manager.set_modifier("indeterminate", is_undefined(_value));
});
