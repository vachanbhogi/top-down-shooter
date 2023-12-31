extends Control

@onready var scoreboard := $Score

func _ready() -> void:
	scoreboard.text = "%04d" % Global.score
	
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/World/world.tscn")


func _on_title_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Title/title_screen.tscn")

