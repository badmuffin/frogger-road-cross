extends CharacterBody2D

var direction: Vector2 = Vector2(1, 0)
var speed: int = 100

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * speed * delta
	move_and_slide()
