function DemiguiContainer(_instance, _joint = undefined) : DemiguiComponent(_instance, _joint) constructor {
    children = [];
    children_count = 0;
    joints = [];
    joints_count = 0;
    
    // --------
    // Children
    // --------
    
    static add_child = function(_component) {
        array_push(children, _component);
        children_count += 1;
    }
    
    static remove_child = function(_child) {
        var _index = array_get_index(children, _child);
        if (_index < 0)
            return;
        
        array_delete(children, _index, 1);
        children_count -= 1;
    }
    
    // ------
    // Joints
    // ------
    
    static create_joint = function(_type) {
        var _joint = new _type(self);
        array_push(joints, _joint);
        joints_count += 1;
        return _joint;
    }
    
    static update_joints = function() {
        if (!is_undefined(joint))
            joint.update_from_child();
        
        for (var i = 0; i < joints_count; i++) {
            joints[i].update_from_parent();
        }
    }
    
    static detach_joint = function(_joint) {
        var _index = array_get_index(joints, _joint);
        if (_index >= 0)
            array_delete(joints, _index, 1);
        
        joints_count -= 1;
    }
    
    // -------
    // Cleanup
    // -------
    
    static remove = function() {
        repeat (joints_count) {
            var _joint = array_pop(joints);
            _joint.detach_parent();
        }
        
        var _base_remove = DemiguiComponent.remove;
        _base_remove();
    }
}
