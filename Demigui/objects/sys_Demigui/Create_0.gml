schedule_link_move_update = function(_component) {
    if (!is_undefined(_component.node.link))
        _component.node.link.on_child_move();
    
    if (_component.is_container) {
        for (var i = 0, _count = array_length(_component.node.children); i < _count; i++) {
            _component.node.children[i].link.on_parent_move();
        }
    }
}
