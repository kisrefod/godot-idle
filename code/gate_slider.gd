extends Node2D

@onready var top_wall = $"../../top-wall"
@onready var bottom_wall = $"../../bottom-wall"
@onready var score = $"../../../../score"

enum directions {up, down};
var direction = directions.down

var speed = 100

func move(distance: float) -> void:
	if direction == directions.up:
		self.position -= Vector2(0, distance)
	elif direction == directions.down:
		self.position += Vector2(0, distance)

func _process(delta: float) -> void:
	var distance = speed * delta
	move(distance)

func update_score(num: int) -> void:
	score.find_child("score_label").text = str(num)

func energy_touch(area: Area2D) -> void:
	Clicker.score += 1
	update_score(Clicker.score)
	area.queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area ==  bottom_wall:
		direction = directions.up
	elif area == top_wall:
		self.queue_free()
	elif area.name.contains("energy-unit"):
		energy_touch(area)
