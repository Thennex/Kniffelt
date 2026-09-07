extends Control

signal changeColor(array)
signal bgscrolling(background_scrolling)
signal showControls(show_controls)
signal closeMenu

@onready var colorbutton1: ColorPickerButton = $D1ColorButton
@onready var colorbutton2: ColorPickerButton = $D1ColorButton2
@onready var colorbutton3: ColorPickerButton = $D1ColorButton3
@onready var colorbutton4: ColorPickerButton = $D1ColorButton4
@onready var colorbutton5: ColorPickerButton = $D1ColorButton5
@onready var colorbutton6: ColorPickerButton = $D1ColorButton6

var buttons = [colorbutton1, colorbutton2, colorbutton3, colorbutton4, colorbutton4, colorbutton5, colorbutton6]

var color_values = ["ffff00", "00ff00", "00ffff", "009aff", "ff00ff", "ff0000"]
var change_color_values = ["ffff00", "00ff00", "00ffff", "009aff", "ff00ff", "ff0000"]

var is_background_scrolling = true
var is_show_controls = true

func resetAllColor() -> void:
	colorbutton1.color = color_values[0]
	colorbutton2.color = color_values[1]
	colorbutton3.color = color_values[2]
	colorbutton4.color = color_values[3]
	colorbutton5.color = color_values[4]
	colorbutton6.color = color_values[5]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_d_1_color_button_color_changed(color: Color) -> void:
	change_color_values[0] = colorbutton1.color

func _on_d_1_color_button_2_color_changed(color: Color) -> void:
	change_color_values[1] = colorbutton2.color

func _on_d_1_color_button_3_color_changed(color: Color) -> void:
	change_color_values[2] = colorbutton3.color

func _on_d_1_color_button_4_color_changed(color: Color) -> void:
	change_color_values[3] = colorbutton4.color

func _on_d_1_color_button_5_color_changed(color: Color) -> void:
	change_color_values[4] = colorbutton5.color

func _on_d_1_color_button_6_color_changed(color: Color) -> void:
	change_color_values[5] = colorbutton6.color


func _on_apply_button_pressed() -> void:
	changeColor.emit(change_color_values)
	closeMenu.emit()
	visible = false


func _on_reset_button_pressed() -> void:
	changeColor.emit(color_values)
	closeMenu.emit()
	visible = false


func _on_close_button_pressed() -> void:
	closeMenu.emit()
	visible = false


func _on_background_scrolling_button_pressed() -> void:
	if is_background_scrolling:
		is_background_scrolling = false
	else:
		is_background_scrolling= true
	bgscrolling.emit(is_background_scrolling)
	


func _on_show_controls_button_pressed() -> void:
	if is_show_controls:
		is_show_controls = false
	else:
		is_show_controls = true
	showControls.emit(is_show_controls)
