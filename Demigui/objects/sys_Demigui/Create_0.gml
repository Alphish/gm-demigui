styles_provider = new DemiguiStylesProvider();
styles_provider.add_family("none", []);

get_style = function(_specifier) {
    return styles_provider.provide(_specifier);
}

create_drag_drop = function(_button, _ongrab, _ondrag, _ondrop, _calldragondrop = undefined) {
    var _args = { drag_button: _button, on_grab: _ongrab, on_drag: _ondrag, on_drop: _ondrop };
    if (!is_undefined(_calldragondrop))
        _args.call_drag_on_drop = _calldragondrop;
    
    return instance_create_layer(mouse_x, mouse_y, drag_drop_layer, ctrl_DemiguiDragDrop, _args);
}
