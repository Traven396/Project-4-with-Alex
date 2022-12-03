extends Node2D





func _on_Area2D_area_entered(area):
	FinishGame()


func _on_Area2D_body_entered(body):
	
	FinishGame()


func FinishGame():
	get_tree().change_scene("res://Traven396-Project-4-with-Alex-d598c0c/Scene/Ending Scene.tscn")
