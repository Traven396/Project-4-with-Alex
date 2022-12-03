extends Node2D

export var startPos = 0
var t := 0.0

func _ready():
	$Path2D/PathFollow2D.offset=startPos
	t = startPos
	randomize()
	randomPlaySounds()

func _process(delta):
	t+=delta
	$Path2D/PathFollow2D.offset=t * 200


func randomPlaySounds():
	$Path2D/PathFollow2D/Timer.start(rand_range(1, 30))

func _on_Timer_timeout():
	$Path2D/PathFollow2D/Timer/AudioStreamPlayer2D.play()
	randomPlaySounds()
