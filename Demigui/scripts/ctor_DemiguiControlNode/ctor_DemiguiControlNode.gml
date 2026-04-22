function DemiguiControlNode(_control, _iscontainer) constructor {
    control = _control;
    parent = undefined;
    is_container = _iscontainer;
    children = _iscontainer ? [] : undefined;
    
    static attach_to = function(_parent) {
        if (!_parent.is_container)
            throw $"Cannot attach a control node to a non-container node.";
        
        parent = _parent;
        array_push(parent.children, self);
    }
    
    static detach = function() {
        if (is_undefined(parent))
            return;
        
        var _index = array_get_index(parent.children, self);
        if (_index < 0)
            throw "Could not find child.";
        
        array_delete(parent.children, _index, 1);
        parent = undefined;
    }
}
