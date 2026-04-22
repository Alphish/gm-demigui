function DemiguiComponent(_instance) constructor {
    instance = _instance;
    
    x = _instance.x;
    y = _instance.y;
    width = _instance.width;
    height = _instance.height;
    
    link = undefined;
    parent = undefined;
    control_node = undefined;
    
    style = undefined;
    style_modifiers = undefined;
    style_values = undefined;
    
    if (is_callable(_instance.renderer)) {
        _instance.renderer = new _instance.renderer(self); // replace a constructor with an instance
    }
    renderer = _instance.renderer;
    set_style(_instance.style);
    
    // -----------
    // Move/resize
    // -----------
    
    static move_by = function(_xoffset, _yoffset) {
        if (_xoffset == 0 && _yoffset == 0)
            return;
        
        move_self_by(_xoffset, _yoffset);
    }
    
    static move_to = function(_x, _y) {
        move_by(_x - x, _y - y);
    }
    
    static move_self_by = function(_xoffset, _yoffset) {
        x += _xoffset;
        y += _yoffset;
        sys_Demigui.schedule_link_move_update(self);
        sys_Demigui.schedule_instance_update(self);
    }
    
    // -----
    // Links
    // -----
    
    static get_control_group = function() {
        var _ancestor = parent;
        while (is_undefined(_ancestor.control_node)) {
            _ancestor = _ancestor.parent;
        }
        return _ancestor.control_node;
    }
    
    static attach_to = function(_parent) {
        attach_with(new DemiguiLink(_parent, self));
    }
    
    static attach_with = function(_link) {
        _link.link_ends();
    }
    
    static detach = function() {
        if (!is_undefined(link))
            link.unlink_ends();
    }
    
    static link_parent = function(_parent) {
        parent = _parent;
        if (!is_undefined(control_node)) {
            var _control_group = get_control_group();
            control_node.attach_to(_control_group);
        }
        sys_Demigui.schedule_instance_update(self);
    }
    
    static unlink_parent = function() {
        parent = undefined;
        if (!is_undefined(control_node))
            control_node.detach();
        
        sys_Demigui.schedule_instance_update(self);
    }
    
    // -------
    // Styling
    // -------
    
    static set_style_value = function(_key, _value) {
        style_values ??= {};
        style_values[$ _key] = _value;
        renderer.update_required = true;
    }
    
    static add_modifier = function(_modifier) {
        style_modifiers ??= {};
        style_modifiers[$ _modifier] = true;
        renderer.update_required = true;
    }
    
    static remove_modifier = function(_modifier) {
        style_modifiers ??= {};
        struct_remove(style_modifiers, _modifier);
        renderer.update_required = true;
    }
    
    static set_style = function(_style) {
        if (is_undefined(_style))
            return;
        
        style = _style;
        renderer.update_required = true;
    }
    
    // --------
    // Instance
    // --------
    
    static update_instance = function() {
        instance.x = x;
        instance.y = y;
    }
}
