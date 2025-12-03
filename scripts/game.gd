extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")

func _on_finish_area_body_entered(body: Node2D) -> void:
	print(body)
	print('has entered')

func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate()
	car.position = Vector2(300, 250)
	$Object.add_child(car)
