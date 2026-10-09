extends Parallax2D


@onready var scrollingbg: Sprite2D = $scrollingbg

@onready var gamemanager: Node2D = $"../../GameManager"

@onready var selectsfx: AudioStreamPlayer = $"../../SelectSFX"

var SCROLLINGSPEED = Vector2(20, 20)

var no_switch = false
var no_scrolling = false

var color_counter = 0

func _on_timer_timeout() -> void:
	if no_switch == true:	return
	var tween = create_tween()
	tween.tween_property(scrollingbg, "modulate", gamemanager.color_values[color_counter], 0.5)
	color_counter += 1 if color_counter < 5 else -5



func _on_settings_menu_bgscrolling(background_scrolling) -> void:
	no_switch = background_scrolling
	no_scrolling = background_scrolling
	selectsfx.play()
	if no_scrolling == true:
		autoscroll = SCROLLINGSPEED
	elif no_scrolling == false:
		autoscroll = Vector2(0, 0)
