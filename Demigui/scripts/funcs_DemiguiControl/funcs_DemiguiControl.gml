function demigui_control_link_signal(_signal, _handler) {
    _handler(_signal.get_value());
    _signal.when_value_changed_subject().add_handler(_handler);
}
