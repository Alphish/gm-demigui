// Inherit the parent event
event_inherited();

var _rootlink = new DemiguiPositionLink(ctrl_Test.id, id, x, y);
_rootlink.linked();

var _button_stylesheet = new DemiguiStylesheet(["hover", "active", "focus"])
    .with_style("focus", { image_blend: c_orange })
    .with_style("hover", { image_alpha: 1 })
    .with_style("active", { text_color: c_yellow, image_alpha: 1 })
    .with_style(["hover", "active"], { text_color: c_aqua });

var _component;
_component = instance_create_depth(0, 0, other.depth - 1, ui_TestButton, {
    image_blend: c_green,
    image_xscale: 8,
    image_yscale: 3,
    command: function() {
        instance_create_depth(160, 160, depth - 100, ui_DemoInnerMenu);
        var _context = ctrl_Test.input_manager.push_context(ui_DemoInnerMenu.id);
        ui_DemoInnerMenu.input_context = _context;
        },
    text: "Open window",
    text_color: c_white,
    stylesheet: _button_stylesheet,
    });
DemiguiPositionLink.between(id, _component).with_offset(0, 0).linked();

_component = instance_create_depth(0, 0, other.depth - 1, ui_TestButton, {
    image_blend: c_green,
    image_xscale: 8,
    image_yscale: 3,
    command: function() { game_end(); },
    text: "Close demo",
    text_color: c_white,
    stylesheet: _button_stylesheet,
    });
DemiguiPositionLink.between(id, _component).with_offset(0, 80).linked();
