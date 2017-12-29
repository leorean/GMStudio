kLeft = false;
kRight = false;
kJump = false;
kJumpPressing = false;
if (global.state != G_PLAY) exit;

if (global.left != noone && global.right != noone && global.jump != noone)
{
    kLeft = global.left.pressing;
    kRight = global.right.pressing;
    kJump = global.jump.pressed;
    kJumpPressing = global.jump.pressing;
}

if (!kLeft) kLeft = keyboard_check(vk_left);
if (!kRight) kRight = keyboard_check(vk_right);
if (!kJump) kJump = keyboard_check_pressed(vk_up);
if (!kJumpPressing) kJumpPressing = keyboard_check(vk_up);
