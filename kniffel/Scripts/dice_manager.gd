extends Control

signal diceCounted(what_dice)

########################################################################
#####                        Links to Managers                     #####
########################################################################
@onready var kniffelpaper


########################################################################
#####                      Labels, SFX, Buttons                    #####
########################################################################
####################
#####    SFX   #####
####################
@onready var selectsfx: AudioStreamPlayer = $selectSFX
@onready var dicesfx: AudioStreamPlayer = $"diceSFX"
@onready var dicesfxtimer: Timer = $"diceSFX/diceSFXTimer"
@onready var endrollsfx: AudioStreamPlayer = $endRollSFX

####################
#####  Buttons #####
####################
@onready var sd1: Button = $"DiceContainer/D1"
@onready var sd2: Button = $"DiceContainer/D2"
@onready var sd3: Button = $"DiceContainer/D3"
@onready var sd4: Button = $"DiceContainer/D4"
@onready var sd5: Button = $"DiceContainer/D5"

###########################
#####  change Labels  #####
###########################
@onready var ld1: Label = $DiceContainer/D1/D1Label
@onready var ld2: Label = $"DiceContainer/D2/D2Label"
@onready var ld3: Label = $"DiceContainer/D3/D3Label"
@onready var ld4: Label = $"DiceContainer/D4/D4Label"
@onready var ld5: Label = $"DiceContainer/D5/D5Label"
@onready var ld_array : Array = [ld1, ld2, ld3, ld4, ld5]

@onready var lrolldice: Label = $"RollDiceButton/RollDiceLabel"


########################################################################
#####                           Variables                          #####
########################################################################

@onready var d1locked: Sprite2D = $"DiceContainer/D1/KniffelDiceLocked"
@onready var d2locked: Sprite2D = $"DiceContainer/D2/KniffelDiceLocked"
@onready var d3locked: Sprite2D = $"DiceContainer/D3/KniffelDiceLocked"
@onready var d4locked: Sprite2D = $"DiceContainer/D4/KniffelDiceLocked"
@onready var d5locked: Sprite2D = $"DiceContainer/D5/KniffelDiceLocked"
@onready var dlocked_array: Array = [d1locked, d2locked, d3locked, d4locked, d5locked]


@onready var can_throw_timer: Timer = $can_throw_Timer

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

var pickedUpgrades : Array = []


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

var color_values : Array = [\
Color(0.7, 0.7, 0.0), Color(0.0, 0.7, 0.0), \
Color(0.0, 0.7, 0.7), Color(0.0, 0.604, 1.0, 1.0), \
Color(0.7, 0.0, 0.7), Color(0.7, 0.0, 0.0)]



func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y,
		"z_index" : z_index,
		"throw_count" : throw_count,
		"locked_slot" : locked_slot,
		"can_throw" : can_throw,
		"d1" : d1,
		"d2" : d2,
		"d3" : d3,
		"d4" : d4,
		"d5" : d5,
		"sd1" : sd1,
		"sd2" : sd2,
		"sd3" : sd3,
		"sd4" : sd4,
		"sd5" : sd5,
		"dices" : dices,
		"diceValues" : diceValues,
		"selectsfx" : selectsfx,
		"dicesfx" : dicesfx,
		
	}
	return save_dict

func loadDices():
	kniffelpaper.kniffelpaper_is_ready.connect(load_rest)
	lrolldice.text = str("Roll Dice (", max_throw_count - throw_count, ")")
	for i in dices.size():	dices[i] = int(dices[i])
	

func load_rest():
	await get_tree().create_timer(0.2).timeout
	resetLocked()
	for i in dices.size():
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
		dicesfxtimer.start()
		choseDie(i)
		await get_tree().create_timer(0.1).timeout
		print(locked_slot)
		if locked_slot[i] == true:
			sDices[i].button_toggled = true
			dlocked_array[i].visible = true
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await $"..".ready
	kniffelpaper = $"../Kniffel_paper"
	setColor()
	resetDice()


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
		can_throw_timer.start()
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
					dicesfxtimer.start()
					dices[i - 1] = rng(i)
					choseDie(i)
					endrollsfx.play()
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
	diceCounted.emit(number - 1)
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


func d1pressed():
	selectsfx.play()
	if sd1.button_toggled == false:
			locked_slot[0] = true
			sd1.button_toggled = true
			dlocked_array[0].visible = true
	else:
		locked_slot[0] = false
		sd1.button_toggled = false
		dlocked_array[0].visible = false

func d2pressed():
	selectsfx.play()
	if sd2.button_toggled == false:
			locked_slot[1] = true
			sd2.button_toggled = true
			dlocked_array[1].visible = true
	else:
		locked_slot[1] = false
		sd2.button_toggled = false
		dlocked_array[1].visible = false

func d3pressed():
	selectsfx.play()
	if sd3.button_toggled == false:
			locked_slot[2] = true
			sd3.button_toggled = true
			dlocked_array[2].visible = true
	else:
		locked_slot[2] = false
		sd3.button_toggled = false
		dlocked_array[2].visible = false

func d4pressed():
	selectsfx.play()
	if sd4.button_toggled == false:
			locked_slot[3] = true
			sd4.button_toggled = true
			dlocked_array[3].visible = true
	else:
		locked_slot[3] = false
		sd4.button_toggled = false
		dlocked_array[3].visible = false

func d5pressed():
	selectsfx.play()
	if sd5.button_toggled == false:
			locked_slot[4] = true
			sd5.button_toggled = true
			dlocked_array[4].visible = true
	else:
		locked_slot[4] = false
		sd5.button_toggled = false
		dlocked_array[4].visible = false
var dpressed_array : Array = [d1pressed, d2pressed, d3pressed, d4pressed, d5pressed]
###############################
#####   keyboard compat   #####
###############################
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("unlockAll"):
		resetLocked()
	if Input.is_action_just_pressed("roll"):
		throwDices()
	if Input.is_action_just_pressed("D1_Lock"):
		d1pressed()
	if Input.is_action_just_pressed("D2_Lock"):
		d2pressed()
	if Input.is_action_just_pressed("D3_Lock"):
		d3pressed()
	if Input.is_action_just_pressed("D4_Lock"):
		d4pressed()
	if Input.is_action_just_pressed("D5_Lock"):
		d5pressed()

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

###########################
#####    SFX Timer    #####
###########################
func _on_dice_sfx_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property(dicesfx, "volume_db", -60, .3)
	await tween.finished
	dicesfx.stop()


func _on_upgrade_menu_selected_upgrade(upgrade: Variant) -> void:
		pickedUpgrades.append(upgrade)


func _on_can_throw_timer_timeout() -> void:
	can_throw = true
