// Inherit the parent event
event_inherited();

behavior.set_style_value(id, "text", text);
behavior.set_style_value(id, "font", font);
behavior.set_style_value(id, "halign", halign);
behavior.set_style_value(id, "valign", valign);
behavior.set_style_value(id, "color", text_color);
behavior.set_style_value(id, "text_xoffset", text_xoffset);
behavior.set_style_value(id, "text_yoffset", text_yoffset);

delete text;
delete font;
delete halign;
delete valign;
delete text_color;
delete text_xoffset;
delete text_yoffset;
