kLeft = false;
kRight = false;
kJump = false;

if (global.left != noone && global.right != noone && global.jump != noone)
{
    kLeft = global.left.pressing;
    kRight = global.right.pressing;
    kJump = global.jump.pressed;
}

if (!kLeft) kLeft = keyboard_check(vk_left);
if (!kRight) kRight = keyboard_check(vk_right);
if (!kJump) kJump = keyboard_check_pressed(vk_up);
