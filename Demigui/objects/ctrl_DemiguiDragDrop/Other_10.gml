x = mouse_x;
y = mouse_y;

if (mouse_check_button(drag_button)) {
    if (!is_undefined(on_drag))
        on_drag(x, y, id);
} else {
    if (call_drag_on_drop && !is_undefined(on_drag))
        on_drag(x, y, id);
    
    if (!is_undefined(on_drop))
        on_drop(x, y, id);
    
    instance_destroy();
}
