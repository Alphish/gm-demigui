var _xshift = keyboard_check(vk_right) - keyboard_check(vk_left);
var _yshift = keyboard_check(vk_down) - keyboard_check(vk_up);

with (ui_DemoInnerMenu) {
    behavior.move_by(id, _xshift * 5, _yshift * 5);
}

pointer.process();
action_processor.process();
