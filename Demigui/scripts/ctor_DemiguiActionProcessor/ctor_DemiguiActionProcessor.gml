function DemiguiActionProcessor(_actions) constructor {
    actions_table = _actions;
    
    // -------
    // Context
    // -------
    
    context_stack = [];
    
    static push_context = function(_context) {
        var _processor = self;
        var _previous_context = array_last(context_stack);
        if (!is_undefined(_previous_context)) {
            with (_previous_context.focus_control) {
                _previous_context.focus_control.action_handler.on_blur(_processor);
            }
        }
        array_push(context_stack, _context);
    }
    
    static pop_context = function(_context) {
        while (array_pop(context_stack) != _context) {}
        
        var _top_context = array_last(context_stack);
        if (is_undefined(_top_context))
            return;
        
        var _processor = self;
        with (_top_context.focus_control) {
            _top_context.focus_control.action_handler.on_focus(_processor);
        }
    }
    
    // ----------
    // Processing
    // ----------
    
    static process = function() {
        var _context = array_last(context_stack);
        if (is_undefined(_context))
            return;
        
        if (is_undefined(_context.focus_control))
            return;
        
        var _node = _context.focus_control.node;
        while (true) {
            var _handle_result = _node.component.action_handler.try_handle(self);
            if (_handle_result)
                break;
            
            if (_node.component == _context.root)
                break;
            
            _node = _node.control_group;
        }
    }
    
    static focus_on = function(_control) {
        var _context = array_last(context_stack);
        if (is_undefined(_context))
            return;
        
        _context.set_focus(_control);
    }
    
    static focus_previous = function(_wrap = true) {
        var _context = array_last(context_stack);
        if (is_undefined(_context))
            return;
        
        var _index = _context.focus_index;
        if (_index == -1)
            return _context.set_focus(0);
        
        var _focusable_count = array_length(_context.focusables);
        var _target_index = (_index + _focusable_count - 1) mod _focusable_count;
        if (!_wrap && _target_index > _index)
            return;
        
        _context.set_focus(_target_index);
    }
    
    static focus_next = function(_wrap = true) {
        var _context = array_last(context_stack);
        if (is_undefined(_context))
            return;
        
        var _index = _context.focus_index;
        if (_index == -1)
            return _context.set_focus(0);
        
        var _focusable_count = array_length(_context.focusables);
        var _target_index = (_index + 1) mod _focusable_count;
        if (!_wrap && _target_index < _index)
            return;
        
        _context.set_focus(_target_index);
    }
    
    static check_action = function(_key) {
        return actions_table.check(_key);
    }
}
