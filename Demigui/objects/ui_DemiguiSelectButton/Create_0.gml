event_inherited();

demigui_control_link_signal(selection_signal, function(_value) {
    style_manager.set_modifier("active", value == _value);
});
