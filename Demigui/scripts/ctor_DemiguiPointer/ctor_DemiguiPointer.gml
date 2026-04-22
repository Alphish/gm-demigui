function DemiguiPointer(_root) constructor {
    root = _root;
    hoverables = [];
    
    hover_control = undefined;
    x = undefined;
    y = undefined;
    xprevious = undefined;
    yprevious = undefined;
    
    static update_hoverables = function() {
        array_resize(hoverables, 0);
        populate_hoverables(root);
    }
    
    static populate_hoverables = function(_node) {
        if (_node.is_container) {
            for (var i = 0, _count = array_length(_node.children); i < _count; i++) {
                populate_hoverables(_node.children[i]);
            }
        } else {
            if (is_callable(_node.control.component_data[$ "check_hover"]))
                array_push(hoverables, _node.control.component_data);
        }
    }
    
    static update_coordinates = function() {
        xprevious = x;
        yprevious = y;
        x = mouse_x;
        y = mouse_y;
    }
    
    static check_hover = function() {
        var _previous_hover = hover_control;
        hover_control = undefined;
        
        for (var i = 0, _count = array_length(hoverables); i < _count; i++) {
            var _hoverable = hoverables[i];
            if (!_hoverable.check_hover(self))
                continue;
            
            if (is_undefined(hover_control) || _hoverable.instance.depth < hover_control.instance.depth)
                hover_control = _hoverable;
        }
        
        if (_previous_hover == hover_control)
            return;
        
        if (!is_undefined(_previous_hover) && !is_undefined(_previous_hover[$ "on_unhover"]))
            _previous_hover.on_unhover(self);
        
        if (!is_undefined(hover_control) && !is_undefined(hover_control[$ "on_hover"]))
            hover_control.on_hover(self);
    }
    
    static try_interact = function() {
        if (is_undefined(hover_control))
            return;
        
        if (mouse_check_button_pressed(mb_left) && !is_undefined(hover_control[$ "on_click"]))
            hover_control.on_click(self);
    }
}
