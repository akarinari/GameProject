extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -500.0
#const DOUBLE_JUMP = -600

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var wright :CollisionPolygon2D = get_node("WalkingRightA")
@onready var wleft :CollisionPolygon2D = get_node("WalkingLeftA")


func _ready():
	wright.disabled = false
	wleft.disabled = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_key_pressed(KEY_UP) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#elif Input.is_key_pressed(KEY_UP) and is_on_floor() == false:
		#velocity.y = DOUBLE_JUMP

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if direction == 1:
			wright.disabled = false
		elif direction == 0:
			wleft.disabled = false
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()
	
	

