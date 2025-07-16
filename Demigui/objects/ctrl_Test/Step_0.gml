sys_Demigui.check_hover("gui", "room");
sys_Demigui.try_interact();

var _xshift = keyboard_check(vk_right) - keyboard_check(vk_left);
var _yshift = keyboard_check(vk_down) - keyboard_check(vk_up);

camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + 5 * _xshift, camera_get_view_y(view_camera[0]) + 5 * _yshift);
