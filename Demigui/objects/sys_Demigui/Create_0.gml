schedule_joint_update = function(_component) {
    _component.update_joints();
}

schedule_parent_update = function(_joint) {
    _joint.update_parent();
}

schedule_child_update = function(_joint) {
    _joint.update_child();
}

schedule_instance_update = function(_component) {
    _component.update_instance();
}
