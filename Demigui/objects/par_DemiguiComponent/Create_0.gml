// putting this here instead of Variable Definitions
// so that image_xscale/image_yscale passed to definitions are properly accounted for
width ??= sprite_width;
height ??= sprite_height;

component_data = new data_type(id, joint);
if (is_callable(renderer)) {
    renderer = new renderer(component_data); // replace a constructor with an instance
}
component_data.renderer = renderer;
component_data.set_style(style);

delete joint;
delete data_type;
delete width;
delete height;
delete style;
