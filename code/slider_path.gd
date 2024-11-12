extends Control

const gate_slider_path = "res://scenes/gate_slider.tscn"
const slider_node = preload(gate_slider_path)

func create_slider() -> void:
	var slider = slider_node.instantiate()
	add_child(slider, true)

func _on_energybtn_pressed() -> void:
	create_slider()
