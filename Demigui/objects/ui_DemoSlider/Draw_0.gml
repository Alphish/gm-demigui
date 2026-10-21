with (thumb_instance) {
    image_angle = other.image_angle;
}

draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (fill_amount >= 1) {
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    return;
} else if (fill_amount > 0) {
    // just doing some complex numbers magic to achieve rotation
    var _xoffset = sprite_get_xoffset(sprite_index);
    var _yoffset = sprite_get_yoffset(sprite_index);
    var _angle_x = dcos(image_angle);
    var _angle_y = -dsin(image_angle);
    var _xx = x - _xoffset * _angle_x + _yoffset * _angle_y;
    var _yy = y - _yoffset * _angle_x - _xoffset * _angle_y;
    
    // drawing the actual bar
    draw_sprite_general(sprite_index, 1, 0, 0, round(fill_amount * sprite_width), sprite_height, _xx, _yy, 1, 1, image_angle, image_blend, image_blend, image_blend, image_blend, image_alpha);
}
