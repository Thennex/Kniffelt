extends Control

signal selectedUpgrade(upgrade)

@onready var l1: Label = $Menu/Slot1_button/Label
@onready var l2: Label = $Menu/Slot2_button/Label2
@onready var l3: Label = $Menu/Slot3_button/Label3

@onready var label_array : Array = [l1, l2, l3]

var upgrade_selection_array : Array = []
var shuffle_array : Array = []
var probability_array : Array = [5, 3, 2]
var upgrade_dict = {
	0 : "plus",
	1 : "times2",
	2 : "counted",
	3 : ""
}

func generate_update() -> void:
	for i in 3:
		shuffleUpgrades()
		var tmp = chooseUpgrade()
		label_array[i - 1].text = tmp
		upgrade_selection_array.append(tmp)

func rng(min_num, max_num) -> int:
	return(randi_range(min_num, max_num))

func chooseUpgrade() -> String:
	return(shuffle_array[rng(0, shuffle_array.size()-1)])

func shuffleUpgrades() -> void:
	for i in probability_array.size():
		for j in probability_array[i-1]:
			shuffle_array.append(upgrade_dict[i])
	shuffle_array.shuffle()


func _ready() -> void:
	generate_update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_slot_1_button_pressed() -> void:
	selectedUpgrade.emit(upgrade_selection_array[0])
	generate_update()


func _on_slot_2_button_pressed() -> void:
	selectedUpgrade.emit(upgrade_selection_array[1])
	generate_update()


func _on_slot_3_button_pressed() -> void:
	selectedUpgrade.emit(upgrade_selection_array[2])
	generate_update()
