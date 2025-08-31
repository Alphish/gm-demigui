function DemiguiHookJoint(_parent) : DemiguiJoint(_parent) constructor {
    parent_width_amount = 0;
    parent_x_offset = 0;
    parent_height_amount = 0;
    parent_y_offset = 0;
    
    child_width_amount = 0;
    child_x_offset = 0;
    child_height_amount = 0;
    child_y_offset = 0;
    
    // -----
    // Setup
    // -----
    
    static with_parent_align = function(_horizontal, _vertical) {
        parent_width_amount = _horizontal / 2;
        parent_height_amount = _vertical / 2;
        return self;
    }
    
    static with_parent_offset = function(_xoffset, _yoffset) {
        parent_x_offset = _xoffset;
        parent_y_offset = _yoffset;
        return self;
    }
    
    static with_child_align = function(_horizontal, _vertical) {
        child_width_amount = _horizontal / 2;
        child_height_amount = _vertical / 2;
        return self;
    }
    
    static with_child_offset = function(_xoffset, _yoffset) {
        child_x_offset = _xoffset;
        child_y_offset = _yoffset;
        return self;
    }
    
    static with_align = function(_horizontal, _vertical) {
        return with_parent_align(_horizontal, _vertical).with_child_align(_horizontal, _vertical);
    }
    
    // ---------
    // Layouting
    // ---------
    
    static update_from_parent = function() {
        var _new_x = parent.x + parent.width * parent_width_amount + parent_x_offset;
        var _new_y = parent.y + parent.height * parent_height_amount + parent_y_offset;
        move_to(_new_x, _new_y);
    }
    
    static update_child = function() {
        if (is_undefined(child))
            return;
        
        var _new_x = x - child.width * child_width_amount + child_x_offset;
        var _new_y = y - child.height * child_height_amount + child_y_offset;
        child.move_to(_new_x, _new_y);
    }
    
    static move_by = function(_xoffset, _yoffset) {
        if (_xoffset == 0 && _yoffset == 0)
            return;
        
        x += _xoffset;
        y += _yoffset;
        if (!is_undefined(child))
            child.move_by(_xoffset, _yoffset);
    }
    
    static move_to = function(_x, _y) {
        move_by(_x - x, _y - y);
    }
}
