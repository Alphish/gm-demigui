hover_group = string_lower(hover_group);
pointer = noone;
if (hover_group != "") {
    pointer = sys_Demigui.pointers_by_group[$ hover_group];
    pointer.add_hoverable(id);
}
