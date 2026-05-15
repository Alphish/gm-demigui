function DemiguiActionHandler(_control, _redirects = undefined) constructor {
    control = _control;
    redirects = _redirects;
    
    static can_focus = function(_processor) {
        return true;
    }
    
    static on_focus = function(_processor) {
        control.behavior.add_modifier(control, "focus");
    }
    
    static on_blur = function(_processor) {
        control.behavior.remove_modifier(control, "focus");
    }
    
    static try_handle = function(_processor) {
        throw DemiguiException.not_implemented(self, nameof(try_handle));
    }
    
    static with_action_handler = function(_handler) {
        self.try_handle = _handler;
        return self;
    }
    
    static check_action = function(_key, _processor) {
        if (!is_undefined(redirects))
            _key = redirects[$ _key] ?? _key;
        
        if (is_array(_key)) {
            for (var i = 0, _count = array_length(_key); i < _count; i++) {
                if (_processor.check_action(_key[i]))
                    return true;
            }
            return false;
        } else {
            return _processor.check_action(_key);
        }
    }
}