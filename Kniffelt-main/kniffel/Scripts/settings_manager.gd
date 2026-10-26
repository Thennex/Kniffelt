extends Control

signal changeColor(array)
signal bgscrolling(background_scrolling)
signal showControls(show_controls)


@onready var gamemanager: Node2D = $"../GameManager"

@onready var selectsfx: AudioStreamPlayer = $selectSFX
@onready var countersfx: AudioStreamPlayer = $counterSFX



@onready var sfxslider: HSlider = $Sprite2D/SFXSlider
@onready var musicslider: HSlider = $Sprite2D/MusicSlider

@onready var colorbutton1: ColorPickerButton = $Sprite2D/D1ColorButton
@onready var colorbutton2: ColorPickerButton = $Sprite2D/D1ColorButton2
@onready var colorbutton3: ColorPickerButton = $Sprite2D/D1ColorButton3
@onready var colorbutton4: ColorPickerButton = $Sprite2D/D1ColorButton4
@onready var colorbutton5: ColorPickerButton = $Sprite2D/D1ColorButton5
@onready var colorbutton6: ColorPickerButton = $Sprite2D/D1ColorButton6
@onready var buttons = [colorbutton1, colorbutton2, colorbutton3, colorbutton4, colorbutton4, colorbutton5, colorbutton6]

@onready var backgroundscrollingbutton: Button = $Sprite2D/BackgroundScrollingButton
@onready var showcontrolsbutton: Button = $Sprite2D/ShowControlsButton
var true_color = Color(0.152, 0.711, 0.0)
var false_color = Color(0.348, 0.039, 0.031)

@onready var color_values: Array = gamemanager.color_values
@onready var change_color_values : Array = color_values

var is_background_scrolling : bool = true
var is_show_controls : bool = true

var current_volume_music : float = 0.5
var current_volume_sfx : float = 0.5

func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y,
		"z_index" : z_index,
		"visible" : visible,
		"is_background_scrolling" : is_background_scrolling,
		"is_show_controls" : is_show_controls,
		"current_volume_music" : current_volume_music,
		"current_volume_sfx" : current_volume_sfx,
		"backgroundscrollingbutton.modulate" : backgroundscrollingbutton.modulate, 
		"showcontrolsbutton.modulate" : showcontrolsbutton.modulate, 
		"change_color_values" : change_color_values,
	}
	return save_dict

func load_audio():
	sfxslider.value = current_volume_sfx
	musicslider.value = current_volume_music
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(current_volume_sfx))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(current_volume_music))


func resetAllColor() -> void:
	changeColor.emit(color_values)

 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_audio()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_d_1_color_button_color_changed(color: Color) -> void:
	change_color_values[0] = Color(colorbutton1.color) 

func _on_d_1_color_button_2_color_changed(color: Color) -> void:
	change_color_values[1] = Color(colorbutton2.color)

func _on_d_1_color_button_3_color_changed(color: Color) -> void:
	change_color_values[2] = Color(colorbutton3.color)

func _on_d_1_color_button_4_color_changed(color: Color) -> void:
	change_color_values[3] = Color(colorbutton4.color)

func _on_d_1_color_button_5_color_changed(color: Color) -> void:
	change_color_values[4] = Color(colorbutton5.color)

func _on_d_1_color_button_6_color_changed(color: Color) -> void:
	change_color_values[5] = Color(colorbutton6.color)


func _on_apply_button_pressed() -> void:
	selectsfx.play()
	$"../Menu/ColorRect".visible = false
	changeColor.emit(change_color_values)
	visible = false


func _on_reset_button_pressed() -> void:
	selectsfx.play()
	$"../Menu/ColorRect".visible = false
	changeColor.emit(color_values)
	visible = false


func _on_close_button_pressed() -> void:
	selectsfx.play()
	$"../Menu/ColorRect".visible = false
	$"../Menu".visible = true
	$"../Menu/MenuCloser".visible = true
	visible = false


func _on_background_scrolling_button_pressed() -> void:
	if is_background_scrolling:
		backgroundscrollingbutton.modulate = false_color
		is_background_scrolling = false
	else:
		backgroundscrollingbutton.modulate = true_color
		is_background_scrolling = true
	bgscrolling.emit(is_background_scrolling)



func _on_show_controls_button_pressed() -> void:
	if is_show_controls:
		showcontrolsbutton.modulate = false_color
		is_show_controls = false
	else:
		showcontrolsbutton.modulate = true_color
		is_show_controls = true
	showControls.emit(is_show_controls)


func _on_fullscreen_button_pressed() -> void:
	selectsfx.play()
	if DisplayServer.window_get_mode() == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) 
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_sfx_slider_value_changed(value: float) -> void:
	selectsfx.play()
	current_volume_sfx = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))


func _on_music_slider_value_changed(value: float) -> void:
	selectsfx.play()
	current_volume_music = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))


func _on_button_pressed() -> void:
	selectsfx.play()
	$"../Menu/VBoxContainer".visible = true
	$"../Menu/MenuCloser".visible = true
	visible = false
