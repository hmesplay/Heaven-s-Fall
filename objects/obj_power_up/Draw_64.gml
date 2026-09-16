draw_set_font(font_powerup_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_color(c_aqua);
//draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
draw_sprite_stretched(spr_powerup_box, 0, menu_x, menu_y, menu_width, menu_height);
draw_set_color(c_white);


for (var i = 0; i < array_length(powerups); i++) {
    var y_pos = menu_y + 50 + i * 50;
    if (i == selection) draw_set_color(c_yellow);
    draw_text(menu_x + 20, y_pos, powerups[i]);
    draw_set_color(c_white);
}