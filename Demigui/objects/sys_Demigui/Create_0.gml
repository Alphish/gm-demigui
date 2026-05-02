schedule_link_move_update = function(_component) {
    if (!is_undefined(_component.link))
        _component.link.on_child_move();
    
    if (struct_exists(_component, "children")) {
        for (var i = 0, _count = array_length(_component.children); i < _count; i++) {
            _component.children[i].link.on_parent_move();
        }
    }
}
