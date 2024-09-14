#region CONTROLES
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);
key_jump_released = keyboard_check_released(vk_space); 
#endregion

#region MOVIMENTO
var move = key_right - key_left;
hspd = move * spd;
vspd += grv; 

if (hspd != 0) {
    image_xscale = sign(hspd);
}

// COLISÃO HORIZONTAL
if (place_meeting(x + hspd, y, obj_solid)) {
    while (!place_meeting(x + sign(hspd), y, obj_solid)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

// COLISÃO VERTICAL
if (place_meeting(x, y + vspd, obj_solid)) {
    while (!place_meeting(x, y + sign(vspd), obj_solid)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;



var jump_max_time = 10;  
var jump_strength = 12;
var jump_increment_speed = 1;  

if (place_meeting(x, y + 1, obj_solid) && !is_jumping) {
    if (key_jump) {
        is_jumping = true;
        jump_time = 0;
    }
}

if (is_jumping) {
    if (key_jump && jump_time < jump_max_time) {
        jump_time += jump_increment_speed;  
        vspd = -jump_strength * (jump_time / jump_max_time);  
    }
    if (key_jump_released || jump_time >= jump_max_time) {
        is_jumping = false;
    }
}
#endregion
