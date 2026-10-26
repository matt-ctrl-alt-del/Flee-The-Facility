extends Node2D

var items = 0

@export var player: CharacterBody2D
@export var exit_area: Area2D
@export var distance_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Tracker/HBoxContainer/Box.modulate.a = 0.25
	$CanvasLayer/Tracker/HBoxContainer/Cone.modulate.a = 0.25
	$CanvasLayer/Tracker/HBoxContainer/Diamond.modulate.a = 0.25
	$CanvasLayer/Tracker/HBoxContainer/Cube.modulate.a = 0.25
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_out")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$CanvasLayer/Fade_transition.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not player or not exit_area or not distance_label:
		print("error, check code, not player/not area/not labels triggered")
		return
		
	var distance = player.global_position.distance_to(exit_area.global_position)
	distance_label.text = "Distance to exit: " + (str(round(distance))) + "m"


func _on_box_body_entered(body: Node2D) -> void:
	$Items/box.queue_free()
	$Items/box/PointLight2D.queue_free()
	items += 1
	print("Items Collected: " + (str(items)))
	$CanvasLayer/Tracker/HBoxContainer/Box.modulate.a = 1.0
	$CanvasLayer/LabelItems.text = "Items Collected: " + (str(items))
	
func _on_cone_body_entered(body: Node2D) -> void:
	$Items/cone.queue_free()
	$Items/cone/PointLight2D3.queue_free()
	items += 1
	print("Items Collected: " + (str(items)))
	$CanvasLayer/Tracker/HBoxContainer/Cone.modulate.a = 1.0
	$CanvasLayer/LabelItems.text = "Items Collected: " + (str(items))
	
func _on_cube_body_entered(body: Node2D) -> void:
	$Items/cube.queue_free()
	$Items/cube/PointLight2D4.queue_free()
	items += 1
	print("Items Collected: " + (str(items)))
	$CanvasLayer/Tracker/HBoxContainer/Cube.modulate.a = 1.0
	$CanvasLayer/LabelItems.text = "Items Collected: " + (str(items))
	
func _on_diamond_body_entered(body: Node2D) -> void:
	$Items/diamond.queue_free()
	$Items/diamond/PointLight2D2.queue_free()
	items += 1
	print("items Collected: " + (str(items)))
	$CanvasLayer/Tracker/HBoxContainer/Diamond.modulate.a = 1.0
	$CanvasLayer/LabelItems.text = "Items Collected: " + (str(items))


func _on_exit_body_entered(body: Node2D) -> void:
	if items >= 4:
		print("You got all 4/4 items.")
		$CanvasLayer/Fade_transition.show()
		$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
		await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://scenes/thanks.tscn")
	else: 
		print("You only collected " + (str(items)) + " items")
