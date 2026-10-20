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

@onready var deckanimator: AnimationPlayer = $Menu/CardDeck/DeckAnimator


var upgrade_selection_array : Array = []
var shuffle_array : Array = []


var rare_propability = .35
var legendary_propability = .15

var upgrade_probabilities_array : Array = [legendary_propability, rare_propability,]


#func save():
	#var save_dict = {
		#"filename" : get_scene_file_path(),
		#"parent" : get_parent().get_path(),
		#"pos_x" : position.x,
		#"pos_y" : position.y,
		#
	#}
	#return save_dict 


var common_probability_array : Array =    [10, 5, 1, 4, 3]
var rare_probability_array : Array =      [10, 5, 1, 4, 3]
var legendary_probability_array : Array = [10, 5, 1, 4, 3]
var probability_array : Array = [legendary_probability_array, rare_probability_array, common_probability_array]

var rarity_chosen : int = 2

var legendary_upgrade_dict : Dictionary  = {
	0 : "times2",
	1 : "times3",
	2 : "times4",
	3 : "6",
	4 : "5",
}

var rare_upgrade_dict : Dictionary  = {
	0 : "counted",
	1 : "counted2",
	2 : "counted3",
	3 : "4",
	4 : "3",
}

var common_upgrade_dict : Dictionary = {
	0 : "plus",
	1 : "plus+",
	2 : "plus++",
	3 : "2",
	4 : "1",
}


var upgrade_dict_array : Array = [legendary_upgrade_dict, rare_upgrade_dict, common_upgrade_dict]

func generate_update() -> void:
	upgrade_selection_array.clear()
	for i in 3:
		shuffleUpgrades()
		var tmp = chooseUpgrade()
		label_array[i].text = tmp
		upgrade_selection_array.append(tmp)
	playAnim()


func chooseUpgrade() -> String:
	return(shuffle_array.pick_random())


func chooseRarity() -> void:
	for i in upgrade_probabilities_array.size():
		if upgrade_probabilities_array[i] * 100 >= RandomNumberGenerator.new().randi_range(0, 100):
			rarity_chosen = i 
			return 
	rarity_chosen = 2
	return 

func shuffleUpgrades() -> void:
	chooseRarity()
	shuffle_array.clear()
	for i in upgrade_dict_array[rarity_chosen].size():
		for j in probability_array[rarity_chosen][i]:
				shuffle_array.append(upgrade_dict_array[rarity_chosen][i])


func mouseBehavior() -> void:
	if button_array[0].mouse_filter == 2:
		for i in button_array.size():
			button_array[i].mouse_filter = 0
	else:
		for i in button_array.size():
			button_array[i].mouse_filter = 2

func playAnim() -> void:
	deckanimator.play("RESET")
	await deckanimator.animation_finished
	deckanimator.play("upgrade3")
	await deckanimator.animation_finished
	deckanimator.play("upgrade2")
	await deckanimator.animation_finished
	deckanimator.play("upgrade1")


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
	$"../Menu/VBoxContainer".visible = true
	$"../Menu/ColorRect".visible = true
	for i in button_array.size():
			button_array[i].mouse_filter = 0

func _on_game_manager_menu_closed() -> void:
	mouseBehavior()

func _on_game_manager_menu_opened() -> void:
	mouseBehavior()
