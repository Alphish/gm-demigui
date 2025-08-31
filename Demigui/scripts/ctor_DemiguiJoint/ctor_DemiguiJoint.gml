function DemiguiJoint(_parent) constructor {
    x = 0;
    y = 0;
    layer = _parent.instance.layer;
    depth = undefined;
    
    parent = _parent;
    child = undefined;
    is_reusable = false;
    
    update_from_parent(parent);
    
    // -----
    // Setup
    // -----
    
    static at_layer = function(_layer) {
        layer = is_string(_layer) ? layer_get_id(_layer) : _layer;
        return self;
    }
    
    static at_depth = function(_depth) {
        depth = _depth;
        return self;
    }
    
    static at_depth_offset = function(_doffset) {
        return at_depth(layer_get_depth(layer) + _doffset);
    }
    
    static allowing_reuse = function() {
        is_reusable = true;
    }
    
    // -----
    // Child
    // -----
    
    static create_child = function(_object, _variables = undefined) {
        update_from_parent();
        
        _variables ??= {};
        _variables.joint = self;
        
        var _instance = !is_undefined(depth)
            ? instance_create_depth(x, y, depth, _object, _variables)
            : instance_create_layer(x, y, layer, _object, _variables);
        
        child = _instance.component_data;
        parent.add_child(child);
        sys_Demigui.schedule_child_update(self);
        return child;
    }
    
    static detach_child = function() {
        parent.remove_child(child);
        child = undefined;
        if (!is_reusable)
            parent.detach_joint(self);
    }
    
    // ---------
    // Layouting
    // ---------
    
    static update_from_parent = function(_parent) { }
    static update_parent = function(_parent) { }
    static update_from_child = function(_child) { }
    static update_child = function(_child) { }
}