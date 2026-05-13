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
    
    static add_modifier = function(_instance, _modifier) {
        if (!is_undefined(_instance.style))
            _instance.style.add_modifier(_modifier);
    }
    
    static remove_modifier = function(_instance, _modifier) {
        if (!is_undefined(_instance.style))
            _instance.style.remove_modifier(_modifier);
    }
    
    static set_modifier = function(_instance, _modifier, _value) {
        if (!is_undefined(_instance.style))
            _instance.style.set_modifier(_modifier, _value);
    }
}
