extends Node2D

#region Variables for Paths
############################################################
#####                   Path linking                   #####
############################################################
@onready var animplayer: AnimationPlayer = $"../AnimationPlayer"
@onready var selectsfx: AudioStreamPlayer = $"../SelectSFX"
@onready var countersfx: AudioStreamPlayer = $"../CounterSFX"
@onready var settingsmanager: Control = $"../SettingsMenu"
@onready var end_menu: Control = $"../EndMenu"
@onready var menu: VBoxContainer = $"../Menu/VBoxContainer"
@onready var shortcutoverlay: Control = $"../ShowControls"
@onready var dicesfx: AudioStreamPlayer = $"../diceSFX"
@onready var dicesfxtimer: Timer = $"../diceSFX/diceSFXTimer"
@onready var bottomactionsanimations: AnimationPlayer = $"../Level/SelectActionButtom/Sprites_for_anim/BottomActionsAnimations"





########################
#####  Background  #####
########################
@onready var d1bgcolor: Sprite2D = $"../Parallax2D/d1"
@onready var d2bgcolor: Sprite2D = $"../Parallax2D/d2"
@onready var d3bgcolor: Sprite2D = $"../Parallax2D/d3"
@onready var d4bgcolor: Sprite2D = $"../Parallax2D/d4"
@onready var d5bgcolor: Sprite2D = $"../Parallax2D/d5"
@onready var d6bgcolor: Sprite2D = $"../Parallax2D/d6"
@onready var dbgcolor_array : Array = [d1bgcolor, d2bgcolor, d3bgcolor, d4bgcolor, d5bgcolor, d6bgcolor,]

####################
#####  Points  #####
####################
@onready var pointssprite2d: Sprite2D = $"../Level/PointCounters/PointsSprite2D"
@onready var lpoints: Label = $"../Level/PointCounters/LabelPoints"
@onready var ltoppoints: Label = $"../KniffelBonusMeter/KniffelTopCounter"
@onready var lbottompoints: Label = $"../Level/PointCounters/LabelBottomPoints"

####################
#####  Buttons #####
####################
@onready var d1color: Node2D = $"../Level/SelectAction/D1"
@onready var d2color: Node2D = $"../Level/SelectAction/D2"
@onready var d3color: Node2D = $"../Level/SelectAction/D3"
@onready var d4color: Node2D = $"../Level/SelectAction/D4"
@onready var d5color: Node2D = $"../Level/SelectAction/D5"
@onready var d6color: Node2D = $"../Level/SelectAction/D6"
@onready var dcolor_array : Array = [d1color, d2color, d3color, d4color, d5color, d6color]

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
@onready var l_array : Array = [l1, l2, l3, l4, l5, l6]

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

@onready var ld1: Label = $"../Dices/DiceContainer/D1/D1Label"
@onready var ld2: Label = $"../Dices/DiceContainer/D2/D2Label"
@onready var ld3: Label = $"../Dices/DiceContainer/D3/D3Label"
@onready var ld4: Label = $"../Dices/DiceContainer/D4/D4Label"
@onready var ld5: Label = $"../Dices/DiceContainer/D5/D5Label"
@onready var ld_array : Array = [ld1, ld2, ld3, ld4, ld5]

@onready var lrolldice: Label = $"../Dices/RollDiceButton/RollDiceLabel"

@onready var lx3d1: Label = $"../Level/SelectActionButtom/x3D/D1/Label"
@onready var lx3d2: Label = $"../Level/SelectActionButtom/x3D/D2/Label"
@onready var lx3d3: Label = $"../Level/SelectActionButtom/x3D/D3/Label"
@onready var lx3d_array : Array = [lx3d1, lx3d2, lx3d3]

@onready var lx4d1: Label = $"../Level/SelectActionButtom/x4D/D1/Label"
@onready var lx4d2: Label = $"../Level/SelectActionButtom/x4D/D2/Label"
@onready var lx4d3: Label = $"../Level/SelectActionButtom/x4D/D3/Label"
@onready var lx4d4: Label = $"../Level/SelectActionButtom/x4D/D4/Label"
@onready var lx4d_array : Array = [lx4d1, lx4d2, lx4d3, lx4d4]

@onready var lkniffeld1: Label = $"../Level/SelectActionButtom/KniffelD/D1/Label"
@onready var lkniffeld2: Label = $"../Level/SelectActionButtom/KniffelD/D2/Label"
@onready var lkniffeld3: Label = $"../Level/SelectActionButtom/KniffelD/D3/Label"
@onready var lkniffeld4: Label = $"../Level/SelectActionButtom/KniffelD/D4/Label"
@onready var lkniffeld5: Label = $"../Level/SelectActionButtom/KniffelD/D5/Label"
@onready var lkniffel_array : Array = [lkniffeld1, lkniffeld2, lkniffeld3, lkniffeld4, lkniffeld5]

@onready var lchanced1: Label = $"../Level/SelectActionButtom/ChanceD/D1/Label"
@onready var lchanced2: Label = $"../Level/SelectActionButtom/ChanceD/D2/Label"
@onready var lchanced3: Label = $"../Level/SelectActionButtom/ChanceD/D3/Label"
@onready var lchanced4: Label = $"../Level/SelectActionButtom/ChanceD/D4/Label"
@onready var lchanced5: Label = $"../Level/SelectActionButtom/ChanceD/D5/Label"
@onready var lchance_array : Array = [lchanced1, lchanced2, lchanced3, lchanced4, lchanced5]

@onready var lbigstraightd1: Label = $"../Level/SelectActionButtom/BigStraightD/D1/Label"
@onready var lbigstraightd2: Label = $"../Level/SelectActionButtom/BigStraightD/D2/Label"
@onready var lbigstraightd3: Label = $"../Level/SelectActionButtom/BigStraightD/D3/Label"
@onready var lbigstraightd4: Label = $"../Level/SelectActionButtom/BigStraightD/D4/Label"
@onready var lbigstraightd5: Label = $"../Level/SelectActionButtom/BigStraightD/D5/Label"
@onready var lbigstraight_array : Array = [lbigstraightd1, lbigstraightd2, lbigstraightd3, lbigstraightd4, lbigstraightd5]

@onready var lsmallstraightd1: Label = $"../Level/SelectActionButtom/SmallStraightD/D1/Label"
@onready var lsmallstraightd2: Label = $"../Level/SelectActionButtom/SmallStraightD/D2/Label"
@onready var lsmallstraightd3: Label = $"../Level/SelectActionButtom/SmallStraightD/D3/Label"
@onready var lsmallstraightd4: Label = $"../Level/SelectActionButtom/SmallStraightD/D4/Label"
@onready var lsmallstraight_array : Array = [lsmallstraightd1, lsmallstraightd2, lsmallstraightd3, lsmallstraightd4]

@onready var lfullhoused1: Label = $"../Level/SelectActionButtom/FullHouseD/D1/Label"
@onready var lfullhoused2: Label = $"../Level/SelectActionButtom/FullHouseD/D2/Label"
@onready var lfullhoused3: Label = $"../Level/SelectActionButtom/FullHouseD/D3/Label"
@onready var lfullhoused4: Label = $"../Level/SelectActionButtom/FullHouseD/D4/Label"
@onready var lfullhoused5: Label = $"../Level/SelectActionButtom/FullHouseD/D5/Label"
@onready var lfullhouse_array : Array = [lfullhoused1, lfullhoused2, lfullhoused3, lfullhoused4, lfullhoused5]
#endregion
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

@onready var dice_anim_array : Array = ["D1", "D2", "D3", "D4", "D5", "D6"]
#region labels for bottom action animations
#x3d label for anim
@onready var lx3danim1: Label = $"../Level/SelectActionButtom/Sprites_for_anim/x3D_for_anim/D1/Label"
@onready var lx3danim2: Label = $"../Level/SelectActionButtom/Sprites_for_anim/x3D_for_anim/D2/Label"
@onready var lx3danim3: Label = $"../Level/SelectActionButtom/Sprites_for_anim/x3D_for_anim/D3/Label"
@onready var lx3danim_array : Array = [lx3danim1, lx3danim2, lx3danim3]
@onready var x3danim1: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/x3D_for_anim/D1"
@onready var x3danim2: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/x3D_for_anim/D2"
@onready var x3danim3: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/x3D_for_anim/D3"
@onready var x3danim_array : Array = [x3danim1, x3danim2, x3danim3]

#x4d label for anim
@onready var lx4danim1: Label = $"../Level/SelectActionButtom/Sprites_for_anim/x4D_for_anim/D1/Label"
@onready var lx4danim2: Label = $"../Level/SelectActionButtom/Sprites_for_anim/x4D_for_anim/D2/Label"
@onready var lx4danim3: Label = $"../Level/SelectActionButtom/Sprites_for_anim/x4D_for_anim/D3/Label"
@onready var lx4danim4: Label = $"../Level/SelectActionButtom/Sprites_for_anim/x4D_for_anim/D4/Label"
@onready var lx4danim_array : Array = [lx4danim1, lx4danim2, lx4danim3, lx4danim4]
@onready var x4danim1: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/x4D_for_anim/D1"
@onready var x4danim2: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/x4D_for_anim/D2"
@onready var x4danim3: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/x4D_for_anim/D3"
@onready var x4danim4: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/x4D_for_anim/D4"
@onready var x4danim_array : Array = [x4danim1, x4danim2, x4danim3, x4danim4]

# full house label for anim
@onready var lfulllhouseanim1: Label = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D1/Label"
@onready var lfulllhouseanim2: Label = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D2/Label"
@onready var lfulllhouseanim3: Label = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D3/Label"
@onready var lfulllhouseanim4: Label = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D4/Label"
@onready var lfulllhouseanim5: Label = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D5/Label"
@onready var lfullhouseanim_array : Array = [lfulllhouseanim1, lfulllhouseanim2, lfulllhouseanim3, lfulllhouseanim4, lfulllhouseanim5]
@onready var fulllhouseanim1: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D1"
@onready var fulllhouseanim2: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D2"
@onready var fulllhouseanim3: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D3"
@onready var fulllhouseanim4: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D4"
@onready var fulllhouseanim5: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D5"
@onready var fullhouseanim_array : Array = [fulllhouseanim1, fulllhouseanim2, fulllhouseanim3, fulllhouseanim4, fulllhouseanim5]

#smallstraight label for anim
@onready var lsmallstraightanim1: Label = $"../Level/SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D1/Label"
@onready var lsmallstraightanim2: Label = $"../Level/SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D2/Label"
@onready var lsmallstraightanim3: Label = $"../Level/SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D3/Label"
@onready var lsmallstraightanim4: Label = $"../Level/SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D4/Label"
@onready var lsmallstraightanim_array : Array = [lsmallstraightanim1, lsmallstraightanim2, lsmallstraightanim3, lsmallstraightanim4]
@onready var smallstraightanim1: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D1"
@onready var smallstraightanim2: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D2"
@onready var smallstraightanim3: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D3"
@onready var smallstraightanim4: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D4"
@onready var smallstraightanim_array : Array = [smallstraightanim1, smallstraightanim2, smallstraightanim3, smallstraightanim4]

#bigstraight label for anim
@onready var lbigstraightanim1: Label = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D1/Label"
@onready var lbigstraightanim2: Label = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D2/Label"
@onready var lbigstraightanim3: Label = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D3/Label"
@onready var lbigstraightanim4: Label = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D4/Label"
@onready var lbigstraightanim5: Label = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D5/Label"
@onready var lbigstraightanim_array : Array = [lbigstraightanim1, lbigstraightanim2, lbigstraightanim3, lbigstraightanim4, lbigstraightanim5]
@onready var bigstraightanim1: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D1"
@onready var bigstraightanim2: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D2"
@onready var bigstraightanim3: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D3"
@onready var bigstraightanim4: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D4"
@onready var bigstraightanim5: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D5"
@onready var bigstraightanim_array : Array = [bigstraightanim1, bigstraightanim2, bigstraightanim3, bigstraightanim4, bigstraightanim5]

#Kniffel label for anim
@onready var lkniffelanim1: Label = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D1/Label"
@onready var lkniffelanim2: Label = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D2/Label"
@onready var lkniffelanim3: Label = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D3/Label"
@onready var lkniffelanim4: Label = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D4/Label"
@onready var lkniffelanim5: Label = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D5/Label"
@onready var lkniffelanim_array : Array = [lkniffelanim1, lkniffelanim2, lkniffelanim3, lkniffelanim4, lkniffelanim5]
@onready var kniffelanimd1: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D1"
@onready var kniffelanimd2: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D2"
@onready var kniffelanimd3: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D3"
@onready var kniffelanimd4: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D4"
@onready var kniffelanimd5: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D5"
@onready var kniffelanim_array : Array = [kniffelanimd1, kniffelanimd2, kniffelanimd3, kniffelanimd4, kniffelanimd5]


#chance label for anim
@onready var lchanceanim1: Label = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D1/Label"
@onready var lchanceanim2: Label = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D2/Label"
@onready var lchanceanim3: Label = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D3/Label"
@onready var lchanceanim4: Label = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D4/Label"
@onready var lchanceanim5: Label = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D5/Label"
@onready var lchanceanim_array : Array = [lchanceanim1, lchanceanim2, lchanceanim3, lchanceanim4, lchanceanim5]
@onready var chanceanim1: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D1"
@onready var chanceanim2: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D2"
@onready var chanceanim3: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D3"
@onready var chanceanim4: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D4"
@onready var chanceanim5: Sprite2D = $"../Level/SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D5"
@onready var chanceanim_array : Array = [chanceanim1, chanceanim2, chanceanim3, chanceanim4, chanceanim5]


#endregion 
#####################################
#####   Variables for Showers   #####
#####################################
var changeDieMemory = 1
var small_straight_memory = 1
var big_straight_memory = 1

####################################
#####   Variables for Points   #####
####################################
var points = 0
var bonus_points = 0
var top_points_counter = 0
var bottom_points_counter = 0

###################################
#####   Variables for Bonus   #####
###################################
var has_bonus = false
@export var bonus_treashold = 63
@export var bonus_amount = 35 

#####################################
#####   Variables for Actions   #####
#####################################
var actions = [false, false, false, false, false, false]
var buttom_actions = [false, false, false, false, false, false, false]

#################################
#####   Variables for End   #####
#################################
var done = 0

####################################
#####   Variables for Design   #####
####################################
var color_values = ["ffff00", "00ff00", "00ffff", "009aff", "ff00ff", "ff0000"]

#######################################################################
#####                           Methods                           #####
#######################################################################

################################
#####   Methods for calc   #####
################################
func _ready() -> void:
	set_DiceColors()
	resetDice()
	#changeShowers()

func setColor() -> void:
	for i in sDices.size():
		sDices[i - 1].modulate = color_values[int(ld_array[i - 1].text) - 1]
	for i in dbgcolor_array.size():
		dbgcolor_array[i - 1].modulate = color_values[i - 1]
	set_DiceColors()

func set_DiceColors() -> void:
	for i in dcolor_array.size():
		dcolor_array[i - 1].modulate = color_values[i - 1]

func changeShowers() -> void:
	for i in lx3d_array.size():
		lx3d_array[i - 1].text = str(changeDieMemory)
	for i in lx4d_array.size():
		lx4d_array[i - 1].text = str(changeDieMemory)
	for i in lkniffel_array.size():
		lkniffel_array[i - 1].text = str(changeDieMemory)
	for i in lchance_array.size():
		lchance_array[i - 1].text = str(rng())
	lsmallstraightd1.text = str(small_straight_memory)
	lsmallstraightd2.text = str(small_straight_memory + 1)
	lsmallstraightd3.text = str(small_straight_memory + 2)
	lsmallstraightd4.text = str(small_straight_memory + 3)
	if small_straight_memory == 3:
		small_straight_memory = 1
	else:
		small_straight_memory += 1
	lbigstraightd1.text = str(big_straight_memory)
	lbigstraightd2.text = str(big_straight_memory + 1)
	lbigstraightd3.text = str(big_straight_memory + 2)
	lbigstraightd4.text = str(big_straight_memory + 3)
	lbigstraightd5.text = str(big_straight_memory + 4)
	if big_straight_memory == 1:
		big_straight_memory = 2
	else:
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


func delayDice(die) -> int:
	return dices[die - 1] - 6

func set_d1(die_value):
	if die_value < 0:
		die_value *= -1
	ld1.text = str(die_value)
	sd1.modulate = color_values[die_value - 1]
func set_d2(die_value):
	if die_value < 0:
		die_value *= -1
	ld2.text = str(die_value)
	sd2.modulate = color_values[die_value - 1]
func set_d3(die_value):
	if die_value < 0:
		die_value *= -1
	ld3.text = str(die_value)
	sd3.modulate = color_values[die_value - 1]
func set_d4(die_value):
	if die_value < 0:
		die_value *= -1
	ld4.text = str(die_value)
	sd4.modulate = color_values[die_value - 1]
func set_d5(die_value):
	if die_value < 0:
		die_value *= -1
	ld5.text = str(die_value)
	sd5.modulate = color_values[die_value - 1]

#### Use for LOOOOP for this to fix up !!!!!!!!!!!!!!!
func choseDie(die) -> void:
	var duration = .4
	if die == 0:
		var td1 = create_tween()
		td1.tween_method(set_d1, delayDice(die), dices[die - 1], duration).set_trans(Tween.TRANS_QUAD)
	elif die == 1:
		var td2 = create_tween()
		td2.tween_method(set_d2, delayDice(die), dices[die - 1], duration).set_trans(Tween.TRANS_QUAD)
	elif die == 2:
		var td3 = create_tween()
		td3.tween_method(set_d3, delayDice(die), dices[die - 1], duration).set_trans(Tween.TRANS_QUAD)
	elif die == 3:
		var td4 = create_tween()
		td4.tween_method(set_d4, delayDice(die), dices[die - 1], duration).set_trans(Tween.TRANS_QUAD)
	elif die == 4:
		var td5 = create_tween()
		td5.tween_method(set_d5, delayDice(die), dices[die - 1], duration).set_trans(Tween.TRANS_QUAD)

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

func resetLocked() -> void:
	selectsfx.play()
	locked_slot = [false, false, false, false, false]
	for i in sDices.size():
		sDices[i - 1].button_pressed = false
		sDices[i - 1].icon = dice_unlocked

func areAllLocked() -> bool:
	var tmp = true
	for i in dice_count:
		if locked_slot[i - 1] == true:
			tmp = true
		else:
			tmp = false
			break
	return tmp


################################
#####    Action Methods    #####
################################
func setBottomCounter(bottom_counter) -> void:
	lbottompoints.text = str(bottom_counter)
	lbottompoints.rotation -= .5 * get_process_delta_time()
	$"../Level/PointCounters/LabelBottomPoints/AnimationPlayer".play("Bottom_counter_pop")
	if !countersfx.has_stream_playback():
		countersfx.play()
		selectsfx.volume_db = 7
		$"../Level/PointCounters/LabelBottomPoints/CPUParticles2D".emitting = true
		selectsfx.play()
		countersfx.pitch_scale += .025
		await selectsfx.finished
		selectsfx.volume_db = 0

func checkButtomActions() -> void:
	resetDice()
	countersfx.pitch_scale = 1
	if int(lbottompoints.text) != bottom_points_counter:
		var tween3 = create_tween()
		tween3.tween_method(setBottomCounter, int(lbottompoints.text), bottom_points_counter, .7).set_trans(Tween.TRANS_EXPO)
		await tween3.finished
		lbottompoints.rotation = 0
	var all_actions_done = 0
	for i in buttom_actions.size():
		if buttom_actions[i - 1] == true:
			all_actions_done += 1
		else: 
			all_actions_done = 0
	if all_actions_done == 7:
		done += 1
		end()

func setTopCounter(top_counter) -> void:
	ltoppoints.text = str(top_counter)
	if !countersfx.has_stream_playback():
		countersfx.play()
		selectsfx.play()
		countersfx.pitch_scale += .05

func checkActions() -> void:
	resetDice()
	countersfx.pitch_scale = 1
	var tween = create_tween()
	tween.tween_property($"../KniffelBonusMeter/TextureProgressBar", "value",top_points_counter, 0.4,).set_trans(Tween.TRANS_EXPO)
	if int(ltoppoints.text) != top_points_counter:
		var tween1 = create_tween()
		tween1.tween_method(setTopCounter, int(ltoppoints.text), top_points_counter, 0.3)
	var all_actions_done = 0
	for i in actions.size():
		if actions[i - 1] == true:
			all_actions_done += 1
		else: 
			all_actions_done = 0
	if all_actions_done == actions.size():
		if top_points_counter >= bonus_treashold:
			top_points_counter += bonus_amount
			var tween1 = create_tween()
			tween1.tween_method(setTopCounter, int(ltoppoints.text), top_points_counter, 0.3)
			done += 1
			end()
		else:
			done += 1
			end()

#############################
#####    End Methods    #####
#############################
func setAllPoints(point_counter) -> void:
	lpoints.text = str(point_counter)
	if !countersfx.has_stream_playback():
		countersfx.play()
		selectsfx.play()
		countersfx.pitch_scale += .05
		$"../Level/PointCounters/LabelPoints/AnimationPlayer".play("label_points_pop")


func end() -> void:
	if done == 2:
		points += top_points_counter
		points += bottom_points_counter
		pointssprite2d.visible = true
		lpoints.visible = true
		var tweenPoints = create_tween()
		tweenPoints.tween_method(setAllPoints, 0 , points, 1)
		$"../EndMenu".visible = true
		$"../EndTimer".start()

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
func topDs(number) -> void:
	if dices[0] != 0:
		var dice_counted = number
		if actions[dice_counted - 1] == false:
			for i in dices.size():
				if dices[i] == dice_counted:
					diceValues[dice_counted - 1] += dice_counted
			l_array[dice_counted - 1].text = str(diceValues[dice_counted - 1])
			top_points_counter += diceValues[dice_counted - 1]
			actions[dice_counted - 1] = true
			animplayer.play(dice_anim_array[dice_counted - 1] + "_select")
			selectsfx.play()
			checkActions()

func chance() -> void:
	if dices[0] != 0:
		if buttom_actions[6] == false:
			var all_dice_value = allDiceCounted()
			bottom_points_counter += all_dice_value
			lchance.text = str(all_dice_value)
			selectsfx.play()
			bottomactionsanimations.play("chance_select")
			for i in dices.size():
				lchanceanim_array[i - 1].text = str(dices[i - 1])
				chanceanim_array[i - 1].modulate = color_values[dices[i - 1] - 1]
			buttom_actions[6] = true
			checkButtomActions()

func kniffel() -> void:
	if dices[0] != 0:
		if buttom_actions[5] == false:
			if dices.count(dices[0]) == 5:
				lkniffel.text = "50"
				bottom_points_counter += 50
			else: 
				lkniffel.text = "0"
			selectsfx.play()
			for i in dices.size():
				lkniffelanim_array[i - 1].text = str(dices[i - 1])
				kniffelanim_array[i - 1].modulate = color_values[dices[i - 1] - 1]
			bottomactionsanimations.play("kniffel_select")
			buttom_actions[5] = true
			checkButtomActions()

func big_straight() -> void:
	if dices[0] != 0:
		if buttom_actions[4] == false:
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
			else:
				lbigstraight.text = "0"
			selectsfx.play()
			for i in dices.size():
				lbigstraightanim_array[i - 1].text = str(dices[i - 1])
				bigstraightanim_array[i - 1].modulate = color_values[dices[i - 1] - 1]
			bottomactionsanimations.play("big_straight_select")
			buttom_actions[4] = true
			checkButtomActions()

func small_straight() -> void:
	if dices[0] != 0:
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
				elif pdsize == 5:
					if pureDices[0] + 1 == pureDices[1] && pureDices[0] + 2 == pureDices[2] && pureDices[0] + 3 == pureDices[3]:
						is_small_straight = true
					elif pureDices[1] + 1 == pureDices[2] && pureDices[1] + 2 == pureDices[3] && pureDices[1] + 3 == pureDices[4]:
						is_small_straight = true
			if is_small_straight:
				lsmallstraight.text = "30"
				bottom_points_counter += 30
				for i in pureDices.size():
					lsmallstraightanim_array[i - 1].text = str(pureDices[i - 1])
					smallstraightanim_array[i - 1].modulate = color_values[pureDices[i - 1]]
			else:
				lsmallstraight.text = "0"
			selectsfx.play()
			bottomactionsanimations.play("small_straight_select")
			buttom_actions[3] = true
			checkButtomActions()

func x3() -> void:
	if dices[0] != 0:
		if buttom_actions[0] == false: 
			var x3dDice = 0
			dices.sort()
			var is_x3 = false
			for i in dice_count:
				if is_x3 == false:
					if dices.count(dices[i - 1]) >= 3:
						is_x3 = true
						x3dDice = dices[i - 1]
			if is_x3:
				var dice_value = 0
				for i in dice_count:
					dice_value += dices[i]
				bottom_points_counter += dice_value
				lx3.text = str(dice_value)
			else:
				lx3.text = "0"
			bottomactionsanimations.play("X3_select")
			selectsfx.play()
			buttom_actions[0] = true
			checkButtomActions()

func x4() -> void:
	if dices[0] != 0:
		if buttom_actions[1] == false: 
			dices.sort()
			var is_x4 = false
			for i in dice_count:
					if is_x4 == false:
						if dices.count(dices[i - 1]) >= 4:
							is_x4 = true
			if is_x4:
				var dice_value = 0
				for i in dice_count:
					dice_value += dices[i]
				bottom_points_counter += dice_value
				lx4.text = str(dice_value)
			else:
				lx4.text = "0"
			selectsfx.play()
			bottomactionsanimations.play("X4_select")
			buttom_actions[1] = true
			checkButtomActions()

func full_house() -> void:
	if dices[0] != 0:
		if buttom_actions[2] == false:
			dices.sort()
			var dif_dice
			var dice_counted = dices.count(dices[0])
			var dif_dice_counted = 0
			for i in dice_count:
				if dices[i] != dices[0]:
					dif_dice = dices[i]
					break
			dif_dice_counted = dices.count(dif_dice)
			if dice_counted == 3 && dif_dice_counted == 2:
				bottom_points_counter += 25
				lfullhouse.text = "25"
			elif dice_counted == 2 && dif_dice_counted == 3:
				bottom_points_counter += 25
				lfullhouse.text = "25"
			else:
				lfullhouse.text = "0"
			selectsfx.play()
			bottomactionsanimations.play("Full_House_select")
			buttom_actions[2] = true
			checkButtomActions()


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
	
	
	
	#Keyboard compatibility for Kniffelpaper
	if Input.is_action_just_pressed("1s"):
		topDs(1)
	if Input.is_action_just_pressed("2s"):
		topDs(2)
	if Input.is_action_just_pressed("3s"):
		topDs(3)
	if Input.is_action_just_pressed("4s"):
		topDs(4)
	if Input.is_action_just_pressed("5s"):
		topDs(5)
	if Input.is_action_just_pressed("6s"):
		topDs(6)
	if Input.is_action_just_pressed("3x"):
		x3()
	if Input.is_action_just_pressed("4x"):
		x4()
	if Input.is_action_just_pressed("Full_House"):
		full_house()
	if Input.is_action_just_pressed("small_straight"):
		small_straight()
	if Input.is_action_just_pressed("big_straight"):
		big_straight()
	if Input.is_action_just_pressed("kniffel"):
		kniffel()
	if Input.is_action_just_pressed("chance"):
		chance()


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

########################################################################
#####                      Buttons and Timers                      #####
########################################################################
#region --> Game relevant Actions
##############################
#####    Select Action    #####
###############################
func _on_one_select_button_pressed() -> void:
	topDs(1)

func _on_two_select_button_pressed() -> void:
	topDs(2)

func _on_three_select_button_pressed() -> void:
	topDs(3)

func _on_four_select_button_pressed() -> void:
	topDs(4)

func _on_five_select_button_pressed() -> void:
	topDs(5)

func _on_six_select_button_pressed() -> void:
	topDs(6)

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
		menu.visible = false
	else:
		$"../Menu/ColorRect".visible = true
		menu.visible = true

func _on_reload_button_pressed() -> void:
	selectsfx.play()
	get_tree().reload_current_scene()

func _on_control_button_pressed() -> void:
	selectsfx.play()
	if settingsmanager.visible:
		settingsmanager.visible = false
	else:
		settingsmanager.visible = true

func _on_control_button_2_pressed() -> void:
	selectsfx.play()
	if menu.visible:
		$"../Menu/ColorRect".visible = false
		menu.visible = false
	else:
		$"../Menu/ColorRect".visible = true
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

func _on_settings_menu_close_menu() -> void:
	$"../Menu/VBoxContainer".visible = false
	$"../Menu/ColorRect".visible = false

func _on_can_throw_timer_timeout() -> void:
	can_throw = true

func _on_upgrade_menu_selected_upgrade(upgrade: Variant) -> void:
	var pickedUpgrades : Array = []
	pickedUpgrades.append(upgrade)
