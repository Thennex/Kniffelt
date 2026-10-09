extends Control

@onready var endmenu: Control = $"."
@onready var gamemanager: Node2D = $"../GameManager"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

const kniffelpaper = preload("uid://bux05u53jlkja")

func _on_button_pressed() -> void:
	var tmp_array : Array = get_tree().get_nodes_in_group("Kniffelpaper")
	for i in tmp_array.size():
		tmp_array[i - 1].queue_free()
	var Kniffel_paper = kniffelpaper.instantiate()
	$"..".add_child(Kniffel_paper)
	Kniffel_paper.add_to_group("Kniffelpaper")
	gamemanager.kniffelpaper = Kniffel_paper
	Kniffel_paper.z_index = 3
	endmenu.visible = false
	gamemanager.reset()
