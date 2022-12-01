extends Area2D


func resetScene():
	get_tree().reload_current_scene()
	print_debug("Hit")


func _on_Area2D_area_entered(area):
	resetScene()


func _on_Area2D_body_entered(body):
	resetScene()
