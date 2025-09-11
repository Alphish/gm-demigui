function DemiguiTextPanelRenderer(_component) : DemiguiRenderer(_component) constructor {
    width = component.width;
    height = component.height;
    
    bg_sprite = undefined;
    bg_image = 0;
    bg_color = c_white;
    bg_alpha = undefined;
    
    text = "";
    text_font = undefined;
    text_color = c_black;
    text_alpha = 1;
    text_halign = fa_center;
    text_valign = fa_middle;
    text_xoffset = 0;
    text_yoffset = 0;
    
    text_x = width div 2;
    text_y = height div 2;
    
    // -------
    // Updates
    // -------
    
    static update_begin = function() {
        var _instance = component.instance;
        bg_sprite = sprite_exists(_instance.sprite_index) ? _instance.sprite_index : undefined;
        bg_image = _instance.image_index;
        bg_color = _instance.image_blend;
        bg_alpha = !is_undefined(bg_sprite) ? _instance.image_alpha : undefined;
        
        text_font = undefined;
        text_color = c_black;
        text_alpha = 1;
        text_halign = fa_center;
        text_valign = fa_middle;
        text_xoffset = 0;
        text_yoffset = 0;
    }
    
    static accept_value_properties = {
        "background_sprite": "bg_sprite",
        "background_image": "bg_image",
        "background_color": "bg_color",
        "background_alpha": "bg_alpha",
        
        "text": "text",
        "font": "text_font",
        "color": "text_color",
        "alpha": "text_alpha",
        "halign": "text_halign",
        "valign": "text_valign",
        "text_xoffset": "text_xoffset",
        "text_yoffset": "text_yoffset",
    };
    
    static update_complete = function() {
        width = component.width;
        height = component.height;
        text_x = floor(width * text_halign / 2 + text_xoffset);
        text_y = floor(height * text_valign / 2 + text_yoffset);
        
        if (is_undefined(bg_alpha))
            bg_alpha = !is_undefined(bg_sprite) ? _instance.image_alpha : 0;
    }
    
    // -------
    // Drawing
    // -------
    
    static draw = function(_x, _y) {
        if (bg_alpha > 0)
            draw_sprite_stretched_ext(bg_sprite ?? spr_DemiguiPixel, bg_image, _x, _y, width, height, bg_color, bg_alpha);
        
        if (text != "" && text_alpha > 0) {
            draw_set_color(text_color);
            draw_set_alpha(text_alpha);
            draw_set_font(text_font);
            draw_set_halign(text_halign);
            draw_set_valign(text_valign);
            draw_text(_x + text_x, _y + text_y, text);
        }
    }
}
