function DemiguiLink(_parent, _child) constructor {
    parent = _parent;
    child = _child;
    
    static link_ends = function() {
        child.node.attach_with(self);
        return self;
    }
    
    static on_link = function() {
        child.behavior.move_to(parent.x, parent.y);
    }
    
    static on_unlink = function() {
        // do nothing
    }
    
    static on_parent_move = function() {
        child.behavior.move_to(parent.x, parent.y);
    }
    
    static on_child_move = function() {
        // do nothing
    }
}

DemiguiLink.between = function(_parent, _child) {
    return new DemiguiLink(_parent, _child);
}
