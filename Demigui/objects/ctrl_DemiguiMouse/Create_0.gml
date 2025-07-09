// Inherit the parent event
event_inherited();

collision_list = ds_list_create();
mouse_x_getter = is_gui ? device_mouse_x_to_gui : device_mouse_x;
mouse_y_getter = is_gui ? device_mouse_y_to_gui : device_mouse_y;

get_hover_instance = function() {
    var _count = instance_position_list(mouse_x_getter(0), mouse_y_getter(0), hoverables, collision_list, false);
    var _result = noone;
    for (var i = 0; i < _count; i++) {
        var _instance = collision_list[| i];
        if (!_instance.visible)
            continue;
    
        if (!instance_exists(_result) || _result.depth > _instance.depth) {
            _result = _instance;
        }
    }
    ds_list_clear(collision_list);
    hover_instance = _result;
    return _result;
}
