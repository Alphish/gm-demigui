function demigui_draw_boxed_sprite(_box, _sprite, _image) {
    draw_sprite_stretched(_sprite, _image, _box.x, _box.y, _box.width, _box.height);
}

function demigui_draw_boxed_text(_box, _text, _font = undefined, _halign = undefined, _valign = undefined, _xoffset = 0, _yoffset = 0) {
    if (!is_undefined(_font))
        draw_set_font(_font);
    
    if (!is_undefined(_halign))
        draw_set_halign(_halign);
    else
        _halign = draw_get_halign();
    
    if (!is_undefined(_valign))
        draw_set_valign(_valign);
    else
        _valign = draw_get_valign();
    
    var _xx = _box.x + (_box.width * _halign) div 2;
    var _yy = _box.y + (_box.height * _valign) div 2;
    draw_text(_xx, _yy, _text);
}
