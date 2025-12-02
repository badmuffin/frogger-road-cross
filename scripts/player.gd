extends CharacterBody2D

var direction: Vector2 = Vector2(1, 0)
var speed: int = 100

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * speed * delta
	
	play_animation()
	move_and_slide()

func play_animation():
	var anim = $AnimatedSprite2D
	if direction:
		anim.flip_h = direction.x > 0

		if direction.x != 0:
			anim.animation = 'left'
		else:
			anim.animation = 'top' if direction.y < 0 else 'down'
	else:
		anim.frame = 0
