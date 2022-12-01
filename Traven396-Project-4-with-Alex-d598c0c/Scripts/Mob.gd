extends Node2D

export var startPos = 0
var t := 0.0

func _ready():
	$Path2D/PathFollow2D.offset=startPos
	t = startPos

func _process(delta):
	t+=delta
	$Path2D/PathFollow2D.offset=t * 200


