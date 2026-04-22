var _rootlink = new DemiguiPositionLink(ctrl_Test.component_data, component_data, x, y);
component_data.attach_with(_rootlink);

with (component_data) {
    var _component = instance_create_depth(0, 0, other.depth - 1, ui_DemiguiCanvas, { image_blend: c_yellow, sprite_index: spr_TestComponent, image_xscale: 6, image_yscale: 4 });
    DemiguiPivotLink.between(self, _component.component_data).with_parent_align(fa_right, fa_middle).with_child_align(fa_right, fa_bottom).link_ends();
    
    _component = instance_create_depth(0, 0, other.depth - 1, ui_DemiguiCanvas, { image_blend: c_aqua, sprite_index: spr_TestComponent, image_xscale: 2, image_yscale: 2 });
    DemiguiPivotLink.between(self, _component.component_data).with_align(fa_left, fa_top).link_ends();
    
    var _button_style = DemiguiStyle.create().with_value("background_alpha", 0.5);
    _button_style.get_variant(["hover"]).with_value("background_alpha", 1);
    _button_style.get_variant(["active"]).with_value("color", c_yellow);
    
    _component = instance_create_depth(0, 0, other.depth - 1, ui_TestButton, {
        image_blend: c_red,
        image_xscale: 8,
        image_yscale: 3,
        command: function() { show_debug_message(ctrl_Test.test_string.get_value()); },
        text: "Click me!",
        halign: fa_left,
        text_xoffset: 8,
        text_color: c_white,
        style: _button_style,
        });
    DemiguiPivotLink.between(self, _component.component_data).with_align(fa_right, fa_top).link_ends();
    
    _component = instance_create_depth(0, 0, other.depth - 1, ui_TestSelectButton, {
        image_blend: c_gray,
        image_xscale: 8,
        image_yscale: 2,
        select_value: "Lorem",
        value_property: ctrl_Test.test_string,
        text: "Lorem",
        text_color: c_white,
        style: _button_style,
        });
    DemiguiPivotLink.between(self, _component.component_data).with_align(fa_left, fa_bottom).link_ends();
    
    _component = instance_create_depth(0, 0, other.depth - 1, ui_TestSelectButton, {
        image_blend: c_gray,
        image_xscale: 8,
        image_yscale: 2,
        select_value: "Ipsum",
        value_property: ctrl_Test.test_string,
        text: "Ipsum",
        text_color: c_white,
        style: _button_style,
        });
    DemiguiPivotLink.between(self, _component.component_data).with_align(fa_center, fa_bottom).link_ends();
    
    _component = instance_create_depth(0, 0, other.depth - 1, ui_TestSelectButton, {
        image_blend: c_gray,
        image_xscale: 8,
        image_yscale: 2,
        select_value: "Dolor",
        value_property: ctrl_Test.test_string,
        text: "Dolor",
        text_color: c_white,
        style: _button_style,
        });
    DemiguiPivotLink.between(self, _component.component_data).with_align(fa_right, fa_bottom).link_ends();
}
