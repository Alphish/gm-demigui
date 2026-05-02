function DemiguiContainerBehavior() : DemiguiComponentBehavior() constructor {
    // --------
    // Children
    // --------
    
    static link_child = function(_instance, _component) {
        array_push(_instance.children, _component);
    }
    
    static unlink_child = function(_instance, _child) {
        var _index = array_get_index(_instance.children, _child);
        if (_index < 0)
            throw "Could not find child.";
        
        array_delete(_instance.children, _index, 1);
    }
}
