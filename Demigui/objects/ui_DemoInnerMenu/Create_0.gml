event_inherited();

var _rootlink = new DemiguiPositionLink(ctrl_Test.id, id, x, y);
_rootlink.linked();

var _component = instance_create_depth(0, 0, other.depth - 1, ui_DemiguiCanvas, { image_blend: c_yellow, sprite_index: spr_TestComponent, image_xscale: 6, image_yscale: 4 });
DemiguiPivotLink.between(id, _component).with_parent_align(fa_right, fa_middle).with_child_align(fa_left, fa_bottom).linked();

_component = instance_create_depth(0, 0, other.depth - 1, ui_DemiguiCanvas, { image_blend: c_aqua, sprite_index: spr_TestComponent, image_xscale: 2, image_yscale: 2 });
DemiguiPivotLink.between(id, _component).with_align(fa_left, fa_top).linked();

var _button_stylesheet = new DemiguiStylesheet(["hover", "active", "focus"])
    .with_style("focus", { image_blend: c_orange })
    .with_style("hover", { image_alpha: 1 })
    .with_style("active", { text_color: c_yellow, image_alpha: 1 })
    .with_style(["hover", "active"], { text_color: c_aqua });

_component = instance_create_depth(0, 0, other.depth - 1, ui_TestButton, {
    image_blend: c_green,
    image_xscale: 8,
    image_yscale: 3,
    command: function() { show_debug_message(ctrl_Test.test_string.get_value()); },
    text: "Click me!",
    halign: fa_left,
    text_xoffset: 8,
    text_color: c_white,
    stylesheet: _button_stylesheet,
    });
DemiguiPivotLink.between(id, _component).with_align(fa_right, fa_top).linked();

_component = instance_create_depth(0, 0, other.depth - 1, ui_TestSelectButton, {
    image_blend: c_gray,
    image_xscale: 8,
    image_yscale: 2,
    select_value: "Lorem",
    value_property: ctrl_Test.test_string,
    text: "Lorem",
    text_color: c_white,
    stylesheet: _button_stylesheet,
    });
DemiguiPivotLink.between(id, _component).with_align(fa_left, fa_middle).linked();

_component = instance_create_depth(0, 0, other.depth - 1, ui_TestSelectButton, {
    image_blend: c_gray,
    image_xscale: 8,
    image_yscale: 2,
    select_value: "Ipsum",
    value_property: ctrl_Test.test_string,
    text: "Ipsum",
    text_color: c_white,
    stylesheet: _button_stylesheet,
    });
DemiguiPivotLink.between(id, _component).with_align(fa_center, fa_middle).linked();

_component = instance_create_depth(0, 0, other.depth - 1, ui_TestSelectButton, {
    image_blend: c_gray,
    image_xscale: 8,
    image_yscale: 2,
    select_value: "Dolor",
    value_property: ctrl_Test.test_string,
    text: "Dolor",
    text_color: c_white,
    stylesheet: _button_stylesheet,
    });
DemiguiPivotLink.between(id, _component).with_align(fa_right, fa_middle).linked();

_component = instance_create_depth(0, 0, other.depth - 1, ui_TestButton, {
    image_blend: c_red,
    image_xscale: 8,
    image_yscale: 3,
    command: function() { ctrl_Test.input_manager.pop_context(ui_DemoInnerMenu.input_context); instance_destroy(ui_DemoInnerMenu); },
    text: "Leave",
    halign: fa_left,
    text_xoffset: 8,
    text_color: c_white,
    stylesheet: _button_stylesheet,
    });
DemiguiPivotLink.between(id, _component).with_align(fa_center, fa_bottom).linked();
