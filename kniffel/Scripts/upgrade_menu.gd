extends Control

signal selectedUpgrade(upgrade)

@onready var l1: Label = $Menu/Slot1_button/Label
@onready var l2: Label = $Menu/Slot2_button/Label2
@onready var l3: Label = $Menu/Slot3_button/Label3

@onready var button1: Button = $Menu/Slot1_button
@onready var button2: Button = $Menu/Slot2_button
@onready var button3: Button = $Menu/Slot3_button
@onready var button_array: Array = [button1, button2, button3]

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
	upgrade_selection_array.clear()
	for i in 3:
		shuffleUpgrades()
		var tmp = chooseUpgrade()
		label_array[i].text = tmp
		upgrade_selection_array.append(tmp)


func chooseUpgrade() -> String:
	return(shuffle_array.pick_random())

func shuffleUpgrades() -> void:
	for i in probability_array.size():
		for j in probability_array[i-1]:
			shuffle_array.append(upgrade_dict[i])
	shuffle_array.shuffle()

func mouseBehavior() -> void:
	if button_array[0].mouse_filter == 2:
		for i in button_array.size():
			button_array[i].mouse_filter = 0
	else:
		for i in button_array.size():
			button_array[i].mouse_filter = 2

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


func _on_settings_menu_menu_closed() -> void:
	$"../Menu/VBoxContainer".visible = false
	$"../Menu/ColorRect".visible = false
	for i in button_array.size():
			button_array[i].mouse_filter = 0

func _on_game_manager_menu_closed() -> void:
	mouseBehavior()

func _on_game_manager_menu_opened() -> void:
	for i in button_array.size():
			button_array[i].mouse_filter = 2
