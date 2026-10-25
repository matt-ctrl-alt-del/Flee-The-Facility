extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_out")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$CanvasLayer/Fade_transition.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
