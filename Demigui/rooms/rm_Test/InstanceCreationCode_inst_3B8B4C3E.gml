with (component_data) {
    var _hook = create_hook().at_depth_offset(-1).with_parent_align(fa_center, fa_bottom).with_child_align(fa_left, fa_bottom);
    _hook.create_child(ui_DemiguiCanvas, { image_blend: c_yellow, sprite_index: spr_TestComponent, image_xscale: 6, image_yscale: 4 });

    _hook = create_hook().at_depth_offset(-1).with_align(fa_left, fa_top);
    _hook.create_child(ui_DemiguiCanvas, { image_blend: c_aqua, sprite_index: spr_TestComponent, image_xscale: 2, image_yscale: 2 });
    
    _hook = create_hook().at_depth_offset(-1).with_align(fa_right, fa_top);
    
    var _button_style = DemiguiStyle.create().with_value("background_alpha", 0.5);
    
    _button_style.get_variant(["hover"]).with_value("background_alpha", 1);
    
    _hook.create_child(ui_TestButton, {
        image_blend: c_red,
        image_xscale: 8,
        image_yscale: 3,
        command: function() { show_debug_message("Hello!"); },
        text: "Click me!",
        halign: fa_left,
        text_xoffset: 8,
        text_color: c_white,
        style: _button_style,
        });
}
