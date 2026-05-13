// putting this here instead of Variable Definitions
// so that image_xscale/image_yscale passed to definitions are properly accounted for
width ??= sprite_width;
height ??= sprite_height;

if (is_callable(behavior))
    behavior = new behavior();

node = new DemiguiComponentNode(id);

style = !is_undefined(stylesheet) ? new DemiguiStyleManager(id, stylesheet) : undefined;
