function DemiguiComponent(_instance, _joint = undefined) constructor {
    instance = _instance;
    x = _instance.x;
    y = _instance.y;
    width = _instance.width;
    height = _instance.height;
    
    joint = _joint;
    parent = !is_undefined(joint) ? joint.parent : undefined;
    level = !is_undefined(parent) ? parent.level + 1 : 0;
    
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
    
    static remove = function() {
        if (!is_undefined(joint))
            joint.detach_child();
        
        instance_destroy(instance);
    }
    
    // ------
    // Joints
    // ------
    
    static update_joints = function() {
        if (!is_undefined(joint))
            joint.update_from_child();
    }
    
    // --------
    // Instance
    // --------
    
    static update_instance = function() {
        instance.x = x;
        instance.y = y;
    }
}
