extends SubViewport

@onready var camera: Camera2D = $Camera2D
@onready var player: CharacterBody2D = $"../../../player"

func _ready() -> void:
	var main_viewport = get_tree().root.get_viewport()
	self.world_2d = main_viewport.world_2d
	$Sprite2D.show()
	$Sprite2D.hide()

func _process(delta: float) -> void:
	camera.position = player.global_position
