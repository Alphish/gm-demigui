/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

pointer_handler = accepts_pointer ? new DemiguiPointerHandler(id) : undefined;
action_handler = accepts_actions ? new DemiguiActionHandler(id, action_redirects) : undefined;
