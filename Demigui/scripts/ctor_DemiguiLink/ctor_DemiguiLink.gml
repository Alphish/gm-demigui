function DemiguiLink(_parent, _child) constructor {
    parent = _parent;
    child = _child;
    
    static link_ends = function() {
        parent.link_child(child);
        child.link_parent(parent);
        child.link = self;
        on_link();
        return self;
    }
    
    static unlink_ends = function() {
        parent.unlink_child(child);
        child.unlink_parent(parent); 
        child.link = undefined;
        on_unlink();
    }
    
    static on_link = function() {
        child.move_to(parent.x, parent.y);
    }
    
    static on_unlink = function() {
        // do nothing
    }
    
    static on_parent_move = function() {
        child.move_to(parent.x, parent.y);
    }
    
    static on_child_move = function() {
        // do nothing
    }
}

DemiguiLink.between = function(_parent, _child) {
    return new DemiguiLink(_parent, _child);
}
