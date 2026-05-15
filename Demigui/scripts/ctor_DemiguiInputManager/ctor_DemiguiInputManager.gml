function DemiguiInputManager(_pointer, _processor) constructor {
    pointer = _pointer;
    action_processor = _processor;
    
    static push_context = function(_root, _topointer = true, _toactions = true) {
        var _context = new DemiguiInputTree(_root, _topointer ? pointer : undefined, _toactions ? action_processor : undefined);
        
        if (_context.has_pointer)
            pointer.push_context(_context);
        
        if (_context.has_actions)
            action_processor.push_context(_context);
        
        _context.refresh_controls();
        return _context;
    }
    
    static pop_context = function(_context) {
        if (_context.has_pointer)
            pointer.pop_context(_context);
        
        if (_context.has_actions)
            action_processor.pop_context(_context);
    }
}
