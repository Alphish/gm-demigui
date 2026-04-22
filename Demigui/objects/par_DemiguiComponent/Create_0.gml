// putting this here instead of Variable Definitions
// so that image_xscale/image_yscale passed to definitions are properly accounted for
width ??= sprite_width;
height ??= sprite_height;

component_data = new data_type(id);

delete data_type;
delete width;
delete height;
delete style;
