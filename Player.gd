extends KinematicBody2D
 
const MOVE_SPEED = 300
const JUMP_FORCE = 500
const GRAVITY = 25
const MAX_FALL_SPEED = 900


var doubleJump = 1
 
onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite
var jump_count = 2
var y_velo = 0
var facing_right = true
 
func _physics_process(delta):
    var move_dir = 0
    if Input.is_action_pressed("move_right"):
        move_dir += 1
    if Input.is_action_pressed("move_left"):
        move_dir -= 1
    move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))
   
    var grounded = is_on_floor()
    y_velo += GRAVITY
	
	
	
    if jump_count > 0 and Input.is_action_just_pressed("jump"):
        y_velo = -JUMP_FORCE
        jump_count -= 1
    if grounded and y_velo >= 5:
        y_velo = 5
    if y_velo > MAX_FALL_SPEED:
        y_velo = MAX_FALL_SPEED
	
	
    if grounded and Input.is_action_just_pressed("jump"):
        y_velo = -JUMP_FORCE
        jump_count -= 1
    if grounded and y_velo >= 5:
        y_velo = 5
    if y_velo > MAX_FALL_SPEED:
        y_velo = MAX_FALL_SPEED
   
    if facing_right and move_dir < 0:
        flip()
    if !facing_right and move_dir > 0:
        flip()
   
    if grounded:
       jump_count = 1


    if grounded:
        if move_dir == 0:
            play_anim("idle")
        else:
            play_anim("Walk")
    else:
        play_anim("jump")
 
func flip():
    facing_right = !facing_right
    sprite.flip_h = !sprite.flip_h
 
func play_anim(anim_name):
    if anim_player.is_playing() and anim_player.current_animation == anim_name:
        return
    anim_player.play(anim_name)
	
	
	
	