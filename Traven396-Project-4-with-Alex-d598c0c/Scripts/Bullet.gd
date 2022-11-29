extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Add a timer to this node
	var timer = Timer.new()
	self.add_child(timer)
	
# Connect the timer to make it call "queue_free" after two seconds
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(4)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
