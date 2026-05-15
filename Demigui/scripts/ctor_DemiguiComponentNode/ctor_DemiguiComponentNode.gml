function DemiguiComponentNode(_component) constructor {
    component = _component;
    
    parent = undefined;
    link = undefined;
    children = _component.is_container ? [] : undefined;
    
    control_group = undefined;
    control_children = (_component.is_control && _component.is_container) ? [] : undefined;
    controls_count = _component.is_control ? 1 : 0;
    
    static attach_with = function(_link) {
        parent = _link.parent.node;
        array_push(parent.children, self);
        
        if (component.is_control) {
            control_group = parent.get_control_node();
            array_push(control_group.control_children, self);
        }
        
        propagate_controls_count(controls_count);
        
        link = _link;
        link.on_link();
    }
    
    static detach = function() {
        if (!component.is_control && controls_count > 0)
            throw DemiguiException.invalid_operation("Cannot detach a non-control node from its parent while it contains controls. Detach all the descendant controls first.");
        
        unlink_control_group();
        unlink_parent();
    }
    
    static prune = function() {
        if (component == noone)
            return;
        
        var _purged_component = component;
        component = noone;
        instance_destroy(_purged_component);
        
        unlink_control_group();
        unlink_parent();
        
        if (!is_undefined(children)) {
            array_foreach(children, function(_child) { _child.prune(); });
        }
    }
    
    // -------
    // Helpers
    // -------
    
    static unlink_parent = function() {
        if (is_undefined(parent) || !instance_exists(parent.component))
            return;
        
        propagate_controls_count(-controls_count);
        
        var _index = array_get_index(parent.children, self);
        if (_index < 0)
            throw DemiguiException.unexpected_state("The child to unlink is not present in its parent's children array.");
            
        array_delete(parent.children, _index, 1);
        parent = undefined;
        
        link.on_unlink();
        link = undefined;
    }
    
    static unlink_control_group = function() {
        if (is_undefined(control_group) || !instance_exists(control_group.component))
            return;
        
        var _control_index = array_get_index(control_group.control_children, self);
        if (_control_index < 0)
            throw DemiguiException.unexpected_state("The control to unlink is not present in its control group's children array.");
            
        array_delete(control_group.control_children, _control_index, 1);
        control_group = undefined;
    }
    
    static get_control_node = function() {
        var _node = self;
        while (!_node.component.is_control) {
            _node = _node.parent;
            
            if (is_undefined(_node))
                throw DemiguiException.invalid_operation("Could not find a control group to attach. A control component can only be attached to a branch rooted in a control group.");
        }
        return _node;
    }
    
    static propagate_controls_count = function(_change) {
        if (_change == 0)
            return;
        
        var _node = parent;
        while (!is_undefined(_node)) {
            _node.controls_count += _change;
            _node = _node.parent;
        }
    }
}
