view_enabled = true;

view_camera[0] = camera_create_view(0, 0, room_width, room_height);
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = room_width;
view_hport[0] = room_height;

test_a = function() {
    show_debug_message("AAA");
}

test_b = function() {
    show_debug_message("BBB");
}

test_c = function() {
    show_debug_message("CCC");
}
