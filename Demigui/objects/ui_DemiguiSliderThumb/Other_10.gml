var _enabled = true;
var _hovered = _enabled && position_meeting(mouse_x, mouse_y, id);

if (_hovered && mouse_check_button_pressed(mb_left))
    sys_Demigui.create_drag_drop(mb_left, slider.on_grab, slider.on_drag, undefined);

style_manager.set_modifier("disabled", !_enabled);
style_manager.set_modifier("hover", _hovered);
