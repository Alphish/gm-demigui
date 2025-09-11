function DemiguiComponent(_instance, _joint = undefined) constructor {
    instance = _instance;
    x = _instance.x;
    y = _instance.y;
    width = _instance.width;
    height = _instance.height;
    
    joint = _joint;
    parent = !is_undefined(joint) ? joint.parent : undefined;
    level = !is_undefined(parent) ? parent.level + 1 : 0;
    
    style = undefined;
    style_modifiers = undefined;
    style_values = undefined;
    renderer = undefined;
    
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
        sys_Demigui.schedule_joint_update(self);
        sys_Demigui.schedule_instance_update(self);
    }
    
    static resize = function(_width, _height) {
        if (_width == width && _height == height)
            return;
        
        resize_self(_width, _height);
    }
    
    static resize_self = function(_width, _height) {
        width = _width;
        height = _height;
        sys_Demigui.schedule_joint_update(hook);
    }
    
    // ------
    // Joints
    // ------
    
    static update_joints = function() {
        if (!is_undefined(joint))
            joint.update_from_child();
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
    
    // ------
    // Cleanup
    // ------
    
    static remove = function() {
        if (!is_undefined(joint))
            joint.detach_child();
        
        instance_destroy(instance);
    }
}
