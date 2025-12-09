extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")

func _on_finish_area_body_entered(body: Node2D) -> void:
	print(body)
	print('has entered')

func _on_car_timer_timeout() -> void:
	var car: Area2D = car_scene.instantiate()
	
	var car_spawer_pos: Marker2D = $CarSpawner.get_children().pick_random()
	car.position = car_spawer_pos.position
	
	$Object.add_child(car)
	car.connect("body_entered", go_to_title)
	
func go_to_title(_body: Node2D):
	print("Player collision")
