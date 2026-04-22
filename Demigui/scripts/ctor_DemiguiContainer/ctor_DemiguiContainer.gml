function DemiguiContainer(_instance) : DemiguiComponent(_instance) constructor {
    children = [];
    
    if (_instance.is_control_group)
        control_node = new DemiguiControlNode(_instance, /* is container */ true);
    
    // --------
    // Children
    // --------
    
    static link_child = function(_component) {
        array_push(children, _component);
    }
    
    static unlink_child = function(_child) {
        var _index = array_get_index(children, _child);
        if (_index < 0)
            throw "Could not find child.";
        
        array_delete(children, _index, 1);
    }
}
