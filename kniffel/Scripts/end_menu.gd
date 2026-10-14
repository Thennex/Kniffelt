extends Control

@onready var endmenu: Control = $"."
@onready var gamemanager: Node2D = $"../GameManager"

@onready var lthrown1: Label = $Stats/Lthrown1s
@onready var lthrown2: Label = $Stats/Lthrown2s
@onready var lthrown3: Label = $Stats/Lthrown3s
@onready var lthrown4: Label = $Stats/Lthrown4s
@onready var lthrown5: Label = $Stats/Lthrown5s
@onready var lthrown6: Label = $Stats/Lthrown6s
@onready var lthrown_array : Array = [lthrown1, lthrown2, lthrown3, lthrown4, lthrown5, lthrown6]

@onready var diceColor1: Sprite2D = $KniffelDiceReworked
@onready var diceColor2: Sprite2D = $KniffelDiceReworked2
@onready var diceColor3: Sprite2D = $KniffelDiceReworked3
@onready var diceColor4: Sprite2D = $KniffelDiceReworked4
@onready var diceColor5: Sprite2D = $KniffelDiceReworked5
@onready var diceColor6: Sprite2D = $KniffelDiceReworked6
@onready var diceColor_array : Array = [diceColor1, diceColor2, diceColor3, diceColor4, diceColor5, diceColor6]

# Called when the nodenters the scene tree for the first time.
func _ready() -> void:
	for i in diceColor_array.size():
		diceColor_array[i].modulate = gamemanager.color_values[i]

const kniffelpaper = preload("uid://bux05u53jlkja")

func changeStatlabel() -> void:
	var ncounter: Array = gamemanager.number_counter_array
	for i in ncounter.size():
		lthrown_array[i].text = str(ncounter[i])

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
