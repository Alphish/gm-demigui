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

schedule_link_move_update = function(_component) {
    if (!is_undefined(_component.link))
        _component.link.on_child_move();
    
    if (struct_exists(_component, "children")) {
        for (var i = 0, _count = array_length(_component.children); i < _count; i++) {
            _component.children[i].link.on_parent_move();
        }
    }
}

schedule_instance_update = function(_component) {
    _component.update_instance();
}
