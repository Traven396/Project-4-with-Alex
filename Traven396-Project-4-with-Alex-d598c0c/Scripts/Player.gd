extends KinematicBody2D
signal hit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 250
export var startPos = Vector2.ZERO
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(_delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	var velocity2: Vector2
	if velocity.length() > 0:
		velocity2 = velocity.normalized() * speed
		rotation_degrees = rad2deg(velocity.angle())
	
	move_and_slide(velocity2)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var newScript = collision.collider.get_script()
		if (newScript != null):
			if (newScript.has_method("resetScene")):
				newScript.resetScene()
	
	

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	
	$CollisionShape2D.set_deferred("disabled", true)

