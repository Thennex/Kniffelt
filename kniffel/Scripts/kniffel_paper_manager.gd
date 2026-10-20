extends Node2D

@onready var extrasfx: AudioStreamPlayer2D = $AudioStreamPlayer2D



#region all variables for paths
@onready var gamemanager: Node2D = $"../GameManager"

@onready var animtoplayer: AnimationPlayer = $AnimationPlayer
@onready var animbottomplayer: AnimationPlayer = $SelectActionButtom/Sprites_for_anim/BottomActionsAnimations

####################
#####  Points  #####
####################
@onready var ltoppoints: Label = $KniffelBonusMeter/KniffelTopCounter
@onready var lbottompoints: Label = $PointCounters/LabelBottomPoints
@onready var lpoints_array : Array = [ltoppoints, lbottompoints]


@onready var actiond1controls: Control = $SelectAction/DLabelsBackground/D1Labels
@onready var actiond2controls: Control = $SelectAction/DLabelsBackground/D2Labels
@onready var actiond3controls: Control = $SelectAction/DLabelsBackground/D3Labels
@onready var actiond4controls: Control = $SelectAction/DLabelsBackground/D4Labels
@onready var actiond5controls: Control = $SelectAction/DLabelsBackground/D5Labels
@onready var actiond6controls: Control = $SelectAction/DLabelsBackground/D6Labels
@onready var actioncontrols_array: Array = [actiond1controls, actiond2controls, actiond3controls, actiond4controls, actiond5controls, actiond6controls]



#region sprite path for top actions 
@onready var d1d1selectcolor: Sprite2D = $"SelectAction/D1/D1"
@onready var d1d2selectcolor: Sprite2D = $"SelectAction/D1/D2"
@onready var d1d3selectcolor: Sprite2D = $"SelectAction/D1/D3"
@onready var d1selectcolor_array : Array = [d1d1selectcolor, d1d2selectcolor, d1d3selectcolor]

@onready var d2d1selectcolor: Sprite2D = $"SelectAction/D2/D1"
@onready var d2d2selectcolor: Sprite2D = $"SelectAction/D2/D2"
@onready var d2d3selectcolor: Sprite2D = $"SelectAction/D2/D3"
@onready var d2selectcolor_array : Array = [d2d1selectcolor, d2d2selectcolor, d2d3selectcolor]

@onready var d3d1selectcolor: Sprite2D = $"SelectAction/D3/D1"
@onready var d3d2selectcolor: Sprite2D = $"SelectAction/D3/D2"
@onready var d3d3selectcolor: Sprite2D = $"SelectAction/D3/D3"
@onready var d3selectcolor_array : Array = [d3d1selectcolor, d3d2selectcolor, d3d3selectcolor]

@onready var d4d1selectcolor: Sprite2D = $"SelectAction/D4/D1"
@onready var d4d2selectcolor: Sprite2D = $"SelectAction/D4/D2"
@onready var d4d3selectcolor: Sprite2D = $"SelectAction/D4/D3"
@onready var d4selectcolor_array : Array = [d4d1selectcolor, d4d2selectcolor, d4d3selectcolor]

@onready var d5d1selectcolor: Sprite2D = $"SelectAction/D5/D1"
@onready var d5d2selectcolor: Sprite2D = $"SelectAction/D5/D2"
@onready var d5d3selectcolor: Sprite2D = $"SelectAction/D5/D3"
@onready var d5selectcolor_array : Array = [d5d1selectcolor, d5d2selectcolor, d5d3selectcolor]

@onready var d6d1selectcolor: Sprite2D = $"SelectAction/D6/D1"
@onready var d6d2selectcolor: Sprite2D = $"SelectAction/D6/D2"
@onready var d6d3selectcolor: Sprite2D = $"SelectAction/D6/D3"
@onready var d6selectcolor_array : Array = [d6d1selectcolor, d6d2selectcolor, d6d3selectcolor]

@onready var dselectcolor_array : Array = [d1selectcolor_array, d2selectcolor_array, d3selectcolor_array, d4selectcolor_array, d5selectcolor_array, d6selectcolor_array]
#endregion

#region labels and sprites for bottom action animations
#x3d label for anim
@onready var lx3danim1: Label = $"SelectActionButtom/Sprites_for_anim/x3D_for_anim/D1/Label"
@onready var lx3danim2: Label = $"SelectActionButtom/Sprites_for_anim/x3D_for_anim/D2/Label"
@onready var lx3danim3: Label = $"SelectActionButtom/Sprites_for_anim/x3D_for_anim/D3/Label"
@onready var lx3danim_array : Array = [lx3danim1, lx3danim2, lx3danim3]
@onready var x3danim1: Sprite2D = $"SelectActionButtom/Sprites_for_anim/x3D_for_anim/D1"
@onready var x3danim2: Sprite2D = $"SelectActionButtom/Sprites_for_anim/x3D_for_anim/D2"
@onready var x3danim3: Sprite2D = $"SelectActionButtom/Sprites_for_anim/x3D_for_anim/D3"
@onready var x3danim_array : Array = [x3danim1, x3danim2, x3danim3]

#x4d label for anim
@onready var lx4danim1: Label = $"SelectActionButtom/Sprites_for_anim/x4D_for_anim/D1/Label"
@onready var lx4danim2: Label = $"SelectActionButtom/Sprites_for_anim/x4D_for_anim/D2/Label"
@onready var lx4danim3: Label = $"SelectActionButtom/Sprites_for_anim/x4D_for_anim/D3/Label"
@onready var lx4danim4: Label = $"SelectActionButtom/Sprites_for_anim/x4D_for_anim/D4/Label"
@onready var lx4danim_array : Array = [lx4danim1, lx4danim2, lx4danim3, lx4danim4]
@onready var x4danim1: Sprite2D = $"SelectActionButtom/Sprites_for_anim/x4D_for_anim/D1"
@onready var x4danim2: Sprite2D = $"SelectActionButtom/Sprites_for_anim/x4D_for_anim/D2"
@onready var x4danim3: Sprite2D = $"SelectActionButtom/Sprites_for_anim/x4D_for_anim/D3"
@onready var x4danim4: Sprite2D = $"SelectActionButtom/Sprites_for_anim/x4D_for_anim/D4"
@onready var x4danim_array : Array = [x4danim1, x4danim2, x4danim3, x4danim4]

# full house label for anim
@onready var lfulllhouseanim1: Label = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D1/Label"
@onready var lfulllhouseanim2: Label = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D2/Label"
@onready var lfulllhouseanim3: Label = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D3/Label"
@onready var lfulllhouseanim4: Label = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D4/Label"
@onready var lfulllhouseanim5: Label = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D5/Label"
@onready var lfullhouseanim_array : Array = [lfulllhouseanim1, lfulllhouseanim2, lfulllhouseanim3, lfulllhouseanim4, lfulllhouseanim5]
@onready var fulllhouseanim1: Sprite2D = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D1"
@onready var fulllhouseanim2: Sprite2D = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D2"
@onready var fulllhouseanim3: Sprite2D = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D3"
@onready var fulllhouseanim4: Sprite2D = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D4"
@onready var fulllhouseanim5: Sprite2D = $"SelectActionButtom/Sprites_for_anim/FullHouseD_for_anim/D5"
@onready var fullhouseanim_array : Array = [fulllhouseanim1, fulllhouseanim2, fulllhouseanim3, fulllhouseanim4, fulllhouseanim5]

#smallstraight label for anim
@onready var lsmallstraightanim1: Label = $"SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D1/Label"
@onready var lsmallstraightanim2: Label = $"SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D2/Label"
@onready var lsmallstraightanim3: Label = $"SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D3/Label"
@onready var lsmallstraightanim4: Label = $"SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D4/Label"
@onready var lsmallstraightanim_array : Array = [lsmallstraightanim1, lsmallstraightanim2, lsmallstraightanim3, lsmallstraightanim4]
@onready var smallstraightanim1: Sprite2D = $"SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D1"
@onready var smallstraightanim2: Sprite2D = $"SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D2"
@onready var smallstraightanim3: Sprite2D = $"SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D3"
@onready var smallstraightanim4: Sprite2D = $"SelectActionButtom/Sprites_for_anim/SmallStraightD_for_anim/D4"
@onready var smallstraightanim_array : Array = [smallstraightanim1, smallstraightanim2, smallstraightanim3, smallstraightanim4]

#bigstraight label for anim
@onready var lbigstraightanim1: Label = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D1/Label"
@onready var lbigstraightanim2: Label = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D2/Label"
@onready var lbigstraightanim3: Label = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D3/Label"
@onready var lbigstraightanim4: Label = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D4/Label"
@onready var lbigstraightanim5: Label = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D5/Label"
@onready var lbigstraightanim_array : Array = [lbigstraightanim1, lbigstraightanim2, lbigstraightanim3, lbigstraightanim4, lbigstraightanim5]
@onready var bigstraightanim1: Sprite2D = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D1"
@onready var bigstraightanim2: Sprite2D = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D2"
@onready var bigstraightanim3: Sprite2D = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D3"
@onready var bigstraightanim4: Sprite2D = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D4"
@onready var bigstraightanim5: Sprite2D = $"SelectActionButtom/Sprites_for_anim/BigStraightD_for_anim/D5"
@onready var bigstraightanim_array : Array = [bigstraightanim1, bigstraightanim2, bigstraightanim3, bigstraightanim4, bigstraightanim5]

#Kniffel label for anim
@onready var lkniffelanim1: Label = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D1/Label"
@onready var lkniffelanim2: Label = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D2/Label"
@onready var lkniffelanim3: Label = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D3/Label"
@onready var lkniffelanim4: Label = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D4/Label"
@onready var lkniffelanim5: Label = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D5/Label"
@onready var lkniffelanim_array : Array = [lkniffelanim1, lkniffelanim2, lkniffelanim3, lkniffelanim4, lkniffelanim5]
@onready var kniffelanimd1: Sprite2D = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D1"
@onready var kniffelanimd2: Sprite2D = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D2"
@onready var kniffelanimd3: Sprite2D = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D3"
@onready var kniffelanimd4: Sprite2D = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D4"
@onready var kniffelanimd5: Sprite2D = $"SelectActionButtom/Sprites_for_anim/KniffelD_for_anim/D5"
@onready var kniffelanim_array : Array = [kniffelanimd1, kniffelanimd2, kniffelanimd3, kniffelanimd4, kniffelanimd5]


#chance label for anim
@onready var lchanceanim1: Label = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D1/Label"
@onready var lchanceanim2: Label = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D2/Label"
@onready var lchanceanim3: Label = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D3/Label"
@onready var lchanceanim4: Label = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D4/Label"
@onready var lchanceanim5: Label = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D5/Label"
@onready var lchanceanim_array : Array = [lchanceanim1, lchanceanim2, lchanceanim3, lchanceanim4, lchanceanim5]
@onready var chanceanim1: Sprite2D = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D1"
@onready var chanceanim2: Sprite2D = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D2"
@onready var chanceanim3: Sprite2D = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D3"
@onready var chanceanim4: Sprite2D = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D4"
@onready var chanceanim5: Sprite2D = $"SelectActionButtom/Sprites_for_anim/ChanceD_for_anim/D5"
@onready var chanceanim_array : Array = [chanceanim1, chanceanim2, chanceanim3, chanceanim4, chanceanim5]
#endregion

####################
#####  Labels  #####
####################
@onready var d1color: Node2D = $"SelectAction/D1"
@onready var d2color: Node2D = $"SelectAction/D2"
@onready var d3color: Node2D = $"SelectAction/D3"
@onready var d4color: Node2D = $"SelectAction/D4"
@onready var d5color: Node2D = $"SelectAction/D5"
@onready var d6color: Node2D = $"SelectAction/D6"
@onready var dcolor_array : Array = [d1color, d2color, d3color, d4color, d5color, d6color]

@onready var sd1: Button = $"../Dices/DiceContainer/D1"
@onready var sd2: Button = $"../Dices/DiceContainer/D2"
@onready var sd3: Button = $"../Dices/DiceContainer/D3"
@onready var sd4: Button = $"../Dices/DiceContainer/D4"
@onready var sd5: Button = $"../Dices/DiceContainer/D5"

@onready var bkniffel: Button = $"SelectActionButtom/Kniffel"
@onready var bchance: Button = $"SelectActionButtom/Chance"
@onready var bx_3: Button = $"SelectActionButtom/x3"
@onready var bx_4: Button = $"SelectActionButtom/x4"
@onready var bbig_straigth: Button = $"SelectActionButtom/BigStraigth"
@onready var bsmall_straigth: Button = $"SelectActionButtom/SmallStraigth"
@onready var bfull_house: Button = $"SelectActionButtom/FullHouse"

#################################
#####  Pointcounter Labels  #####
#################################
@onready var l1: Label = $"PointCounters/Label1"
@onready var l2: Label = $"PointCounters/Label2"
@onready var l3: Label = $"PointCounters/Label3"
@onready var l4: Label = $"PointCounters/Label4"
@onready var l5: Label = $"PointCounters/Label5"
@onready var l6: Label = $"PointCounters/Label6"
@onready var l_array : Array = [l1, l2, l3, l4, l5, l6]

@onready var lx3: Label = $"PointCounters/LabelX3"
@onready var lx4: Label = $"PointCounters/LabelX4"
@onready var lfullhouse: Label = $"PointCounters/LabelFullHouse"
@onready var lsmallstraight: Label = $"PointCounters/LabelSmallStraight"
@onready var lbigstraight: Label = $"PointCounters/LabelBigStraight"
@onready var lkniffel: Label = $"PointCounters/LabelKniffel"
@onready var lchance: Label = $"PointCounters/LabelChance"
@onready var lbottompoints_array : Array = [lx3, lx4, lfullhouse , lsmallstraight, lbigstraight, lkniffel, lchance]

#region change label
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

@onready var lx3d1: Label = $"SelectActionButtom/x3D/D1/Label"
@onready var lx3d2: Label = $"SelectActionButtom/x3D/D2/Label"
@onready var lx3d3: Label = $"SelectActionButtom/x3D/D3/Label"
@onready var lx3d_array : Array = [lx3d1, lx3d2, lx3d3]

@onready var lx4d1: Label = $"SelectActionButtom/x4D/D1/Label"
@onready var lx4d2: Label = $"SelectActionButtom/x4D/D2/Label"
@onready var lx4d3: Label = $"SelectActionButtom/x4D/D3/Label"
@onready var lx4d4: Label = $"SelectActionButtom/x4D/D4/Label"
@onready var lx4d_array : Array = [lx4d1, lx4d2, lx4d3, lx4d4]

@onready var lkniffeld1: Label = $"SelectActionButtom/KniffelD/D1/Label"
@onready var lkniffeld2: Label = $"SelectActionButtom/KniffelD/D2/Label"
@onready var lkniffeld3: Label = $"SelectActionButtom/KniffelD/D3/Label"
@onready var lkniffeld4: Label = $"SelectActionButtom/KniffelD/D4/Label"
@onready var lkniffeld5: Label = $"SelectActionButtom/KniffelD/D5/Label"
@onready var lkniffel_array : Array = [lkniffeld1, lkniffeld2, lkniffeld3, lkniffeld4, lkniffeld5]

@onready var lchanced1: Label = $"SelectActionButtom/ChanceD/D1/Label"
@onready var lchanced2: Label = $"SelectActionButtom/ChanceD/D2/Label"
@onready var lchanced3: Label = $"SelectActionButtom/ChanceD/D3/Label"
@onready var lchanced4: Label = $"SelectActionButtom/ChanceD/D4/Label"
@onready var lchanced5: Label = $"SelectActionButtom/ChanceD/D5/Label"
@onready var lchance_array : Array = [lchanced1, lchanced2, lchanced3, lchanced4, lchanced5]

@onready var lbigstraightd1: Label = $"SelectActionButtom/BigStraightD/D1/Label"
@onready var lbigstraightd2: Label = $"SelectActionButtom/BigStraightD/D2/Label"
@onready var lbigstraightd3: Label = $"SelectActionButtom/BigStraightD/D3/Label"
@onready var lbigstraightd4: Label = $"SelectActionButtom/BigStraightD/D4/Label"
@onready var lbigstraightd5: Label = $"SelectActionButtom/BigStraightD/D5/Label"
@onready var lbigstraight_array : Array = [lbigstraightd1, lbigstraightd2, lbigstraightd3, lbigstraightd4, lbigstraightd5]

@onready var lsmallstraightd1: Label = $"SelectActionButtom/SmallStraightD/D1/Label"
@onready var lsmallstraightd2: Label = $"SelectActionButtom/SmallStraightD/D2/Label"
@onready var lsmallstraightd3: Label = $"SelectActionButtom/SmallStraightD/D3/Label"
@onready var lsmallstraightd4: Label = $"SelectActionButtom/SmallStraightD/D4/Label"
@onready var lsmallstraight_array : Array = [lsmallstraightd1, lsmallstraightd2, lsmallstraightd3, lsmallstraightd4]

@onready var lfullhoused1: Label = $"SelectActionButtom/FullHouseD/D1/Label"
@onready var lfullhoused2: Label = $"SelectActionButtom/FullHouseD/D2/Label"
@onready var lfullhoused3: Label = $"SelectActionButtom/FullHouseD/D3/Label"
@onready var lfullhoused4: Label = $"SelectActionButtom/FullHouseD/D4/Label"
@onready var lfullhoused5: Label = $"SelectActionButtom/FullHouseD/D5/Label"
@onready var lfullhouse_array : Array = [lfullhoused1, lfullhoused2, lfullhoused3, lfullhoused4, lfullhoused5]
#endregion
#endregion

#region VARIABLES
########################################################################
#####                           Variables                          #####
########################################################################
var dice_unlocked = preload("uid://bxywxlj5wl2te")

#################################
#####   Variables for End   #####
#################################
var done : int = 0
var number_counter_array : Array = [0, 0, 0, 0, 0, 0]

####################################
#####   Variables for Points   #####
####################################
@onready var all_points : int = 0
@onready var bonus_points : int = 0
@onready var top_points_counter : int = 0
@onready var bottom_points_counter : int = 0
@onready var point_array : Array = [top_points_counter, bottom_points_counter, bonus_points, all_points]

#####################################
#####   Variables for Showers   #####
#####################################
var changeDieMemory : int = 1
var small_straight_memory : int = 1
var big_straight_memory : int = 1

###################################
#####   Variables for Bonus   #####
###################################
@export var bonus_treashold : int = 63
@export var bonus_amount : int = 35 

#for dynamic animations in method for top action calc
@onready var dice_top_anim_array : Array = ["D1", "D2", "D3", "D4", "D5", "D6"]
@onready var dice_bottom_anim_array : Array = ["X3", "X4", "Full_House", "small_straight", "big_straight", "Kniffel", "chance"]

var can_select : bool = true

var top_dices_count_array : Array[int] = [0, 0, 0, 0, 0, 0]
var chance_dices_array : Array = [0, 0, 0, 0, 0]
var top_points_array : Array = ["", "", "", "", "", "",""]
var bottom_points_array : Array = ["", "", "", "", "", "","", ""]
var actions : Array = [false, false, false, false, false, false]
var buttom_actions : Array = [false, false, false, false, false, false, false]
#endregion

#region --> Functions for calculating and chosing the chosen Action
#######################################################################
#####                  funcs for chosing actions                  #####
#######################################################################
func topDs(number) -> void:
	if gamemanager.dices[0] == 0:	return 
	var dice_counted = number
	if actions[dice_counted - 1] == true:	return 
	if gamemanager.dices.count(dice_counted) >= 1:
		gamemanager.diceValues[dice_counted - 1] = gamemanager.dices.count(dice_counted) * dice_counted
	print(top_dices_count_array)
	top_dices_count_array[dice_counted - 1] = clampi(gamemanager.dices.count(dice_counted), 0, 3)
	print(top_dices_count_array)
	for i in top_dices_count_array[dice_counted - 1]:
		dselectcolor_array[dice_counted - 1][i].texture = dice_unlocked
		dselectcolor_array[dice_counted - 1][i].modulate = gamemanager.color_values[dice_counted - 1]
	l_array[dice_counted - 1].text = str(gamemanager.diceValues[dice_counted - 1])
	top_points_array[dice_counted - 1] = str(gamemanager.diceValues[dice_counted - 1])
	top_points_counter += gamemanager.diceValues[dice_counted - 1]
	actions[dice_counted - 1] = true
	animtoplayer.play(dice_top_anim_array[dice_counted - 1] + "_select")
	gamemanager.selectsfx.play()
	checkActions()


func x3() -> void:
	if can_select == false:	return
	if gamemanager.dices[0] != 0:
		if buttom_actions[0] == false: 
			var x3dDice = 0
			gamemanager.dices.sort()
			var is_x3 = false
			for i in gamemanager.dices.size():
				if is_x3 == false:
					if gamemanager.dices.count(gamemanager.dices[i - 1]) >= 3:
						is_x3 = true
						x3dDice = gamemanager.dices[i - 1]
			if is_x3:
				var dice_value = 0
				for i in gamemanager.dices.size():
					dice_value += gamemanager.dices[i]
				for i in x3danim_array.size():
					lx3danim_array[i - 1].text = str(x3dDice)
					x3danim_array[i - 1].modulate = gamemanager.color_values[x3dDice - 1]
					x3danim_array[i - 1].texture = dice_unlocked
				bottom_points_counter += dice_value
				lx3.text = str(dice_value)
				bottom_points_array[0] = str(dice_value)
			else:
				lx3.text = ""
				for i in x3danim_array.size():
					lx3danim_array[i - 1].text = ""
			animbottomplayer.play("X3_select")
			extrasfx.play()
			gamemanager.selectsfx.play()
			buttom_actions[0] = true
			checkButtomActions()
			await animbottomplayer.animation_finished
			can_select = true

func x4() -> void:
	if can_select == false:	return
	if gamemanager.dices[0] != 0:
		if buttom_actions[1] == false: 
			gamemanager.dices.sort()
			var x4dDice
			var is_x4 = false
			for i in gamemanager.dices.size():
					if is_x4 == false:
						if gamemanager.dices.count(gamemanager.dices[i - 1]) >= 4:
							x4dDice = gamemanager.dices[i - 1]
							is_x4 = true
			if is_x4:
				var dice_value = 0
				for i in gamemanager.dices.size():
					dice_value += gamemanager.dices[i]
				for i in x4danim_array.size():
					lx4danim_array[i - 1].text = str(x4dDice)
					x4danim_array[i - 1].modulate = gamemanager.color_values[x4dDice - 1]
					x4danim_array[i - 1].texture = dice_unlocked
				bottom_points_counter += dice_value
				lx4.text = str(dice_value)
				bottom_points_array[1] = str(dice_value)
			else:
				lx4.text = ""
				for i in x4danim_array.size():
					lx4danim_array[i - 1].text = ""
			gamemanager.selectsfx.play()
			animbottomplayer.play("X4_select")
			extrasfx.play()
			buttom_actions[1] = true
			checkButtomActions()
			await animbottomplayer.animation_finished
			can_select = true

func full_house() -> void:
	if can_select == false:	return
	if gamemanager.dices[0] != 0:
		if buttom_actions[2] == false:
			gamemanager.dices.sort()
			var dif_dice
			var dice_counted = gamemanager.dices.count(gamemanager.dices[0])
			var dif_dice_counted = 0
			for i in gamemanager.dices.size():
				if gamemanager.dices[i] != gamemanager.dices[0]:
					dif_dice = gamemanager.dices[i]
					break
			dif_dice_counted = gamemanager.dices.count(dif_dice)
			if dice_counted == 3 && dif_dice_counted == 2 or dice_counted == 2 && dif_dice_counted == 3:
				bottom_points_counter += 25
				lfullhouse.text = "25"
				bottom_points_array[2] = "25"
				gamemanager.dices.sort()
				for i in gamemanager.dices.size():
					lfullhouseanim_array[i - 1].text = str(gamemanager.dices[i - 1])
					fullhouseanim_array[i - 1].modulate = gamemanager.color_values[gamemanager.dices[i - 1] - 1]
					fullhouseanim_array[i - 1].texture = dice_unlocked
			else:
				lfullhouse.text = ""
				for i in gamemanager.dices.size():
					lfullhouseanim_array[i - 1].text = ""
			gamemanager.selectsfx.play()
			animbottomplayer.play("Full_House_select")
			extrasfx.play()
			buttom_actions[2] = true
			checkButtomActions()
			await animbottomplayer.animation_finished
			can_select = true

func small_straight() -> void:
	if can_select == false:	return
	if gamemanager.dices[0] != 0:
		if buttom_actions[3] == false:
			var is_small_straight = false
			var pureDices = []
			for i in gamemanager.dices.size():
				if !pureDices.has(gamemanager.dices[i - 1]):
					pureDices.append(gamemanager.dices[i - 1]) 
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
				bottom_points_array[3] = "30"
				bottom_points_counter += 30
				for i in pureDices.size():
					gamemanager.dices.sort()
					lsmallstraightanim_array[i - 1].text = str(pureDices[i - 1])
					smallstraightanim_array[i - 1].modulate = gamemanager.color_values[pureDices[i - 1] - 1]
					smallstraightanim_array[i - 1].texture = dice_unlocked
			else:
				lsmallstraight.text = ""
				for i in 4:
					lsmallstraightanim_array[i - 1].text = ""
			gamemanager.selectsfx.play()
			animbottomplayer.play("small_straight_select")
			extrasfx.play()
			buttom_actions[3] = true
			checkButtomActions()
			await animbottomplayer.animation_finished
			can_select = true

func big_straight() -> void:
	if can_select == false:	return
	if gamemanager.dices[0] != 0:
		if buttom_actions[4] == false:
			var is_big_straight = false
			var pureDices = []
			for i in gamemanager.dices.size():
				if !pureDices.has(gamemanager.dices[i - 1]):
					pureDices.append(gamemanager.dices[i - 1]) 
			pureDices.sort()
			var pdsize = pureDices.size()
			if pdsize == 5:
				if pureDices[0] + 1 == pureDices[1] && pureDices[0] + 2 == pureDices[2] && pureDices[0] + 3 == pureDices[3] && pureDices[0] + 4  == pureDices[4]:
					is_big_straight = true
			if is_big_straight:
				lbigstraight.text = "40"
				bottom_points_array[4] = "40"
				bottom_points_counter +=40
				gamemanager.dices.sort()
				for i in gamemanager.dices.size():
					lbigstraightanim_array[i - 1].text = str(gamemanager.dices[i - 1])
					bigstraightanim_array[i - 1].modulate = gamemanager.color_values[gamemanager.dices[i - 1] - 1]
					bigstraightanim_array[i - 1].texture = dice_unlocked
			else:
				lbigstraight.text = ""
				for i in gamemanager.dices.size():
					lbigstraightanim_array[i - 1].text = ""
					chance_dices_array[i - 1] = gamemanager.dices[i - 1]
			gamemanager.selectsfx.play()
			animbottomplayer.play("big_straight_select")
			extrasfx.play()
			buttom_actions[4] = true
			checkButtomActions()
			await animbottomplayer.animation_finished
			can_select = true

func kniffel() -> void:
	if can_select == false:	return
	if gamemanager.dices[0] != 0:
		if buttom_actions[5] == false:
			if gamemanager.dices.count(gamemanager.dices[0]) == 5:
				lkniffel.text = "50"
				bottom_points_array[5] = "25"
				bottom_points_counter += 50
				for i in gamemanager.dices.size():
					lkniffelanim_array[i - 1].text = str(gamemanager.dices[i - 1])
					kniffelanim_array[i - 1].modulate = gamemanager.color_values[gamemanager.dices[i - 1] - 1]
					kniffelanim_array[i - 1].texture = dice_unlocked
			else: 
				lkniffel.text = ""
				for i in gamemanager.dices.size():
					lkniffelanim_array[i - 1].text = ""
			gamemanager.selectsfx.play()
			animbottomplayer.play("kniffel_select")
			extrasfx.play()
			buttom_actions[5] = true
			checkButtomActions()
			await animbottomplayer.animation_finished
			can_select = true

func chance() -> void:
	if can_select == false:	return
	if gamemanager.dices[0] != 0:
		if buttom_actions[6] == false:
			var all_dice_value = gamemanager.allDiceCounted()
			bottom_points_counter += all_dice_value
			lchance.text = str(all_dice_value)
			bottom_points_array[6] = str(all_dice_value)
			gamemanager.selectsfx.play()
			animbottomplayer.play("chance_select")
			extrasfx.play()
			gamemanager.dices.sort()
			for i in gamemanager.dices.size():
				chance_dices_array[i - 1] = gamemanager.dices[i - 1]
				lchanceanim_array[i - 1].text = str(gamemanager.dices[i - 1])
				chanceanim_array[i - 1].modulate = gamemanager.color_values[gamemanager.dices[i - 1] - 1]
			buttom_actions[6] = true
			checkButtomActions()
			await animbottomplayer.animation_finished
			can_select = true
#endregion

func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y,
		"done" : done, 
		"top_dices_count_array" : top_dices_count_array,
		"chance_dices_array" : chance_dices_array,
		"top_points_array" : top_points_array,
		"bottom_points_array" : bottom_points_array,
		"number_counter_array" : number_counter_array,
		"all_points" : all_points,
		"bonus_points" : bonus_points,
		"top_points_counter" : top_points_counter,
		"bottom_points_counter" : bottom_points_counter,
		"bonus_treashold" : bonus_treashold,
		"bonus_amount" : bonus_amount,
		"actions" : actions,
		"buttom_actions" : buttom_actions,
		"can_select" : can_select,
		"z_index" : z_index,
		}
	return save_dict 



func loadPaper():
	point_array[0] = top_points_counter
	point_array[1] = bottom_points_counter
	point_array[2] = bonus_points
	point_array[3] = all_points
	for i in actions.size():
		if actions[i]:
			animtoplayer.play(dice_top_anim_array[i] + "_select")
			await animtoplayer.animation_finished
			l_array[i].text = top_points_array[i]
			for j in top_dices_count_array:
				dselectcolor_array[i][j].texture = dice_unlocked
				dselectcolor_array[i][j].modulate = gamemanager.color_values[i]
	for i in buttom_actions.size():
		if buttom_actions[i]:
			animbottomplayer.play(dice_bottom_anim_array[i] + "_select")
			await animbottomplayer.animation_finished
			lbottompoints_array[i].text = bottom_points_array[i]
			match i:
				6:
					for l in lchanceanim_array.size():
						lchanceanim_array[l].text = str(int(chance_dices_array[l]))
						lchanceanim_array[l].modulate = gamemanager.color_values[int(chance_dices_array[l]) - 1] 
						chanceanim_array[l].modulate = gamemanager.color_values[int(chance_dices_array[l]) - 1]
	for i in lpoints_array.size():
		print(point_array)
		lpoints_array[i].text = str(point_array[i])


#######################################################################
#####                      funcs for the end                      #####
#######################################################################
func setAllPoints(point_counter) -> void:
	$"../EndMenu/Control/pointLabel".text = str(point_counter)
	$"../EndMenu/Control/pointLabel".rotation -= .25 * get_process_delta_time()
	$"../EndMenu/Control/pointLabel/AnimationPlayer".play("allPoints_pop")
	if !gamemanager.countersfx.has_stream_playback():
		gamemanager.countersfx.play()
		gamemanager.selectsfx.play()
		gamemanager.countersfx.pitch_scale += .05

func end() -> void:
	if done == 2:
		gamemanager.end()
		all_points += top_points_counter
		all_points += bottom_points_counter
		$"../EndMenu".visible = true
		var tweenPoints = create_tween()
		tweenPoints.tween_method(setAllPoints, 0 , all_points, 1)
		await tweenPoints.finished
		$"../EndMenu/Control/pointLabel".rotation = 0

#######################################################################
#####              funcs for checking bottom actions              #####
#######################################################################
func setBottomCounter(bottom_counter) -> void:
	lbottompoints.text = str(bottom_counter)
	lbottompoints.rotation -= .5 * get_process_delta_time()
	$"PointCounters/LabelBottomPoints/AnimationPlayer".play("Bottom_counter_pop")
	if !gamemanager.countersfx.has_stream_playback():
		gamemanager.countersfx.play()
		$"PointCounters/LabelBottomPoints/CPUParticles2D".emitting = true
		gamemanager.countersfx.pitch_scale += .025
		gamemanager.selectsfx.volume_db = 7
		gamemanager.selectsfx.play()
		await gamemanager.selectsfx.finished
		gamemanager.selectsfx.volume_db = 0

func checkButtomActions() -> void:
	gamemanager.resetDice()
	gamemanager.countersfx.pitch_scale = 1
	if int(lbottompoints.text) != bottom_points_counter:
		var duration = float(bottom_points_counter - int(lbottompoints.text))/100 if float(bottom_points_counter - int(lbottompoints.text))/100 > 0.3 else 0.3 
		var tween3 = create_tween()
		tween3.tween_method(setBottomCounter, int(lbottompoints.text), bottom_points_counter, duration).set_trans(Tween.TRANS_EXPO)
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

####################################################################
#####              funcs for checking top actions              #####
####################################################################
func setTopCounter(top_counter) -> void:
	ltoppoints.text = str(top_counter)
	ltoppoints.rotation -= .5 * get_process_delta_time()
	if !gamemanager.countersfx.has_stream_playback():
		gamemanager.countersfx.play()
		$KniffelBonusMeter/KniffelTopCounter/CPUParticles2D.emitting = true
		$KniffelBonusMeter/KniffelTopCounter/AnimationPlayer.play("pop")
		gamemanager.countersfx.pitch_scale += .05
		gamemanager.selectsfx.volume_db = 7
		gamemanager.selectsfx.play()
		await gamemanager.selectsfx.finished
		gamemanager.selectsfx.volume_db = 0


func set_BarValue(value):
	$KniffelBonusMeter/TextureProgressBar.value = value

func checkActions() -> void:
	gamemanager.resetDice()
	gamemanager.countersfx.pitch_scale = 1
	var tween = create_tween()
	$KniffelBonusMeter/TextureProgressBarFast.value = top_points_counter + 0.2
	tween.tween_method(set_BarValue, int(ltoppoints.text), top_points_counter, 0.4,).set_trans(Tween.TRANS_EXPO)
	if int(ltoppoints.text) != top_points_counter:
		var duration = .3
		var tween1 = create_tween()
		tween1.tween_method(setTopCounter, int(ltoppoints.text), top_points_counter, duration)
		await tween.finished
		ltoppoints.rotation = 0
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
			await tween1.finished
			ltoppoints.rotation = 0
			done += 1
			end()
		else:
			lbottompoints.rotation = 0
			done += 1
			end()

#######################################################################
#####                 checking points after throw                 #####
#######################################################################
func checkTopActionsPoints():
	for i in 6:
		if actions[i] == false:
			if gamemanager.dices.count((i + 1)) >= 1:
				l_array[i].text = str(gamemanager.dices.count(i + 1) * (i+1))
			else:
				l_array[i].text = ""

#match example
#match param3:
		#3:
			#print("param3 is 3!")
		#_:
			#print("param3 is not 3!")



#implement it with cases 
func checkBottomActionsPoints():
	var dices : Array = gamemanager.dices
	for i in 7:
		if buttom_actions[i] == false:
			if i == 0:
				var tmp_bool : bool = false
				for j in dices.size():
					if dices.count(j + 1) >= 3:
						tmp_bool = true
				if tmp_bool:
					lx3.text = str(gamemanager.allDiceCounted())
				else:
					lx3.text = ""
			if i == 1:
				var tmp_bool : bool = false
				for j in dices.size():
					if dices.count(j + 1) >= 4:
						tmp_bool = true
				if tmp_bool:
					lx4.text = str(gamemanager.allDiceCounted())
				else:
					lx4.text = ""
			if i == 2:
				var dif_dice
				var dice_counted = dices.count(dices[0])
				var dif_dice_counted := 0
				for l in dices.size():
					if dices[l] != dices[0]:
						dif_dice = dices[l]
				dif_dice_counted = dices.count(dif_dice)
				if dice_counted == 3 && dif_dice_counted == 2 or dice_counted == 2 && dif_dice_counted == 3:
					lfullhouse.text = "25"
				else:
					lfullhouse.text = ""
			if i == 3:
				var is_small_straight = false
				var pureDices : Array = []
				for l in dices.size():
					if !pureDices.has(dices[l]):
						pureDices.append(dices[l]) 
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
				else:
					lsmallstraight.text = ""
			if i == 4:
				var is_big_straight : bool = false
				var pureDices : Array = []
				for l in dices.size():
					if !pureDices.has(dices[l - 1]):
						pureDices.append(dices[l - 1]) 
				pureDices.sort()
				if pureDices.size() == 5:
					if pureDices[0] + 1 == pureDices[1] && pureDices[0] + 2 == pureDices[2] && pureDices[0] + 3 == pureDices[3] && pureDices[0] + 4  == pureDices[4]:
						is_big_straight = true
				if is_big_straight:
					lbigstraight.text = "40"
			if i == 5:
				if dices.count(dices[0]) == 5:
					lkniffel.text = "50"
				else:
					lkniffel.text = ""
			if i == 6:
				lchance.text = str(gamemanager.allDiceCounted())

#########################################################
#####                 change showers                #####
#########################################################
func changeShowers() -> void:
	for i in lx3d_array.size():
		lx3d_array[i - 1].text = str(changeDieMemory)
		lx3d_array[i - 1].modulate = gamemanager.color_values[changeDieMemory - 1]
	for i in lx4d_array.size():
		lx4d_array[i - 1].text = str(changeDieMemory)
		lx4d_array[i - 1].modulate = gamemanager.color_values[changeDieMemory - 1]
	for i in lkniffel_array.size():
		lkniffel_array[i - 1].text = str(changeDieMemory)
		lkniffel_array[i - 1].modulate = gamemanager.color_values[changeDieMemory - 1]
	for i in lchance_array.size():
		lchance_array[i - 1].text = str(RandomNumberGenerator.new().randi_range(1,6))
		lchance_array[i - 1].modulate = gamemanager.color_values[int(lchance_array[i - 1].text) - 1]
	lsmallstraightd1.text = str(small_straight_memory)
	lsmallstraightd2.text = str(small_straight_memory + 1)
	lsmallstraightd3.text = str(small_straight_memory + 2)
	lsmallstraightd4.text = str(small_straight_memory + 3)
	for i in lsmallstraight_array.size():
		lsmallstraight_array[i - 1].modulate = gamemanager.color_values[int(lsmallstraight_array[i - 1].text) - 1]
	if small_straight_memory == 3:
		small_straight_memory = 1
	else:
		small_straight_memory += 1
	lbigstraightd1.text = str(big_straight_memory)
	lbigstraightd2.text = str(big_straight_memory + 1)
	lbigstraightd3.text = str(big_straight_memory + 2)
	lbigstraightd4.text = str(big_straight_memory + 3)
	lbigstraightd5.text = str(big_straight_memory + 4)
	for i in lbigstraight_array.size():
		lbigstraight_array[i - 1].modulate = gamemanager.color_values[int(lbigstraight_array[i - 1].text) - 1]
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
	for i in lfullhouse_array.size():
		lfullhouse_array[i - 1].modulate = gamemanager.color_values[int(lfullhouse_array[i - 1].text) - 1]


func _ready() -> void:
	changeShowers()
	for i in actioncontrols_array.size():
		actioncontrols_array[i].modulate = gamemanager.color_values[i]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
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

#######################################################################
#####                 funcs for selecting actions                 #####
#######################################################################
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

##############################
#####    Shower Timer    #####
##############################


func _on_timer_timeout() -> void:
	changeShowers()
