hover_group = string_lower(hover_group);
sys_Demigui.pointers_by_group[$ hover_group] = id;

hoverables = [];

add_hoverable = function(_component) {
    array_push(hoverables, _component);
}

remove_hoverable = function(_component) {
    var _idx = array_get_index(hoverables, _component);
    if (_idx < 0)
        return;
    
    hoverables[_idx] = array_pop(hoverables);
}

get_hover_instance = function() {
    throw DemiguiException.not_implemented(id, nameof(get_hover_instance));
}

try_interact = function() {
    throw DemiguiException.not_implemented(id, nameof(try_interact));
}
