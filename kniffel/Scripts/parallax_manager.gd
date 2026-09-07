extends Parallax2D

@onready var d1: Sprite2D = $d1
@onready var d2: Sprite2D = $d2
@onready var d3: Sprite2D = $d3
@onready var d4: Sprite2D = $d4
@onready var d5: Sprite2D = $d5
@onready var d6: Sprite2D = $d6

@onready var selectsfx: AudioStreamPlayer = $"../SelectSFX"

var SCROLLINGSPEED = Vector2(20, 20)

var no_switch = false
var no_scrolling = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _on_timer_timeout() -> void:
	if no_switch == false:
		if d1.visible == true:
			d2.visible = true
			d1.visible = false
		elif d2.visible == true:
			d3.visible = true
			d2.visible = false
		elif d3.visible == true:
			d4.visible = true
			d3.visible = false
		elif d4.visible == true:
			d5.visible = true
			d4.visible = false
		elif d5.visible == true:
			d6.visible = true
			d5.visible = false
		elif d6.visible == true:
			d1.visible = true
			d6.visible = false
		
		


func _on_stop_background_button_pressed() -> void:
	if no_scrolling == true:
		no_switch = false
		no_scrolling = false
		selectsfx.play()
		autoscroll = SCROLLINGSPEED
	elif no_scrolling == false:
		no_switch = true
		no_scrolling = true
		selectsfx.play()
		autoscroll = Vector2(0, 0)
