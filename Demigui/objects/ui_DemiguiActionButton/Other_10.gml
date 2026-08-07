var _enabled = command.can_execute(command_parameter);
var _hovered = _enabled && position_meeting(mouse_x, mouse_y, id);

if (_hovered && mouse_check_button_pressed(mb_left))
    command.execute(command_parameter);
