pointers_by_group = {};

hover_instance = noone;
hover_pointer = noone;

check_hover = function() {
    hover_instance = noone;
    hover_pointer = noone;
    for (var i = 0; i < argument_count; i++) {
        var _hover_group = string_lower(argument[i]);
        var _pointer = pointers_by_group[$ _hover_group];
        hover_instance = _pointer.get_hover_instance();
        if (hover_instance != noone) {
            hover_pointer = _pointer;
            break;
        }
    }
}

try_interact = function() {
    with (hover_pointer) {
        try_interact();
    }
}
