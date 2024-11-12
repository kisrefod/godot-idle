extends Sprite2D


var speed = 400

func move(distance: float) -> void:
		self.position += Vector2(distance, 0)

func _process(delta: float) -> void:
	var distance = speed * delta
	move(distance)

func _on_energyunit_area_entered(area: Area2D) -> void:
	if area.name.contains("gate-slider"):
		self.queue_free()
	elif area.name.contains("steam-end"):
		self.queue_free()
