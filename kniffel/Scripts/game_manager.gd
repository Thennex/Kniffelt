extends Node2D

signal menuClosed
signal menuOpened


#region Variables for Paths
############################################################
#####                   Path linking                   #####
############################################################
@onready var selectsfx: AudioStreamPlayer = $"../SelectSFX"
@onready var countersfx: AudioStreamPlayer = $"../CounterSFX"
@onready var settingsmanager: Control = $"../SettingsMenu"
@onready var end_menu: Control = $"../EndMenu"
@onready var menu: VBoxContainer = $"../Menu/VBoxContainer"
@onready var shortcutoverlay: Control = $"../ShowControls"
@onready var dicesfx: AudioStreamPlayer = $"../diceSFX"
@onready var dicesfxtimer: Timer = $"../diceSFX/diceSFXTimer"
@onready var kniffelpaper: Node2D = $"../Kniffel_paper"


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

###################################
#####   Variables for Dices   #####
###################################
var dice_locked = preload("uid://camxcabkvly8k") 
var dice_unlocked = preload("uid://bxywxlj5wl2te")
var d1 = 0 
var d2 = 0
var d3 = 0
var d4 = 0
var d5 = 0
var diceValues = [0, 0, 0, 0, 0, 0,]
@onready var sDices = [sd1, sd2 , sd3, sd4, sd5]
var dices = [d1, d2 , d3, d4, d5]
var dice_count = 5
@export var max_throw_count = 3
var throw_count = 0
var locked_slot = [false, false, false, false, false]

var can_throw = true


#####################################
#####   Variables for Showers   #####
#####################################
var changeDieMemory = 1
var small_straight_memory = 1
var big_straight_memory = 1

####################################
#####   Variables for Points   #####
####################################
@onready var all_points = 0
@onready var bonus_points = 0
@onready var top_points_counter = 0
@onready var bottom_points_counter = 0
@onready var point_array: Array = [top_points_counter, bottom_points_counter, bonus_points, all_points]

###################################
#####   Variables for Bonus   #####
###################################
var has_bonus = false
@export var bonus_treashold = 63
@export var bonus_amount = 35 

######################################
#####   Variables for Upgrades   #####
######################################
var pickedUpgrades : Array = []

#################################
#####   Variables for End   #####
#################################
var done = 0

####################################
#####   Variables for Design   #####
####################################
var color_values = [Color(0.7, 0.7, 0.0), Color(0.0, 0.7, 0.0), Color(0.0, 0.7, 0.7), Color(0.0, 0.604, 1.0), Color(0.7, 0.0, 0.7), Color(0.7, 0.0, 0.0)]
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
	await $"../Kniffel_paper".ready
	changeShowers()

func setColor() -> void:
	for i in sDices.size():
		sDices[i - 1].modulate = color_values[int(ld_array[i - 1].text) - 1]

func set_DiceColors() -> void:
	for i in kniffelpaper.dcolor_array.size():
		kniffelpaper.dcolor_array[i - 1].modulate = color_values[i - 1]

func changeShowers() -> void:
	for i in kniffelpaper.lx3d_array.size():
		kniffelpaper.lx3d_array[i - 1].text = str(changeDieMemory)
	for i in kniffelpaper.lx4d_array.size():
		kniffelpaper.lx4d_array[i - 1].text = str(changeDieMemory)
	for i in kniffelpaper.lkniffel_array.size():
		kniffelpaper.lkniffel_array[i - 1].text = str(changeDieMemory)
	for i in kniffelpaper.lchance_array.size():
		kniffelpaper.lchance_array[i - 1].text = str(rng())
	kniffelpaper.lsmallstraightd1.text = str(small_straight_memory)
	kniffelpaper.lsmallstraightd2.text = str(small_straight_memory + 1)
	kniffelpaper.lsmallstraightd3.text = str(small_straight_memory + 2)
	kniffelpaper.lsmallstraightd4.text = str(small_straight_memory + 3)
	if small_straight_memory == 3:
		small_straight_memory = 1
	else:
		small_straight_memory += 1
	kniffelpaper.lbigstraightd1.text = str(big_straight_memory)
	kniffelpaper.lbigstraightd2.text = str(big_straight_memory + 1)
	kniffelpaper.lbigstraightd3.text = str(big_straight_memory + 2)
	kniffelpaper.lbigstraightd4.text = str(big_straight_memory + 3)
	kniffelpaper.lbigstraightd5.text = str(big_straight_memory + 4)
	if big_straight_memory == 1:
		big_straight_memory = 2
	else:
		big_straight_memory = 1
	kniffelpaper.lfullhoused1.text = str(changeDieMemory)
	kniffelpaper.lfullhoused2.text = str(changeDieMemory)
	kniffelpaper.lfullhoused3.text = str(changeDieMemory)
	if changeDieMemory != 6:
		changeDieMemory +=1
	else:
		changeDieMemory = 1
	kniffelpaper.lfullhoused4.text = str(changeDieMemory)
	kniffelpaper.lfullhoused5.text = str(changeDieMemory)

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
			for i in dice_count:
				if locked_slot[i] == false:
					dicesfx.playing = false
					dicesfx.volume_db = -5
					var sfxPitch = 5.0
					if throw_count == 1:
						dicesfx.pitch_scale = 1.0 + (sfxPitch/10.0)
					elif throw_count == 2:
						dicesfx.pitch_scale = 1.0 + (sfxPitch/100.0)
					else:
						dicesfx.pitch_scale = 1.0 + (sfxPitch/5000.0)
					dicesfx.play()
					$"../ExtraDiceSFX/extraDiceSFXTimer".start()
					dicesfxtimer.start()
					dices[i - 1] = rng()
					choseDie(i)
					await get_tree().create_timer(0.1).timeout
			await get_tree().create_timer(.3).timeout
			kniffelpaper.checkTopActionsPoints()
			kniffelpaper.checkBottomActionsPoints()

func delayDice(die_slot) -> int:
	return (dices[die_slot - 1] - 6)

func set_d1(die_value):
	if die_value < 0:
		die_value *= -1
	ld1.text = str(die_value)
	var tween = create_tween()
	tween.tween_property(sd1, "modulate", color_values[die_value - 1], 0.2)
func set_d2(die_value):
	if die_value < 0:
		die_value *= -1
	ld2.text = str(die_value)
	var tween = create_tween()
	tween.tween_property(sd2, "modulate", color_values[die_value - 1], 0.2)
func set_d3(die_value):
	if die_value < 0:
		die_value *= -1
	ld3.text = str(die_value)
	var tween = create_tween()
	tween.tween_property(sd3, "modulate", color_values[die_value - 1], 0.2)
func set_d4(die_value):
	if die_value < 0:
		die_value *= -1
	ld4.text = str(die_value)
	var tween = create_tween()
	tween.tween_property(sd4, "modulate", color_values[die_value - 1], 0.2)
func set_d5(die_value):
	if die_value < 0:
		die_value *= -1
	ld5.text = str(die_value)
	var tween = create_tween()
	tween.tween_property(sd5, "modulate", color_values[die_value - 1], 0.2)
var setd_array : Array = [set_d1, set_d2, set_d3, set_d4, set_d5]

func choseDie(die) -> void:
	var duration = 0.4
	var tween = create_tween()
	tween.tween_method(setd_array[die].call, delayDice(die), dices[die - 1], duration).set_trans(Tween.TRANS_QUAD)

func rng() -> int:
	return(RandomNumberGenerator.new().randi_range(1,6))

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
		sDices[i - 1].icon = dice_unlocked

func areAllLocked() -> bool:
	for i in dice_count:
		if locked_slot[i - 1] == false:
			return false
	return true


################################
#####    Action Methods    #####
################################ 


#############################
#####    End Methods    #####
#############################
func reset() -> void:
	all_points = 0
	top_points_counter = 0
	bottom_points_counter = 0
	has_bonus = false
	done = 0




#################################
#####    Upgrade Methods    #####
#################################
func allDiceCounted() -> int:
	var dice_value = 0
	for i in dice_count:
		dice_value += dices[i]
	return dice_value

func times2(value) -> int:
	return value*2

func plus(value) -> int:
	return value + 5

################################
#####    Action Methods    #####
################################




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
		sd1.icon = dice_locked
	else:
		sd1.icon = dice_unlocked

func _on_d_2_toggled(toggled_on: bool) -> void:
	locked_slot[1] = toggled_on
	selectsfx.play()
	if toggled_on:
		sd2.icon = dice_locked
	else:
		sd2.icon = dice_unlocked

func _on_d_3_toggled(toggled_on: bool) -> void:
	locked_slot[2] = toggled_on
	selectsfx.play()
	if toggled_on:
		sd3.icon = dice_locked
	else:
		sd3.icon = dice_unlocked

func _on_d_4_toggled(toggled_on: bool) -> void:
	locked_slot[3] = toggled_on
	selectsfx.play()
	if toggled_on:
		sd4.icon = dice_locked
	else:
		sd4.icon = dice_unlocked

func _on_d_5_toggled(toggled_on: bool) -> void:
	locked_slot[4] = toggled_on
	selectsfx.play()
	if toggled_on:
		sd5.icon = dice_locked
	else:
		sd5.icon = dice_unlocked
#endregion

#endregion

#region --> Game relevant Actions
##############################
#####    Select Action    #####
###############################




####################################
#####    Select Dice Action    #####
####################################
func _on_roll_dice_button_pressed() -> void:
	throwDices()

func _on_unlock_all_button_pressed() -> void:
	resetLocked()
#endregion 


##############################
#####    Shower Timer    #####
##############################
func _on_timer_timeout() -> void:
	changeShowers() 

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
		menu.visible = true
		menuOpened.emit()

func _on_menu_closer_pressed() -> void:
		$"../Menu/ColorRect".visible = false
		$"../Menu/MenuCloser".visible = false
		menu.visible = false
		menuClosed.emit()

func _on_reload_button_pressed() -> void:
	selectsfx.play()
	get_tree().change_scene_to_file("res://Scene/main.tscn")

func _on_control_button_pressed() -> void:
	selectsfx.play()
	if settingsmanager.visible:
		settingsmanager.visible = false
		menuClosed.emit()
	else:
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
	get_tree().quit()

###########################
#####    SFX Timer    #####
###########################
func _on_dice_sfx_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property(dicesfx, "volume_db", -60, .3)
	await get_tree().create_timer(.3).timeout
	dicesfx.stop()

func _on_extra_dice_sfx_timer_timeout() -> void:
		$"../ExtraDiceSFX".play()

#############################
#####    Extra Timer    #####
#############################


################################
#####    Manual Signals    #####
################################
func _on_settings_menu_change_color(array: Variant) -> void:
	color_values = array
	setColor()

func _on_settings_menu_show_controls(show_controls: Variant) -> void:
	shortcutoverlay.visible = show_controls
	selectsfx.play()


func _on_can_throw_timer_timeout() -> void:
	can_throw = true

func _on_upgrade_menu_selected_upgrade(upgrade: Variant) -> void:
	pickedUpgrades.append(upgrade)
	print(pickedUpgrades)
