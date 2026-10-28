extends Node2D



#region Variables for Paths
############################################################
#####                   Path linking                   #####
############################################################
@onready var selectsfx: AudioStreamPlayer = $selectSFX

@onready var shortcutoverlay: Control = $"../ShowControls"
@onready var camera: Camera2D = $"../Camera2D"

@onready var menu: VBoxContainer = $"../Menu/VBoxContainer"
@onready var end_menu: Control = $"../EndMenu"
@onready var upgrademenu: Control = $"../UpgradeMenu"
@onready var settingsmanager: Control = $"../SettingsMenu"
@onready var kniffelpaper: Node2D = $"../Kniffel_paper"
@onready var dicemanager: Control = $"../dice_manager"
@onready var scrollingbg: Sprite2D = $"../Design/Parallax2D/scrollingbg"

#endregion
#region VARIABLES

####################################
#####   Variables for Reload   #####
####################################
const kniffelpaperscene : PackedScene = preload("uid://bux05u53jlkja")
var tmp_kniffelpaper 
var tmp_settingsmanager
var tmp_upgrade_menu
var tmp_dice_manager


####################################
#####   Variables for Design   #####
####################################
var color_values : Array = [\
Color(0.7, 0.7, 0.0), Color(0.0, 0.7, 0.0), \
Color(0.0, 0.7, 0.7), Color(0.0, 0.604, 1.0, 1.0), \
Color(0.7, 0.0, 0.7), Color(0.7, 0.0, 0.0)]
#endregion

#region METHODS
#######################################################################
#####                           Methods                           #####
#######################################################################

################################
#####   Methods for calc   #####
################################r
func _ready() -> void:
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
				tmp_settingsmanager = new_object
			"res://Scene/Kniffel_paper.tscn":
				tmp_kniffelpaper = new_object
			"res://Scene/upgrade_menu.tscn":
				tmp_upgrade_menu = new_object
			"res://Scene/dice_manager.tscn":
				tmp_dice_manager = new_object
			
	kniffelpaper  = tmp_kniffelpaper 
	settingsmanager = tmp_settingsmanager
	upgrademenu = tmp_upgrade_menu
	dicemanager = tmp_dice_manager
	kniffelpaper.dicemanager = dicemanager
	dicemanager.kniffelpaper = kniffelpaper
	settingsmanager.load_audio()
	kniffelpaper.loadPaper()
	dicemanager.loadDices()

#############################
#####    End Methods    #####
#############################


func end():
	$"../dice_manager".visible = false
	$"../ShowControls".visible = false
	$"../UpgradeMenu".visible = false
	end_menu.changeStatlabel(kniffelpaper.number_counter_array)



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
	else:
		$"../Menu/ColorRect".visible = true
		$"../Menu/MenuCloser".visible = true
		settingsmanager.visible = false
		menu.visible = true

func _on_menu_closer_pressed() -> void:
		selectsfx.play()
		$"../Menu/ColorRect".visible = false
		$"../Menu/MenuCloser".visible = false
		menu.visible = false

func _on_reload_button_pressed() -> void:
	var tmp_array : Array = get_tree().get_nodes_in_group("Kniffelpaper")
	for i in tmp_array.size():
		tmp_array[i - 1].queue_free()
	var Kniffel_paper = kniffelpaperscene.instantiate()
	kniffelpaper = Kniffel_paper
	dicemanager.kniffelpaper = Kniffel_paper
	$"..".add_child(Kniffel_paper)
	Kniffel_paper.add_to_group("Kniffelpaper")
	Kniffel_paper.add_to_group("persistent")
	kniffelpaper = Kniffel_paper
	Kniffel_paper.z_index = 3
	$"../EndMenu".visible = false
	$"../Menu/VBoxContainer".visible = false
	$"../Menu/ColorRect".visible = false
	kniffelpaper.dicemanager = dicemanager
	kniffelpaper.reset()
	

func _on_control_button_pressed() -> void:
	selectsfx.play()
	if settingsmanager.visible:
		settingsmanager.visible = false
		$"../Menu/MenuCloser".visible = false
		$"../Menu/ColorRect".visible = false
	else:
		menu.visible = false
		settingsmanager.visible = true

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

#region manually created Signals
################################
#####    Manual Signals    #####
################################
func _on_settings_menu_change_color(array: Variant) -> void:
	color_values = array
	dicemanager.setColor()

func _on_settings_menu_show_controls(show_controls: Variant) -> void:
	shortcutoverlay.visible = show_controls
	selectsfx.play()

#endregion
