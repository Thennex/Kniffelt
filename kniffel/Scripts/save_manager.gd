extends Node
class_name save_manager

var gamemanager
@onready var parallax2d: Parallax2D = $"../Design/Parallax2D"


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
	var tmpsettingsm
	var tmpupgradem
	var tmpkniffelp
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
			"res://Scene/game_manager.tscn":
				gamemanager = new_object
				parallax2d.gamemanager = gamemanager
			"res://Scene/settings_menu.tscn":
				tmpsettingsm = new_object
			"res://Scene/Kniffel_paper.tscn":
				tmpkniffelp = new_object
			"res://Scene/upgrade_menu.tscn":
				tmpupgradem = new_object
	gamemanager.load_game_manager()
	await gamemanager.ready
	
	gamemanager.settingsmanager = tmpsettingsm
	gamemanager.settingsmanager.load_audio()
	gamemanager.kniffelpaper = tmpkniffelp
	gamemanager.kniffelpaper.loadPaper()
	gamemanager.kniffelpaper.changeShowers()
	gamemanager.upgrademenu = tmpupgradem
	
