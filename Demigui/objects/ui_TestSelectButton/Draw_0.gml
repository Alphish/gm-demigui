draw_self();

draw_set_color(text_color);
demigui_draw_boxed_text(id, text, font, halign, valign, text_xoffset, text_yoffset);

draw_set_alpha(1);
draw_set_color(c_white);
