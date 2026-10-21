extends Node2D

signal menuClosed
signal menuOpened


#region Variables for Paths
############################################################
#####                   Path linking                   #####
############################################################
@onready var selectsfx: AudioStreamPlayer = $"../SelectSFX"
@onready var countersfx: AudioStreamPlayer = $"../CounterSFX"
@onready var settingsmanager: Control = %SettingsMenu
@onready var end_menu: Control = $"../EndMenu"
@onready var menu: VBoxContainer = $"../Menu/VBoxContainer"
@onready var upgrademenu: Control = $"../UpgradeMenu"
@onready var shortcutoverlay: Control = $"../ShowControls"
@onready var dicesfx: AudioStreamPlayer = $"../diceSFX"
@onready var dicesfxtimer: Timer = $"../diceSFX/diceSFXTimer"
@onready var kniffelpaper: Node2D = $"../Kniffel_paper"
@onready var camera: Camera2D = $"../Camera2D"


########################
#####  Background  #####
########################
@onready var scrollingbg: Sprite2D = $"../Design/Parallax2D/scrollingbg"


####################
#####  Buttons #####
####################
@onready var sd1: Button = $"../Dices/DiceContainer/D1"
@onready var sd2: Button = $"../Dices/DiceContainer/D2"
@onready var sd3: Button = $"../Dices/DiceContainer/D3"
@onready var sd4: Button = $"../Dices/DiceContainer/D4"
@onready var sd5: Button = $"../Dices/DiceContainer/D5"

####################
#####  Labels  #####
####################

###########################
#####  change Labels  #####
###########################
@onready var ld1: Label = $"../Dices/DiceContainer/D1/D1Label"
@onready var ld2: Label = $"../Dices/DiceContainer/D2/D2Label"
@onready var ld3: Label = $"../Dices/DiceContainer/D3/D3Label"
@onready var ld4: Label = $"../Dices/DiceContainer/D4/D4Label"
@onready var ld5: Label = $"../Dices/DiceContainer/D5/D5Label"
@onready var ld_array : Array = [ld1, ld2, ld3, ld4, ld5]

@onready var lrolldice: Label = $"../Dices/RollDiceButton/RollDiceLabel"

#endregion

#region VARIABLES
########################################################################
#####                           Variables                          #####
########################################################################

@onready var d1locked: Sprite2D = $"../Dices/DiceContainer/D1/KniffelDiceLocked"
@onready var d2locked: Sprite2D = $"../Dices/DiceContainer/D2/KniffelDiceLocked"
@onready var d3locked: Sprite2D = $"../Dices/DiceContainer/D3/KniffelDiceLocked"
@onready var d4locked: Sprite2D = $"../Dices/DiceContainer/D4/KniffelDiceLocked"
@onready var d5locked: Sprite2D = $"../Dices/DiceContainer/D5/KniffelDiceLocked"
@onready var dlocked_array: Array = [d1locked, d2locked, d3locked, d4locked, d5locked]


#################################################
#####   Variables for upgrading the Dices   #####
#################################################
#variables for changing dice Values per side
@export var d1_sides : Array = [1, 2, 3, 4, 5, 6]
@export var d2_sides : Array = [1, 2, 3, 4, 5, 6]
@export var d3_sides : Array = [1, 2, 3, 4, 5, 6]
@export var d4_sides : Array = [1, 2, 3, 4, 5, 6]
@export var d5_sides : Array = [1, 2, 3, 4, 5, 6]
var d_sides_array : Array = [d1_sides, d2_sides, d3_sides, d4_sides, d5_sides] 

@export var d1_upgraded_sides : Array = [0, 0, 0, 0, 0, 0]
@export var d2_upgraded_sides : Array = [0, 0, 0, 0, 0, 0]
@export var d3_upgraded_sides : Array = [0, 0, 0, 0, 0, 0]
@export var d4_upgraded_sides : Array = [0, 0, 0, 0, 0, 0]
@export var d5_upgraded_sides : Array = [0, 0, 0, 0, 0, 0]
var d_upgraded_sides_array : Array = [d1_upgraded_sides, d2_upgraded_sides, d3_upgraded_sides, d4_upgraded_sides, d5_upgraded_sides]

###################################
#####   Variables for Dices   #####
###################################
var dice_locked = preload("uid://camxcabkvly8k") 
var dice_unlocked = preload("uid://bxywxlj5wl2te")

var d1 : int = 0 
var d2 : int = 0
var d3 : int = 0
var d4 : int = 0
var d5 : int = 0
var diceValues : Array = [0, 0, 0, 0, 0, 0,]
@onready var sDices : Array = [sd1, sd2 , sd3, sd4, sd5]
var dices : Array = [d1, d2 , d3, d4, d5]
@export var max_throw_count : int = 3
var throw_count : int = 0
var locked_slot : Array = [false, false, false, false, false]
var can_throw : bool = true

######################################
#####   Variables for Upgrades   #####
######################################
var pickedUpgrades : Array = []


####################################
#####   Variables for Reload   #####
####################################
const kniffelpaper_node : PackedScene = preload("uid://bux05u53jlkja")

####################################
#####   Variables for Design   #####
####################################
var color_values : Array = [Color(0.7, 0.7, 0.0), Color(0.0, 0.7, 0.0), Color(0.0, 0.7, 0.7), Color(0.0, 0.604, 1.0, 1.0), Color(0.7, 0.0, 0.7), Color(0.7, 0.0, 0.0)]
#endregion

#region METHODS
#######################################################################
#####                           Methods                           #####
#######################################################################

################################
#####   Methods for calc   #####
################################r
func _ready() -> void:
	setColor()
	resetDice()
	await $"..".ready
	load_game()

#######################################################################
#####       funcs for the saving and loading the whole game       #####
#######################################################################
func save_game():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("persistent")
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			continue
		# Check if the node has a save function.
		if !node.has_method("save"):
			continue
		
		# Call the node's save function.
		var node_data = node.call("save")

		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(node_data)

		# Store the save dictionary as a new line in the save file.
		save_file.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return 
	var save_nodes = get_tree().get_nodes_in_group("persistent")
	for node in save_nodes:
		node.queue_free()

	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		var node_data = json.data

		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.add_to_group("persistent")
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
		
		match node_data["filename"]:
			"res://Scene/settings_menu.tscn":
				settingsmanager = new_object
				settingsmanager.load_audio()
			"res://Scene/Kniffel_paper.tscn":
				kniffelpaper = new_object
				kniffelpaper.loadPaper()
			"res://Scene/upgrade_menu.tscn":
				upgrademenu = new_object

#######################################################################
#####                   funcs for the throwing                    #####
#######################################################################
func setColor() -> void:
	for i in sDices.size():
		sDices[i - 1].self_modulate = color_values[int(ld_array[i - 1].text) - 1]

func set_DiceColors() -> void:
	for i in kniffelpaper.dcolor_array.size():
		kniffelpaper.dcolor_array[i - 1].modulate = color_values[i - 1]

func throwDices() -> void:
	if can_throw && !areAllLocked():
		can_throw = false
		$"../canThrowTimer".start()
		selectsfx.play()
		if throw_count == 0:
			resetLocked()
		if throw_count < max_throw_count:
			throw_count += 1
			lrolldice.text = str("Roll Dice (", max_throw_count - throw_count, ")")
			for i in dices.size():
				if locked_slot[i] == false:
					dicesfx.playing = false
					dicesfx.volume_db = -5
					var sfxPitch = 5.0
					if throw_count == 1:
						dicesfx.pitch_scale = 1.0 + (sfxPitch/1000.0)
					elif throw_count == 2:
						dicesfx.pitch_scale = 1.0 + (sfxPitch/200.0)
					else:
						dicesfx.pitch_scale = 1.0 + (sfxPitch/100.0)
					dicesfx.play()
					selectsfx.play()
					$"../ExtraDiceSFX/extraDiceSFXTimer".start()
					dicesfxtimer.start()
					dices[i - 1] = rng(i)
					choseDie(i)
					$"../endRollSound".play()
					await get_tree().create_timer(0.1).timeout
			kniffelpaper.checkTopActionsPoints()
			kniffelpaper.checkBottomActionsPoints()

func delayDice(die_slot) -> int:
	return (dices[die_slot - 1] - 6)

func set_d1(die_value):
	if die_value < 0:
		die_value *= -1
	ld1.text = str(die_value)
	var tween = create_tween()
	var tween_of = create_tween()
	tween_of.tween_property(sd1, "offset_transform_position", Vector2(0, -2), .05).set_trans(Tween.TRANS_BOUNCE)
	tween_of.chain().tween_property(sd1, "offset_transform_position", Vector2(0, 0), .2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(sd1, "self_modulate", color_values[die_value - 1], 0.2)
func set_d2(die_value):
	if die_value < 0:
		die_value *= -1
	ld2.text = str(die_value)
	var tween = create_tween()
	var tween_of = create_tween()
	tween_of.tween_property(sd2, "offset_transform_position", Vector2(0, -2), .05).set_trans(Tween.TRANS_BOUNCE)
	tween_of.chain().tween_property(sd2, "offset_transform_position", Vector2(0, 0), .2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(sd2, "self_modulate", color_values[die_value - 1], 0.2)
func set_d3(die_value):
	if die_value < 0:
		die_value *= -1
	ld3.text = str(die_value)
	var tween = create_tween()
	var tween_of = create_tween()
	tween_of.tween_property(sd3, "offset_transform_position", Vector2(0, -2), .05).set_trans(Tween.TRANS_BOUNCE)
	tween_of.chain().tween_property(sd3, "offset_transform_position", Vector2(0, 0), .2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(sd3, "self_modulate", color_values[die_value - 1], 0.2)
func set_d4(die_value):
	if die_value < 0:
		die_value *= -1
	ld4.text = str(die_value)
	var tween = create_tween()
	var tween_of = create_tween()
	tween_of.tween_property(sd4, "offset_transform_position", Vector2(0, -2), .05).set_trans(Tween.TRANS_BOUNCE)
	tween_of.chain().tween_property(sd4, "offset_transform_position", Vector2(0, 0), .2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(sd4, "self_modulate", color_values[die_value - 1], 0.2)
func set_d5(die_value):
	if die_value < 0:
		die_value *= -1
	ld5.text = str(die_value)
	var tween = create_tween()
	var tween_of = create_tween()
	tween_of.tween_property(sd5, "offset_transform_position", Vector2(0, -2), .05).set_trans(Tween.TRANS_BOUNCE)
	tween_of.chain().tween_property(sd5, "offset_transform_position", Vector2(0, 0), .2).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(sd5, "self_modulate", color_values[die_value - 1], 0.2)
var setd_array : Array = [set_d1, set_d2, set_d3, set_d4, set_d5]

func choseDie(die) -> void:
	var duration = 0.4
	var tween = create_tween()
	tween.tween_method(setd_array[die].call, delayDice(die), dices[die - 1], duration).set_trans(Tween.TRANS_QUAD)

func rng(die) -> int:
	var number = d_sides_array[die][RandomNumberGenerator.new().randi_range(1,6) - 1] 
	kniffelpaper.number_counter_array[number - 1] += 1
	return(number)

func resetDice() -> void:
	selectsfx.play()
	lrolldice.text = str("Roll Dice (", 3, ")")
	ld1.text = "D"
	ld2.text = "I"
	ld3.text = "C"
	ld4.text = "E"
	ld5.text = "S"
	dices = [0, 0, 0, 0, 0]
	d1 = 0
	d2 = 0
	d3 = 0
	d4 = 0
	d5 = 0
	resetLocked()
	throw_count = 0
	for i in kniffelpaper.l_array.size():
		if kniffelpaper.actions[i] == false:
			kniffelpaper.l_array[i].text = ""
	for i in kniffelpaper.lbottompoints_array.size():
		if kniffelpaper.buttom_actions[i] == false:
			kniffelpaper.lbottompoints_array[i].text = ""

func resetLocked() -> void:
	selectsfx.play()
	locked_slot = [false, false, false, false, false]
	for i in sDices.size():
		sDices[i - 1].button_pressed = false
		dlocked_array[i - 1].visible = false

func areAllLocked() -> bool:
	for i in dices.size():
		if locked_slot[i - 1] == false:
			return false
	return true


#############################
#####    End Methods    #####
#############################
func reset() -> void:
	kniffelpaper.number_counter_array = [0, 0, 0, 0, 0, 0]
	kniffelpaper.all_points = 0
	kniffelpaper.top_points_counter = 0
	kniffelpaper.bottom_points_counter = 0
	$"../Dices".visible = true
	$"../ShowControls".visible = true
	upgrademenu.visible = true
	kniffelpaper.done = 0
	resetDice()

func end():
	$"../Dices".visible = false
	$"../ShowControls".visible = false
	$"../UpgradeMenu".visible = false
	end_menu.changeStatlabel(kniffelpaper.number_counter_array)


#################################
#####    Upgrade Methods    #####
#################################
func allDiceCounted() -> int:
	var dice_value = 0
	for i in dices.size():
		dice_value += dices[i]
	return dice_value

func times2(value) -> int:
	return value*2

func plus(value) -> int:
	return value + 5

###############################
#####   keyboard compat   #####
###############################
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("unlockAll"):
		resetLocked()
	if Input.is_action_just_pressed("roll"):
		throwDices()
	if Input.is_action_just_pressed("D1_Lock"):
		if sd1.button_pressed == false:
			sd1.button_pressed = true
		else:
			sd1.button_pressed = false
	if Input.is_action_just_pressed("D2_Lock"):
		if sd2.button_pressed == false:
			sd2.button_pressed = true
		else:
			sd2.button_pressed = false
	if Input.is_action_just_pressed("D3_Lock"):
		if sd3.button_pressed == false:
			sd3.button_pressed = true
		else:
			sd3.button_pressed = false
	if Input.is_action_just_pressed("D4_Lock"):
		if sd4.button_pressed == false:
			sd4.button_pressed = true
		else:
			sd4.button_pressed = false
	if Input.is_action_just_pressed("D5_Lock"):
		if sd5.button_pressed == false:
			sd5.button_pressed = true
		else:
			sd5.button_pressed = false



#region --> Lock Dices   

func _on_d_1_toggled(toggled_on: bool) -> void:
	locked_slot[0] = toggled_on
	selectsfx.play()
	if toggled_on:
		dlocked_array[0].visible = true
		ld_array[0].modulate = Color.BLACK
	else:
		dlocked_array[0].visible = false
		ld_array[0].modulate = "a4a4a4"

func _on_d_2_toggled(toggled_on: bool) -> void:
	locked_slot[1] = toggled_on
	selectsfx.play()
	if toggled_on:
		dlocked_array[1].visible = true
		ld_array[1].modulate = Color.BLACK
	else:
		dlocked_array[1].visible = false
		ld_array[1].modulate = "a4a4a4"


func _on_d_3_toggled(toggled_on: bool) -> void:
	locked_slot[2] = toggled_on
	selectsfx.play()
	if toggled_on:
		dlocked_array[2].visible = true
		ld_array[2].modulate = Color.BLACK
	else:
		dlocked_array[2].visible = false
		ld_array[2].modulate = "a4a4a4"

func _on_d_4_toggled(toggled_on: bool) -> void:
	locked_slot[3] = toggled_on
	selectsfx.play()
	if toggled_on:
		dlocked_array[3].visible = true
		ld_array[3].modulate = Color.BLACK
	else:
		dlocked_array[3].visible = false
		ld_array[3].modulate = "a4a4a4"

func _on_d_5_toggled(toggled_on: bool) -> void:
	locked_slot[4] = toggled_on
	selectsfx.play()
	if toggled_on:
		dlocked_array[4].visible = true
		ld_array[4].modulate = Color.BLACK
	else:
		dlocked_array[4].visible = false
		ld_array[4].modulate = "a4a4a4"
#endregion


#region --> Throwing dice relevant Actions
####################################
#####    Select Dice Action    #####
####################################
func _on_roll_dice_button_pressed() -> void:
	throwDices()

func _on_unlock_all_button_pressed() -> void:
	resetLocked()
#endregion 

#endregion


#region Menu Button signals
###############################
#####    Menu Buttons     #####
###############################
func _on_open_menu_button_pressed() -> void:
	selectsfx.play()
	if menu.visible:
		settingsmanager.visible = false
		$"../Menu/ColorRect".visible = false
		$"../Menu/MenuCloser".visible = false
		menu.visible = false
		menuClosed.emit()
	else:
		$"../Menu/ColorRect".visible = true
		$"../Menu/MenuCloser".visible = true
		settingsmanager.visible = false
		menu.visible = true
		menuOpened.emit()

func _on_menu_closer_pressed() -> void:
		selectsfx.play()
		$"../Menu/ColorRect".visible = false
		$"../Menu/MenuCloser".visible = false
		menu.visible = false
		menuClosed.emit()

func _on_reload_button_pressed() -> void:
	selectsfx.play()
	var tmp_array : Array = get_tree().get_nodes_in_group("Kniffelpaper")
	for i in tmp_array.size():
		tmp_array[i - 1].queue_free()
	var Kniffel_paper = kniffelpaper_node.instantiate()
	$"..".add_child(Kniffel_paper)
	Kniffel_paper.add_to_group("Kniffelpaper")
	Kniffel_paper.add_to_group("persistent")
	kniffelpaper = Kniffel_paper
	Kniffel_paper.z_index = 3
	$"../EndMenu".visible = false
	reset()
	$"../Menu/VBoxContainer".visible = false
	$"../Menu/ColorRect".visible = false

func _on_control_button_pressed() -> void:
	selectsfx.play()
	if settingsmanager.visible:
		settingsmanager.visible = false
		menuClosed.emit()
	else:
		menu.visible = false
		$"../Menu/MenuCloser".visible = false
		settingsmanager.visible = true
		menuOpened.emit()

func _on_control_button_2_pressed() -> void:
	selectsfx.play()
	if menu.visible:
		$"../Menu/ColorRect".visible = false
		$"../Menu/MenuCloser".visible = false
		menu.visible = false
	else:
		$"../Menu/ColorRect".visible = true
		$"../Menu/MenuCloser".visible = true
		menu.visible = true

func _on_close_game_button_pressed() -> void:
	selectsfx.play()
	save_game()
	get_tree().quit()
#endregion 

#region Sfx Timer signal timeout
###########################
#####    SFX Timer    #####
###########################
func _on_dice_sfx_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property(dicesfx, "volume_db", -60, .3)
	await tween.finished
	dicesfx.stop()

func _on_extra_dice_sfx_timer_timeout() -> void:
		$"../ExtraDiceSFX".play()
#endregion

#############################
#####    Extra Timer    #####
#############################
func _on_can_throw_timer_timeout() -> void:
	can_throw = true

#region manually created Signals
################################
#####    Manual Signals    #####
################################
func _on_settings_menu_change_color(array: Variant) -> void:
	color_values = array
	setColor()

func _on_settings_menu_show_controls(show_controls: Variant) -> void:
	shortcutoverlay.visible = show_controls
	selectsfx.play()


func _on_upgrade_menu_selected_upgrade(upgrade: Variant) -> void:
	pickedUpgrades.append(upgrade)
	print(pickedUpgrades)
#endregion
