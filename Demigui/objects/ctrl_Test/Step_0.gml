var _xshift = keyboard_check(vk_right) - keyboard_check(vk_left);
var _yshift = keyboard_check(vk_down) - keyboard_check(vk_up);

with (par_DemiguiContainer) {
    if (!is_undefined(parent) && parent == other.id) {
        behavior.move_by(id, _xshift * 5, _yshift * 5);
    }
}

pointer.update_coordinates();
pointer.check_hover();
pointer.try_interact();
