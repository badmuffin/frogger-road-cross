extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")
var score: int
var is_game_over := false

func _on_finish_area_body_entered(_body: Node2D) -> void:
	if is_game_over:
		return

	is_game_over = true
	if Global.score == 0 or score < Global.score:
		Global.score = score
	call_deferred("change_scene")

func change_scene():
	if not is_inside_tree():
		return

	get_tree().change_scene_to_file("res://scenes/title.tscn")

func _on_car_timer_timeout() -> void:
	if is_game_over:
		return

	var car: Area2D = car_scene.instantiate()
	
	var car_spawer_pos: Marker2D = $CarSpawner.get_children().pick_random()
	car.position = car_spawer_pos.position
	
	$Object.add_child(car)
	car.body_entered.connect(go_to_title)
	
func go_to_title(_body: Node2D):
	if is_game_over:
		return
	
	is_game_over = true
	call_deferred("change_scene")

func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = "time: " + str(score)
