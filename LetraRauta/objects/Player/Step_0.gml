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



var jump_max_time = 12;  
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
#region VIDA
if (invulnerable_time > 0) {
    invulnerable_time -= 1;
    if (invulnerable_time <= 0) {
        recent_hit = false; 
    }
}

if (place_meeting(x+1, y, obj_inimigos) && invulnerable_time <= 0 && !recent_hit) {
	if (hp - 2 > 0) {
    hp -= 2;  
	} else {
	hp = 0;	
	}
    invulnerable_time = invulnerable_max_time;
    recent_hit = true; 
}

if (!place_meeting(x+1, y, obj_inimigos)) {
    recent_hit = false;  
}
if (invulnerable_time > 0) {
    if (invulnerable_time mod 10 < 5) {
       
    }
} else {
    draw_self();
}
#endregion
#region ATAQUE
attack_cooldown = 1;
if (!attack_cooldown) attack_cooldown = 0;  
var cooldown_max = 30;
if (attack_cooldown > 0) {
    attack_cooldown -= 1; 
}

var directions = [55, -55];

for (var i = 0; i < array_length_1d(directions); i++) {
    var other_instance = instance_place(x + directions[i], y, obj_inimigos);
    if (other_instance != noone) {
        if (keyboard_check_pressed(ord("Z")) && attack_cooldown <= 0) {
            other_instance.hp -= 2;
            attack_cooldown = cooldown_max;
            break;
        }
    }
}
#endregion
