// Inherit the parent event
event_inherited();

action_handler = new DemiguiActionHandler(id, action_redirects).with_action_handler(function(_processor) {
    if (action_handler.check_action("previous", _processor))
        _processor.focus_previous(focus_wrap);
    else if (action_handler.check_action("next", _processor))
        _processor.focus_next(focus_wrap);
    
    return true;
});
