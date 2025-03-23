hover_instance = noone;
gui_hoverables = [];
room_hoverables = [];

collision_list = ds_list_create();

add_hoverable = function(_component) {
    var _hoverables = _component.is_gui_bound ? gui_hoverables : room_hoverables;
    array_push(_hoverables, _component);
}

remove_hoverable = function(_component) {
    var _hoverables = _component.is_gui_bound ? gui_hoverables : room_hoverables;
    var _idx = array_get_index(_hoverables, _component);
    if (_idx < 0)
        return;
    
    _hoverables[_idx] = array_pop(_hoverables);
}
