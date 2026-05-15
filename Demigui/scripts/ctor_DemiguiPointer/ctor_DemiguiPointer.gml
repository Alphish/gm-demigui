function DemiguiPointer() constructor {
    x = undefined;
    y = undefined;
    xprevious = undefined;
    yprevious = undefined;
    
    // -------
    // Context
    // -------
    
    context_stack = [];
    
    static push_context = function(_context) {
        var _previous_context = array_last(context_stack);
        if (!is_undefined(_previous_context))
            _previous_context.set_hover(noone);
        
        array_push(context_stack, _context);
    }
    
    static pop_context = function(_context) {
        while (array_pop(context_stack) != _context) {}
    }
    
    // ----------
    // Processing
    // ----------
    
    static process = function() {
        update_coordinates();
        check_hover();
        try_interact();
    }
    
    static update_coordinates = function() {
        xprevious = x;
        yprevious = y;
        x = mouse_x;
        y = mouse_y;
    }
    
    static check_hover = function() {
        var _context = array_last(context_stack);
        if (is_undefined(_context))
            return;
        
        var _hoverables = _context.hoverables;
        var _found_hover = noone;
        
        for (var i = 0, _count = array_length(_hoverables); i < _count; i++) {
            var _hoverable = _hoverables[i];
            if (!_hoverable.pointer_handler.check_hover(self))
                continue;
            
            if (!instance_exists(_found_hover) || _hoverable.depth < _found_hover.depth)
                _found_hover = _hoverable;
        }
        
        _context.set_hover(_found_hover);
    }
    
    static try_interact = function() {
        var _context = array_last(context_stack);
        if (is_undefined(_context))
            return;
        
        var _control = _context.hover_control;
        if (!instance_exists(_control))
            return;
        
        if (mouse_check_button_pressed(mb_left))
            _control.pointer_handler.on_click(self);
    }
}
