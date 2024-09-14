if (hp <= 0) {
	instance_destroy();	
}
if (place_meeting(x + hspeed, y, obj_solid)) {
    direction = (direction + 180) mod 360;
}
hspeed = lengthdir_x(speed, direction);
vspeed = lengthdir_y(speed, direction);
x += hspeed;
y += vspeed;
if (!place_meeting(x, y + 1, obj_solid)) {
    y += 1;
}
