function DemiguiPositionLink(_parent, _child, _xoffset = 0, _yoffset = 0) : DemiguiLink(_parent, _child) constructor {
    x_offset = _xoffset;
    y_offset = _yoffset;
    
    // -----
    // Setup
    // -----
    
    static with_offset = function(_xoffset, _yoffset) {
        x_offset = _xoffset;
        y_offset = _yoffset;
        return self;
    }
    
    // ----------
    // Management
    // ----------
    
    static on_link = function() {
        child.behavior.move_to(child, parent.x + x_offset, parent.y + y_offset);
    }
    
    static on_parent_move = function() {
        child.behavior.move_to(child, parent.x + x_offset, parent.y + y_offset);
    }
}

DemiguiPositionLink.between = function(_parent, _child) {
    return new DemiguiPositionLink(_parent, _child);
}
