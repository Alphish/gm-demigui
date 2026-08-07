function demigui_control_handle_property(_property, _handler) {
    _handler(_property.get_value());
    _property.value_changed.add_handler(_handler);
}
