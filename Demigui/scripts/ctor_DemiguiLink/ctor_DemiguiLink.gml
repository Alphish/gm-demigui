function DemiguiLink(_parent, _child) constructor {
    parent = _parent;
    child = _child;
    
    static link_ends = function() {
        parent.behavior.link_child(parent, child);
        child.behavior.link_parent(child, parent);
        child.link = self;
        on_link();
        return self;
    }
    
    static unlink_ends = function() {
        parent.behavior.unlink_child(parent, child);
        child.behavior.unlink_parent(child, parent); 
        child.link = undefined;
        on_unlink();
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
