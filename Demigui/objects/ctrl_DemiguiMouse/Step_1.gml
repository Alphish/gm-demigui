hover_instance = noone;

var _gui_count = instance_position_list(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), gui_hoverables, collision_list, false);
for (var i = 0; i < _gui_count; i++) {
    var _instance = collision_list[| i];
    if (!_instance.visible)
        continue;
    
    if (!instance_exists(hover_instance) || hover_instance.depth > _instance.depth) {
        hover_instance = _instance;
    }
}

ds_list_clear(collision_list);
if (instance_exists(hover_instance))
    return;

var _room_count = instance_position_list(mouse_x, mouse_y, room_hoverables, collision_list, false);
for (var i = 0; i < _room_count; i++) {
    var _instance = collision_list[| i];
    if (!_instance.visible)
        continue;
    
    if (!instance_exists(hover_instance) || hover_instance.depth > _instance.depth) {
        hover_instance = _instance;
    }
}
ds_list_clear(collision_list);
