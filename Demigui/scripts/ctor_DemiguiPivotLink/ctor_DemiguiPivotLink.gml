function DemiguiPivotLink(_parent, _child) : DemiguiLink(_parent, _child) constructor {
    x_offset = 0;
    y_offset = 0;
    parent_width_amount = 0;
    parent_height_amount = 0;
    child_width_amount = 0;
    child_height_amount = 0;
    
    // -----
    // Setup
    // -----
    
    static with_offset = function(_xoffset, _yoffset) {
        x_offset = _xoffset;
        y_offset = _yoffset;
        return self;
    }
    
    static with_parent_align = function(_horizontal, _vertical) {
        parent_width_amount = _horizontal / 2;
        parent_height_amount = _vertical / 2;
        return self;
    }
    
    static with_child_align = function(_horizontal, _vertical) {
        child_width_amount = _horizontal / 2;
        child_height_amount = _vertical / 2;
        return self;
    }
    
    static with_align = function(_horizontal, _vertical) {
        return with_parent_align(_horizontal, _vertical).with_child_align(_horizontal, _vertical);
    }
    
    // ----------
    // Management
    // ----------
    
    static on_link = function() {
        var _child_x = parent.x + parent.width * parent_width_amount - child.width * child_width_amount + x_offset;
        var _child_y = parent.y + parent.height * parent_height_amount - child.height * child_height_amount + y_offset;
        child.move_to(_child_x, _child_y);
    }
    
    static on_child_move = function() {
        // do nothing
    }
    
    static on_parent_move = function() {
        var _child_x = parent.x + parent.width * parent_width_amount - child.width * child_width_amount + x_offset;
        var _child_y = parent.y + parent.height * parent_height_amount - child.height * child_height_amount + y_offset;
        child.move_to(_child_x, _child_y);
    }
}

DemiguiPivotLink.between = function(_parent, _child) {
    return new DemiguiPivotLink(_parent, _child);
}
