// Inherit the parent event
event_inherited();

fill_amount = (value_signal.get_value() - minimum) / (maximum - minimum);

thumb_instance = noone;
if (!is_undefined(thumb_object)) {
    thumb_args ??= {};
    thumb_args.slider = id;
    thumb_instance = instance_create_depth(x + xfrom, y + yfrom, depth - 1, thumb_object, thumb_args);
}

// -------
// Methods
// -------

on_grab = function(_mx, _my) {
    with (thumb_instance) {
        style_manager.set_modifier("hover", true);
    }
    on_drag(_mx, _my);
}

on_drag = function(_mx, _my) {
    // converting from control-relative coordinates to room coordinates
    var _abs_xfrom = x + xfrom;
    var _abs_yfrom = y + yfrom;
    var _abs_xto = x + xto;
    var _abs_yto = y + yto;
    
    var _reference_dist = point_distance(_abs_xfrom, _abs_yfrom, _abs_xto, _abs_yto);
    var _reference_angle = point_direction(_abs_xfrom, _abs_yfrom, _abs_xto, _abs_yto);
    var _mouse_dist = point_distance(_abs_xfrom, _abs_yfrom, _mx, _my);
    var _mouse_angle = point_direction(_abs_xfrom, _abs_yfrom, _mx, _my);
    
    var _input_angle = angle_difference(_mouse_angle, _reference_angle);
    var _input_dist = clamp(dcos(_input_angle) * _mouse_dist, 0, _reference_dist);
    var _input_amount = _input_dist / _reference_dist;
    
    var _output_offset = (maximum - minimum) * _input_amount;
    var _output_steps = round(_output_offset / step);
    var _output_value = minimum + _output_steps * step;
    value_signal.set_value(_output_value);
}
