extends Node2D


<<<<<<< HEAD
############################################################
#####                   Path linking                   #####
############################################################
=======
##############################
#####    Path linking    #####
##############################

>>>>>>> 6ccf1f747569058257b9593b42b7d542d6f5483e
@onready var animplayer: AnimationPlayer = $"../AnimationPlayer"

####################
#####  Points  #####
####################
@onready var lpoints: Label = $"../Level/PointCounters/LabelPoints"
@onready var ltoppoints: Label = $"../KniffelBonusMeter/KniffelTopCounter"
@onready var lbottompoints: Label = $"../Level/PointCounters/LabelBottomPoints"

####################
#####  Buttons #####
####################
@onready var sd1: Button = $"../Dices/DiceContainer/D1"
@onready var sd2: Button = $"../Dices/DiceContainer/D2"
@onready var sd3: Button = $"../Dices/DiceContainer/D3"
@onready var sd4: Button = $"../Dices/DiceContainer/D4"
@onready var sd5: Button = $"../Dices/DiceContainer/D5"

@onready var bkniffel: Button = $"../Level/SelectActionButtom/Kniffel"
@onready var bchance: Button = $"../Level/SelectActionButtom/Chance"
@onready var bx_3: Button = $"../Level/SelectActionButtom/x3"
@onready var bx_4: Button = $"../Level/SelectActionButtom/x4"
@onready var bbig_straigth: Button = $"../Level/SelectActionButtom/BigStraigth"
@onready var bsmall_straigth: Button = $"../Level/SelectActionButtom/SmallStraigth"
@onready var bfull_house: Button = $"../Level/SelectActionButtom/FullHouse"

####################
#####  Labels  #####
####################
@onready var l1: Label = $"../Level/PointCounters/Label1"
@onready var l2: Label = $"../Level/PointCounters/Label2"
@onready var l3: Label = $"../Level/PointCounters/Label3"
@onready var l4: Label = $"../Level/PointCounters/Label4"
@onready var l5: Label = $"../Level/PointCounters/Label5"
@onready var l6: Label = $"../Level/PointCounters/Label6"
@onready var lx3: Label = $"../Level/PointCounters/LabelX3"
@onready var lx4: Label = $"../Level/PointCounters/LabelX4"
@onready var lsmallstraight: Label = $"../Level/PointCounters/LabelSmallStraight"
@onready var lbigstraight: Label = $"../Level/PointCounters/LabelBigStraight"
@onready var lkniffel: Label = $"../Level/PointCounters/LabelKniffel"
@onready var lchance: Label = $"../Level/PointCounters/LabelChance"
@onready var lfullhouse: Label = $"../Level/PointCounters/LabelFullHouse"

###########################
#####  change Labels  #####
###########################
@onready var lx3d1: Label = $"../Level/SelectActionButtom/showItem/x3Shower/Lx3D1"
@onready var lx3d2: Label = $"../Level/SelectActionButtom/showItem/x3Shower/Lx3D2"
@onready var lx3d3: Label = $"../Level/SelectActionButtom/showItem/x3Shower/Lx3D3"

@onready var lx4d1: Label = $"../Level/SelectActionButtom/showItem/x4Shower/Lx4D1"
@onready var lx4d2: Label = $"../Level/SelectActionButtom/showItem/x4Shower/Lx4D2"
@onready var lx4d3: Label = $"../Level/SelectActionButtom/showItem/x4Shower/Lx4D3"
@onready var lx4d4: Label = $"../Level/SelectActionButtom/showItem/x4Shower/Lx4D4"

@onready var lkniffeld1: Label = $"../Level/SelectActionButtom/showItem/KniffelShower/LKniffelD1"
@onready var lkniffeld2: Label = $"../Level/SelectActionButtom/showItem/KniffelShower/LKniffelD2"
@onready var lkniffeld3: Label = $"../Level/SelectActionButtom/showItem/KniffelShower/LKniffelD3"
@onready var lkniffeld4: Label = $"../Level/SelectActionButtom/showItem/KniffelShower/LKniffelD4"
@onready var lkniffeld5: Label = $"../Level/SelectActionButtom/showItem/KniffelShower/LKniffelD5"

@onready var lchanced1: Label = $"../Level/SelectActionButtom/showItem/ChanceShower/LChanceD1"
@onready var lchanced2: Label = $"../Level/SelectActionButtom/showItem/ChanceShower/LChanceD2"
@onready var lchanced3: Label = $"../Level/SelectActionButtom/showItem/ChanceShower/LChanceD3"
@onready var lchanced4: Label = $"../Level/SelectActionButtom/showItem/ChanceShower/LChanceD4"
@onready var lchanced5: Label = $"../Level/SelectActionButtom/showItem/ChanceShower/LChanceD5"

@onready var lbigstraightd1: Label = $"../Level/SelectActionButtom/showItem/BigStraightShower/LBigStraightD1"
@onready var lbigstraightd2: Label = $"../Level/SelectActionButtom/showItem/BigStraightShower/LBigStraightD2"
@onready var lbigstraightd3: Label = $"../Level/SelectActionButtom/showItem/BigStraightShower/LBigStraightD3"
@onready var lbigstraightd4: Label = $"../Level/SelectActionButtom/showItem/BigStraightShower/LBigStraightD4"
@onready var lbigstraightd5: Label = $"../Level/SelectActionButtom/showItem/BigStraightShower/LBigStraightD5"

@onready var lsmallstraightd1: Label = $"../Level/SelectActionButtom/showItem/SmallStraightShower/LSmallStraightD1"
@onready var lsmallstraightd2: Label = $"../Level/SelectActionButtom/showItem/SmallStraightShower/LSmallStraightD2"
@onready var lsmallstraightd3: Label = $"../Level/SelectActionButtom/showItem/SmallStraightShower/LSmallStraightD3"
@onready var lsmallstraightd4: Label = $"../Level/SelectActionButtom/showItem/SmallStraightShower/LSmallStraightD4"

@onready var lfullhoused1: Label = $"../Level/SelectActionButtom/showItem/FullHouseShower/LFullHouseD1"
@onready var lfullhoused2: Label = $"../Level/SelectActionButtom/showItem/FullHouseShower/LFullHouseD2"
@onready var lfullhoused3: Label = $"../Level/SelectActionButtom/showItem/FullHouseShower/LFullHouseD3"
@onready var lfullhoused4: Label = $"../Level/SelectActionButtom/showItem/FullHouseShower/LFullHouseD4"
@onready var lfullhoused5: Label = $"../Level/SelectActionButtom/showItem/FullHouseShower/LFullHouseD5"

<<<<<<< HEAD
##########################################################
#####                     Variables                  #####
##########################################################
=======
#############################
#####     Variables     #####LBigStraightD9
#############################
>>>>>>> 6ccf1f747569058257b9593b42b7d542d6f5483e
var d1 = 0
var d2 = 0
var d3 = 0
var d4 = 0
var d5 = 0

var changeDieMemory = 1
var small_straight_memory = 1
var big_straight_memory = 1

var update_progressbar = false

var dice_count = 5

var points = 0
var bonus_points = 0
var top_points_counter = 0
var bottom_points_counter = 0
var has_bonus = false
@export var bonus_treashold = 63
@export var bonus_amount = 35 

var max_throw_count = 3
var throw_count = 0

var sDices = [sd1, sd2 , sd3, sd4, sd5]

var locked_slot = [false, false, false, false, false]
var dices = [d1, d2 , d3, d4, d5]

var actions = [false, false, false, false, false, false]
var diceValues = [0, 0, 0, 0, 0, 0,]
var buttom_actions = [false, false, false, false, false, false, false]

<<<<<<< HEAD
var smallstraight1 = [1, 2, 3, 4] 
var smallstraight2 = [2, 3, 4, 5]
var smallstraight3 = [3, 4, 5, 6]
=======

>>>>>>> 6ccf1f747569058257b9593b42b7d542d6f5483e
################################
#####   Methods for calc   #####
################################
func _ready() -> void:
	resetDice()
	changeShowers()

func changeShowers() -> void:
	lx3d1.text = str(changeDieMemory)
	lx3d2.text = str(changeDieMemory)
	lx3d3.text = str(changeDieMemory)
	lx4d1.text = str(changeDieMemory)
	lx4d2.text = str(changeDieMemory)
	lx4d3.text = str(changeDieMemory)
	lx4d4.text = str(changeDieMemory)
	lkniffeld1.text = str(changeDieMemory)
	lkniffeld2.text = str(changeDieMemory)
	lkniffeld3.text = str(changeDieMemory)
	lkniffeld4.text = str(changeDieMemory)
	lkniffeld5.text = str(changeDieMemory)
	lchanced1.text = str(rng())
	lchanced2.text = str(rng())
	lchanced3.text = str(rng())
	lchanced4.text = str(rng())
	lchanced5.text = str(rng())
	if small_straight_memory == 1:
		lsmallstraightd1.text = "1"
		lsmallstraightd2.text = "2"
		lsmallstraightd3.text = "3"
		lsmallstraightd4.text = "4"
		small_straight_memory = 2
	elif small_straight_memory == 2:
		lsmallstraightd1.text = "2"
		lsmallstraightd2.text = "3"
		lsmallstraightd3.text = "4"
		lsmallstraightd4.text = "5"
		small_straight_memory = 3
	elif small_straight_memory == 3:
		lsmallstraightd1.text = "3"
		lsmallstraightd2.text = "4"
		lsmallstraightd3.text = "5"
		lsmallstraightd4.text = "6"
		small_straight_memory = 1
	if big_straight_memory == 1:
		lbigstraightd1.text = "1"
		lbigstraightd2.text = "2"
		lbigstraightd3.text = "3"
		lbigstraightd4.text = "4"
		lbigstraightd5.text = "5"
		big_straight_memory = 2
	elif big_straight_memory == 2:
		lbigstraightd1.text = "2"
		lbigstraightd2.text = "3"
		lbigstraightd3.text = "4"
		lbigstraightd4.text = "5"
		lbigstraightd5.text = "6"
		big_straight_memory = 1
	
	lfullhoused1.text = str(changeDieMemory)
	lfullhoused2.text = str(changeDieMemory)
	lfullhoused3.text = str(changeDieMemory)
	if changeDieMemory != 6:
		changeDieMemory +=1
	else:
		changeDieMemory = 1
	lfullhoused4.text = str(changeDieMemory)
	lfullhoused5.text = str(changeDieMemory)

func throwDices() -> void:
	if throw_count == 0:
		resetLocked()
	if throw_count < max_throw_count:
		throw_count += 1
		$"../Dices/RollDiceButton".text = str("Roll Dice (", max_throw_count - throw_count, ")")
		for i in dice_count:
			if locked_slot[i] == false:
				dices[i - 1] = rng()
				choseDie(i)

func choseDie(die) -> void:
	if die == 0:
		sd1.text = str(0)
		var td1 = create_tween()
		td1.tween_property(sd1, "text", str((dices[die - 1])), 0.1)
	elif die == 1:
		sd2.text = str(0)
		var td2 = create_tween()
		td2.tween_property(sd2, "text", str((dices[die - 1])), 0.1)
	elif die == 2:
		sd3.text = str(0)
		var td3 = create_tween()
		td3.tween_property(sd3, "text", str((dices[die - 1])), 0.1)
	elif die == 3:
		sd4.text = str(0)
		var td4 = create_tween()
		td4.tween_property(sd4, "text", str((dices[die - 1])), 0.1)
	elif die == 4:
		sd5.text = str(0)
		var td5 = create_tween()
		td5.tween_property(sd5, "text", str((dices[die - 1])), 0.1)

func rng() -> int:
	return(RandomNumberGenerator.new().randi_range(1,6))

func resetDice() -> void:
	var tween1 = create_tween()
	tween1.tween_property(ltoppoints, "text", str("Points: ",top_points_counter, " / 63"), 0.1)
	var tween = create_tween()
	tween.tween_property($"../KniffelBonusMeter/TextureProgressBar", "value",top_points_counter, 0.2,).set_trans(Tween.TRANS_SINE)
	var tween3 = create_tween()
	tween3.tween_property(lbottompoints, "text", str("Bottom Points: ", bottom_points_counter), 0.1)
	lbottompoints.text = str("Bottom Points : ", bottom_points_counter)
	sd1.text = ""
	sd2.text = ""
	sd3.text = ""
	sd4.text = ""
	sd5.text = ""
	d1 = 0
	d2 = 0
	d3 = 0
	d4 = 0
	d5 = 0
	resetLocked()
	throw_count = 0

func resetLocked() -> void:
	locked_slot = [false, false, false, false, false]
	sd1.button_pressed = false
	sd2.button_pressed = false
	sd3.button_pressed = false
	sd4.button_pressed = false
	sd5.button_pressed = false

func checkActions() -> void:
	var all_actions_done = 0
	for i in 6:
		if actions[i - 1] == true:
			all_actions_done += 1
		else: 
			all_actions_done = 0
	if all_actions_done == 6:
		if top_points_counter >= bonus_treashold:
			top_points_counter += bonus_amount
			points += top_points_counter
			var tween = create_tween()
			tween.tween_property(lpoints, "text", str("All Points : ", points), .1)

################################
#####    Action Methods    #####
################################
func chance() -> void:
	if buttom_actions[6] == false:
		var dice_value = 0
		for i in dice_count:
			dice_value += dices[i] 
		resetDice()
		bottom_points_counter += dice_value
		lchance.text = str(dice_value)
		buttom_actions[6] = true

func kniffel() -> void:
	if buttom_actions[5] == false:
		if dices.count(dices[0]) == 5:
			lkniffel.text = "50"
			bottom_points_counter += 50
		else: 
			lkniffel.text = "0"
		resetDice()
		buttom_actions[5] = true

func big_straight() -> void:
	if buttom_actions[4] == false:
<<<<<<< HEAD
		var is_big_straight = false
		var pureDices = []
		for i in dice_count:
			if !pureDices.has(dices[i - 1]):
				pureDices.append(dices[i - 1]) 
		pureDices.sort()
		var pdsize = pureDices.size()
		if pdsize == 5:
			if pureDices[0] + 1 == pureDices[1] && pureDices[0] + 2 == pureDices[2] && pureDices[0] + 3 == pureDices[3] && pureDices[0] + 4  == pureDices[4]:
				is_big_straight = true
		if is_big_straight:
			lbigstraight.text = "40"
			bottom_points_counter +=40
=======
		var big_straight_counter = 0
		dices.sort()
		for i in dices:
			if i != dices.size() - 1:
				if dices[i - 1] - dices[i] == -1:
					big_straight_counter += 1
		if big_straight_counter >= 3:
			bottom_points_counter += 40
			lbigstraight.text = "40"
>>>>>>> 6ccf1f747569058257b9593b42b7d542d6f5483e
		else:
			lbigstraight.text = "0"
		resetDice()
		buttom_actions[4] = true

<<<<<<< HEAD
func small_straight() -> void:
	if buttom_actions[3] == false:
		var is_small_straight = false
		var pureDices = []
		for i in dice_count:
			if !pureDices.has(dices[i - 1]):
				pureDices.append(dices[i - 1]) 
		pureDices.sort()
		var pdsize = pureDices.size()
		if pdsize > 3:
			if pdsize == 4:
				if pureDices[0] + 1 == pureDices[1] && pureDices[0] + 2 == pureDices[2] && pureDices[0] + 3 == pureDices[3]:
					is_small_straight = true
			if pdsize == 5:
				if pureDices[0] + 1 == pureDices[1] && pureDices[0] + 2 == pureDices[2] && pureDices[0] + 3 == pureDices[3] && pureDices[0] + 4  == pureDices[4]:
					is_small_straight = true
		if is_small_straight:
=======


####NEEEEEEDS FIXIN





func small_straight() -> void:
	if buttom_actions[3] == false:
		var small_straight_counter = 0
		dices.sort()
		for i in dices:
			if i < dices.size():
				if dices[i - 1] - dices[i] == -1:
						small_straight_counter += 1
		if small_straight_counter >= 3:
>>>>>>> 6ccf1f747569058257b9593b42b7d542d6f5483e
			lsmallstraight.text = "30"
			bottom_points_counter += 30
		else:
			lsmallstraight.text = "0"
		resetDice()
		buttom_actions[3] = true

func x3() -> void:
	if actions[0] == false: 
		dices.sort()
		var is_x3 = false
		for i in dice_count:
			if dices.count(dices[i - 1]) >= 3:
				is_x3 = true
				break
		if is_x3:
			var dice_value = 0
			for i in dice_count:
				dice_value += dices[i]
			bottom_points_counter += dice_value
			lx3.text = str(dice_value)
		else:
			lx3.text = "0"
		resetDice()
		buttom_actions[0] = true

func x4() -> void:
	if actions[1] == false: 
		dices.sort()
		var is_x4 = false
		for i in dice_count:
				if dices.count(dices[i - 1]) >= 4:
					is_x4 = true
					break
		if is_x4:
			var dice_value = 0
			for i in dice_count:
				dice_value += dices[i]
			bottom_points_counter += dice_value
			lx4.text = str(dice_value)
		else:
			lx4.text = "0"
		resetDice()
		buttom_actions[1] = true

func full_house() -> void:
	if buttom_actions[2] == false:
		dices.sort()
		var dif_dice
		var dice_counted = dices.count(dices[0])
		var dif_dice_counted = 0
		for i in dice_count:
			if dices[i] != dices[0]:
				print(dices[i])
				dif_dice = dices[i]
				break
		dif_dice_counted = dices.count(dif_dice)
		if dice_counted == 3 && dif_dice_counted == 2:
			bottom_points_counter += 25
			lfullhouse.text = "25"
			resetDice()
			buttom_actions[2] = true
		elif dice_counted == 2 && dif_dice_counted == 3:
			bottom_points_counter += 25
			lfullhouse.text = "25"
			resetDice()
			buttom_actions[2] = true
		else:
			resetDice()
			buttom_actions[2] = true
			lfullhouse.text = "0"

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
	
	
	
	#Keyboard compatibility
	if Input.is_action_just_pressed("chance"):
		chance()
	if Input.is_action_just_pressed("kniffel"):
		kniffel()
	if Input.is_action_just_pressed("3x"):
		x3()
	if Input.is_action_just_pressed("4x"):
		x4()
	if Input.is_action_just_pressed("big_straight"):
		big_straight()
	if Input.is_action_just_pressed("Full_House"):
		full_house()
	if Input.is_action_just_pressed("small_straight"):
		small_straight()

##############################
#####     Lock Dices     #####
##############################
func _on_d_1_toggled(toggled_on: bool) -> void:
	locked_slot[0] = toggled_on

func _on_d_2_toggled(toggled_on: bool) -> void:
	locked_slot[1] = toggled_on

func _on_d_3_toggled(toggled_on: bool) -> void:
	locked_slot[2] = toggled_on

func _on_d_4_toggled(toggled_on: bool) -> void:
	locked_slot[3] = toggled_on

func _on_d_5_toggled(toggled_on: bool) -> void:
	locked_slot[4] = toggled_on


###############################
#####    Select Action    #####
###############################
func _on_one_select_button_pressed() -> void:
	var dice_counted = 1
	if actions[dice_counted - 1] == false:
		for i in dice_count:
			if dices[i] == dice_counted:
				diceValues[dice_counted - 1] += dice_counted
		l1.text = str(diceValues[dice_counted - 1])
		top_points_counter += diceValues[dice_counted - 1]
		actions[dice_counted - 1] = true
		animplayer.play("D1_select")
		resetDice()
		checkActions()

func _on_two_select_button_pressed() -> void:
	var dice_counted = 2
	if actions[dice_counted - 1] == false:
		for i in dice_count:
			if dices[i] == dice_counted:
				diceValues[dice_counted - 1] += dice_counted
		l2.text = str(diceValues[dice_counted - 1])
		top_points_counter += diceValues[dice_counted - 1]
		actions[dice_counted - 1] = true
		resetDice()
		checkActions()

func _on_three_select_button_pressed() -> void:
	var dice_counted = 3
	if actions[dice_counted - 1] == false:
		for i in dice_count:
			if dices[i] == dice_counted:
				diceValues[dice_counted - 1] += dice_counted
		l3.text = str(diceValues[dice_counted - 1])
		top_points_counter += diceValues[dice_counted - 1]
		actions[dice_counted - 1] = true
		resetDice()
		checkActions()

func _on_four_select_button_pressed() -> void:
	var dice_counted = 4
	if actions[dice_counted - 1] == false:
		for i in dice_count:
			if dices[i] == dice_counted:
				diceValues[dice_counted - 1] += dice_counted
		l4.text = str(diceValues[dice_counted - 1])
		top_points_counter += diceValues[dice_counted - 1]
		actions[dice_counted - 1] = true
		resetDice()
		checkActions()

func _on_five_select_button_pressed() -> void:
	var dice_counted = 5
	if actions[dice_counted - 1] == false:
		for i in dice_count:
			if dices[i] == dice_counted:
				diceValues[dice_counted - 1] += dice_counted
		l5.text = str(diceValues[dice_counted - 1])
		top_points_counter += diceValues[dice_counted - 1]
		actions[dice_counted - 1] = true
		resetDice()
		checkActions()

func _on_six_select_button_pressed() -> void:
	var dice_counted = 6
	if actions[dice_counted - 1] == false:
		for i in dice_count:
			if dices[i] == dice_counted:
				diceValues[dice_counted - 1] += dice_counted
		l6.text = str(diceValues[dice_counted - 1])
		top_points_counter += diceValues[dice_counted - 1]
		actions[dice_counted - 1] = true
		resetDice()
		checkActions()

func _on_x_3_pressed() -> void:
	x3()

func _on_x_4_pressed() -> void:
	x4()

func _on_full_house_pressed() -> void:
	full_house()

func _on_small_straigth_pressed() -> void:
	small_straight()

func _on_big_straigth_pressed() -> void:
	big_straight()

func _on_kniffel_pressed() -> void:
	kniffel()

func _on_chance_pressed() -> void:
	chance()


func _on_roll_dice_button_pressed() -> void:
	throwDices()

func _on_unlock_all_button_pressed() -> void:
	resetLocked()


func _on_timer_timeout() -> void:
	changeShowers()
