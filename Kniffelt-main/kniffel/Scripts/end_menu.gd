extends Control

@onready var gamemanager: Node2D = $"../GameManager"
@onready var kniffelpaper: Node2D = $"../Kniffel_paper"
@onready var dicemanager: Control = $"../dice_manager"

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

const kniffelpaperscene : PackedScene = preload("uid://bux05u53jlkja")

var what_die : int = 0

func _ready() -> void:
	for i in diceColor_array.size():
		diceColor_array[i].modulate = gamemanager.color_values[i]



func setChangeLabel(value):
	lthrown_array[what_die].text = str(value)

func changeStatlabel(ncounter_array : Array) -> void:
	for i in ncounter_array.size():
		what_die = i
		var anim_tween = create_tween()
		anim_tween.tween_method(setChangeLabel, 0, ncounter_array[i], .2)
		await anim_tween.finished

func _on_button_pressed() -> void:
	var tmp_array : Array = get_tree().get_nodes_in_group("Kniffelpaper")
	for i in tmp_array.size():
		tmp_array[i - 1].queue_free()
	var Kniffel_paper = kniffelpaperscene.instantiate()
	kniffelpaper = Kniffel_paper
	dicemanager.kniffelpaper = Kniffel_paper
	$"..".add_child(Kniffel_paper)
	Kniffel_paper.add_to_group("Kniffelpaper")
	Kniffel_paper.add_to_group("persistent")
	gamemanager.kniffelpaper = Kniffel_paper
	Kniffel_paper.z_index = 3
	visible = false
	kniffelpaper.reset()
