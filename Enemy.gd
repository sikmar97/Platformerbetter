extends KinematicBody2D

const gravity = 10
const speed = 40
const Floor = Vector2(0, -1)

var velocity = Vector2()
onready var sprite = $Sprite
onready var anim_player = $AnimationPlayer
var direction = 1

func _ready():
	pass 
	
	
func _physics_process(delta):
	
	velocity.x = speed * direction
	
	
	if direction == 1:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	play_anim("walk")
	
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Floor)
	
	if is_on_wall():
		direction = direction * -1
		
		
		
		
func play_anim(anim_name):
    if anim_player.is_playing() and anim_player.current_animation == anim_name:
        return
    anim_player.play(anim_name)