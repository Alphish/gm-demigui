/// @description Insert description here
event_inherited();

node.attach_with = function(_link) {
    throw DemiguiException.unsupported_operation("Cannot attach a root component as a child of another component.");
}
