extends Control

const energy_unit_path = "res://scenes/energy_unit.tscn"
const energy_unit_node = preload(energy_unit_path)

var energy_frequency = 100;

func get_random_y() -> float:
	return randf_range(15., 225.)

func create_energy_unit() -> void:
	var energy_unit = energy_unit_node.instantiate()
	var spawn_y = get_random_y()
	energy_unit.position = Vector2(15, spawn_y)
	add_child(energy_unit, true)

func _on_steamtimer_timeout() -> void:
	create_energy_unit()
