function DemiguiInputTree(_root, _pointer, _processor) constructor {
    root = _root;
    
    pointer = _pointer;
    has_pointer = !is_undefined(pointer);
    actions_processor = _processor;
    has_actions = !is_undefined(actions_processor);
    
    hoverables = has_pointer ? [] : undefined;
    hover_control = noone;
    
    focusables = has_actions ? [] : undefined;
    focus_control = _root;
    focus_index = -1;
    
    needs_refresh = true;
    
    // ----------
    // Refreshing
    // ----------
    
    static refresh_controls = function() {
        if (has_pointer)
            array_resize(hoverables, 0);
        
        if (has_actions)
            array_resize(focusables, 0);
        
        populate_controls(root.node);
        
        if (has_actions)
            focus_index = array_get_index(focusables, focus_control);
        
        needs_refresh = false;
    }
    
    static populate_controls = function(_node) {
        if (_node.component.is_container) {
            for (var i = 0, _count = array_length(_node.control_children); i < _count; i++) {
                populate_controls(_node.control_children[i]);
            }
        } else {
            if (has_pointer && is_hoverable(_node.component))
                array_push(hoverables, _node.component);
            
            if (has_actions && is_focusable(_node.component))
                array_push(focusables, _node.component);
        }
    }
    
    static is_hoverable = function(_control) {
        return !is_undefined(_control[$ nameof(pointer_handler)]);
    }
    
    static is_focusable = function(_control) {
        return !is_undefined(_control[$ nameof(action_handler)]);
    }
    
    // -----
    // Hover
    // -----
    
    static set_hover = function(_control) {
        if (_control != noone && !is_hoverable(_control))
            throw DemiguiException.invalid_argument("control", "Cannot set hover to a control that cannot handle pointers.");
        
        if (hover_control == _control)
            return;
        
        with (hover_control) {
            pointer_handler.on_unhover(other.pointer);
        }
        
        hover_control = _control;
        with (hover_control) {
            pointer_handler.on_hover(other.pointer);
        }
    }
    
    // -----
    // Focus
    // -----
    
    static set_focus = function(_control) {
        var _index = undefined;
        if (_control != noone && is_real(_control)) {
            _index = _control;
            _control = focusables[_index];
        }
        
        if (_control != noone) {
            if (!is_focusable(_control))
                throw DemiguiException.invalid_argument("control", "Cannot set focus to a control that cannot handle actions.");
            
            if (!_control.action_handler.can_focus(actions_processor))
                return;
        }
        
        
        if (focus_control == _control)
            return;
        
        with (focus_control) {
            action_handler.on_blur(other.actions_processor);
        }
        
        focus_control = _control;
        focus_index = _index ?? array_get_index(focusables, focus_control);
        with (focus_control) {
            action_handler.on_focus(other.actions_processor);
        }
    }
}
