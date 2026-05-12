var _xshift = keyboard_check(vk_right) - keyboard_check(vk_left);
var _yshift = keyboard_check(vk_down) - keyboard_check(vk_up);

with (node.children[0].component) {
    behavior.move_by(id, _xshift * 5, _yshift * 5);
}

pointer.update_coordinates();
pointer.check_hover();
pointer.try_interact();
