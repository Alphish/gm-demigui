function DemiguiComponentBehavior() constructor {
    // -----------
    // Move/resize
    // -----------
    
    static move_by = function(_instance, _xoffset, _yoffset) {
        if (_xoffset == 0 && _yoffset == 0)
            return;
        
        _instance.x += _xoffset;
        _instance.y += _yoffset;
        sys_Demigui.schedule_link_move_update(_instance);
    }
    
    static move_to = function(_instance, _x, _y) {
        _instance.behavior.move_by(_instance, _x - _instance.x, _y - _instance.y);
    }
    
    // -------
    // Styling
    // -------
    
    static set_style_value = function(_instance, _key, _value) {
        _instance.style_values ??= {};
        _instance.style_values[$ _key] = _value;
        _instance.renderer.update_required = true;
    }
    
    static add_modifier = function(_instance, _modifier) {
        _instance.style_modifiers ??= {};
        _instance.style_modifiers[$ _modifier] = true;
        _instance.renderer.update_required = true;
    }
    
    static remove_modifier = function(_instance, _modifier) {
        _instance.style_modifiers ??= {};
        struct_remove(_instance.style_modifiers, _modifier);
        _instance.renderer.update_required = true;
    }
    
    static set_style = function(_instance, _style) {
        if (is_undefined(_style))
            return;
        
        _instance.style = _style;
        _instance.renderer.update_required = true;
    }
}
