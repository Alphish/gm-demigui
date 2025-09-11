// Inherit the parent event
event_inherited();

component_data.set_style_value("text", text);
component_data.set_style_value("font", font);
component_data.set_style_value("halign", halign);
component_data.set_style_value("valign", valign);
component_data.set_style_value("color", text_color);
component_data.set_style_value("text_xoffset", text_xoffset);
component_data.set_style_value("text_yoffset", text_yoffset);

delete text;
delete font;
delete halign;
delete valign;
delete text_color;
delete text_xoffset;
delete text_yoffset;
