extends Node3D
class_name Main

@onready var area_3d: Area3D = $Area3D
@onready var sprite_3d: Sprite3D = $Area3D/Sprite3D

func _ready() -> void:
	area_3d.body_entered.connect(_on_area_3d_body_entered)
	area_3d.body_exited.connect(_on_area_3d_body_exited)

func _on_area_3d_body_entered(body):
	if body.name == "Player":
		sprite_3d.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property(sprite_3d, "scale", Vector3.ONE, 1.0).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		print("Player Entered!")
	
func _on_area_3d_body_exited(body):
	if body.name == "Player":
		var tween = get_tree().create_tween()
		tween.tween_property(sprite_3d, "scale", Vector3(.01, 0.01, 0.01), 1.0).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN)
		tween.tween_callback(func():
			sprite_3d.visible = false
		)
		print("Player Exited!")
