function DemiguiPointerHandler(_control) constructor {
    control = _control;
    
    static check_hover = function(_pointer) {
        return position_meeting(_pointer.x, _pointer.y, control);
    }
    
    static on_hover = function(_pointer) {
        control.behavior.add_modifier(control, "hover");
    }
    
    static on_unhover = function(_pointer) {
        control.behavior.remove_modifier(control, "hover");
    }
    
    static on_click = function(_pointer) {
        throw DemiguiException.not_implemented(self, nameof(on_click));
    }
    
    static with_click_handler = function(_handler) {
        self.on_click = _handler;
        return self;
    }
}
