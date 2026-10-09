extends Parallax2D


@onready var scrollingbg: Sprite2D = $scrollingbg
@onready var overlay: Sprite2D = $"../KniffelOverlay"
@onready var kniffelmenuoverlay: Sprite2D = $"../KniffelMenuOverlayt"
@onready var menu: Control = $"../../Menu"

@onready var gamemanager: Node2D = $"../../GameManager"

@onready var selectsfx: AudioStreamPlayer = $"../../SelectSFX"

var SCROLLINGSPEED = Vector2(20, 20)

var no_switch = false
var no_scrolling = false

var color_counter = 0

func _on_timer_timeout() -> void:
	if no_switch == true:	return
	var tween_bg = create_tween()
	var tween_overlay = create_tween()
	var tween_menu_overlay = create_tween()
	var tween_menu = create_tween()
	tween_overlay.tween_property(overlay, "modulate", gamemanager.color_values[color_counter], 0.5)
	tween_bg.tween_property(scrollingbg, "modulate", gamemanager.color_values[color_counter], 0.5)
	tween_menu_overlay.tween_property(kniffelmenuoverlay, "modulate", gamemanager.color_values[color_counter], 0.5)
	tween_menu.tween_property(menu, "modulate", gamemanager.color_values[color_counter], 0.5)
	color_counter += 1 if color_counter < 5 else -5



func _on_settings_menu_bgscrolling(background_scrolling) -> void:
	no_switch = background_scrolling
	no_scrolling = background_scrolling
	selectsfx.play()
	if no_scrolling == true:
		autoscroll = SCROLLINGSPEED
	elif no_scrolling == false:
		autoscroll = Vector2(0, 0)
