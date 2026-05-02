// putting this here instead of Variable Definitions
// so that image_xscale/image_yscale passed to definitions are properly accounted for
width ??= sprite_width;
height ??= sprite_height;

if (is_callable(behavior))
    behavior = new behavior();

link = undefined;
parent = undefined;
control_node = undefined;

style_modifiers = undefined;
style_values = undefined;

if (is_callable(renderer))
    renderer = new renderer(self); // replace a constructor with an instance
