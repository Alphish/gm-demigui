function DemiguiControl(_instance, _joint = undefined) : DemiguiComponent(_instance, _joint) constructor {
    control_group = find_control_group(parent);
    if (is_undefined(control_group))
        sys_Demigui.register_control_node(self);
    else
        control_group.add_control(self);
    
    // -------
    // Cleanup
    // -------
    
    static remove = function() {
        var _base_remove = DemiguiComponent.remove;
        _base_remove();
        
        if (is_undefined(control_group))
            sys_Demigui.unregister_control_node(self);
        else
            control_group.remove_control(self);
    }
}

DemiguiControl.find_control_group = function(_ancestor) {
    while (!is_undefined(_ancestor)) {
        if (_ancestor.is_control_group)
            return _ancestor;
        else
            _ancestor = _ancestor.parent;
    }
    return undefined;
}
