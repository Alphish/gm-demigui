control_nodes = [];
control_nodes_count = 0;

register_control_node = function(_node) {
    array_push(control_nodes, _node);
    control_nodes_count += 1;
}

unregister_control_node = function(_node) {
    var _idx = array_get_index(control_nodes, _node);
    if (_idx < 0)
        return;
    
    array_delete(control_nodes, _idx, 1);
    control_nodes_count -= 1;
}

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
