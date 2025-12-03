extends Area2D

var direction = Vector2.LEFT
var speed = 100

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
