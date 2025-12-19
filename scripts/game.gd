extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")
var score: int = 0

func _on_finish_area_body_entered(_body: Node2D) -> void:
	call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://scenes/title.tscn")

func _on_car_timer_timeout() -> void:
	var car: Area2D = car_scene.instantiate()
	
	var car_spawer_pos: Marker2D = $CarSpawner.get_children().pick_random()
	car.position = car_spawer_pos.position
	
	$Object.add_child(car)
	car.connect("body_entered", go_to_title)
	
func go_to_title(_body: Node2D):
	call_deferred("change_scene")

func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = "time: " + str(score)
