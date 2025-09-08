function DemiguiPointer() constructor {
    hoverables = [];
    
    hover_control = undefined;
    x = undefined;
    y = undefined;
    xprevious = undefined;
    yprevious = undefined;
    
    static update_hoverables = function() {
        array_resize(hoverables, 0);
        populate_hoverables(sys_Demigui.control_nodes);
    }
    
    static populate_hoverables = function(_control_nodes) {
        for (var i = 0, _count = array_length(_control_nodes); i < _count; i++) {
            var _control_node = _control_nodes[i];
            if (is_instanceof(_control_node, DemiguiContainer))
                populate_hoverables(_control_node.controls, controls_count);
            
            if (is_callable(_control_node[$ "check_hover"]))
                array_push(hoverables, _control_node);
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
