extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/stage_1.tscn")


func _on_exit_pressed() -> void:
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
	get_tree().quit()
