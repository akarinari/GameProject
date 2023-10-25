extends Area2D

var og_pos
var dir = 1
var steps = 180
var speed = 2

@onready var w_right :CollisionPolygon2D = get_node("walk_right")
@onready var w_left :CollisionPolygon2D = get_node("walk_left")
@onready var a_right :CollisionPolygon2D = get_node("attack_right")
@onready var a_left :CollisionPolygon2D = get_node("attack_left")

#@onready var anim_wr :AnimationPlayer = get_node("walking_right")
#@onready var anim_wl :AnimationPlayer = get_node("walking_left")

# Called when the node enters the scene tree for the first time.
func _ready():
	og_pos = position.x
	w_right.disabled = false
	w_left.disabled = true
	a_right.disabled = true
	a_left.disabled = true
	
	#anim_wl.disabled = false
	#anim_wr.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += dir * speed
	if position.x > og_pos + steps:
		dir = -1
		w_left.disabled = false
		#anim_wl.disabled = false
	elif position.x < og_pos - steps:
		dir = 1
		w_right.disabled = false
		#anim_wr.disabled = false
		
		
	
	
