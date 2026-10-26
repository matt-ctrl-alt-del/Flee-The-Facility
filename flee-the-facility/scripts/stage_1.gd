extends Node2D

var items = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_out")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$CanvasLayer/Fade_transition.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if items >= 4:
			print("All items collected.")
			$CanvasLayer/Fade_transition.show()
			$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
			await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
			get_tree().change_scene_to_file("res://scenes/stage_2.tscn")
		else: 
			print("You only have " + str(items) + " items.")


func _on_box_body_entered(body: Node2D) -> void:
	items += 1
	print("Items: " + str(items))
	$Items/box.queue_free()
	$Items/box/PointLight2D.queue_free()

func _on_diamond_body_entered(body: Node2D) -> void:
	items += 1
	print("Items: " + str(items))
	$Items/diamond.queue_free()
	$Items/diamond/PointLight2D.queue_free()

func _on_cone_body_entered(body: Node2D) -> void:
	items += 1
	print("Items: " + str(items))
	$Items/cone.queue_free()
	$Items/cone/PointLight2D.queue_free()

func _on_cube_body_entered(body: Node2D) -> void:
	items += 1
	print("Items: " + str(items))
	$Items/cube.queue_free()
	$Items/cube/PointLight2D2.queue_free()
