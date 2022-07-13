extends Control


func _ready() -> void:
	if OS.get_name() in ["iOS", "Android"]:
		$Panel/VBoxContainer/GridContainer/WidthValue.visible = false
		$Panel/VBoxContainer/GridContainer/HeightValue.visible = false
		$Panel/VBoxContainer/GridContainer/BorderlessToggle.visible = false
		$Panel/VBoxContainer/GridContainer/FullscreenToggle.visible = false


func update_values() -> void:
	# !! call using signals before enabling visibility !!
	#
	# this function will properly set Lilt.settings["window_width"] and
	# Lilt.settings["window_height"] if they are 0

	if Lilt.settings["display_window_width"] == 0:
		Lilt.settings["display_window_width"] = get_viewport().size.x

	if Lilt.settings["display_window_height"] == 0:
		Lilt.settings["display_window_height"] = get_viewport().size.y
	
	Lilt.save_settings()
	
	$Panel/VBoxContainer/GridContainer/WidthValue.text = str(Lilt.settings["display_window_width"])
	$Panel/VBoxContainer/GridContainer/HeightValue.text = str(Lilt.settings["display_window_height"])
	$Panel/VBoxContainer/GridContainer/BorderlessToggle.text = "Yes" if Lilt.settings["display_borderless"] else "No"
	$Panel/VBoxContainer/GridContainer/FullscreenToggle.text = "Yes" if Lilt.settings["display_fullscreen"] else "No"
	$Panel/VBoxContainer/AudioLabel.text = "Audio (" + str(Lilt.settings["audio_master_level"]) + "%)"
	$Panel/VBoxContainer/AudioSlider.value = Lilt.settings["audio_master_level"]


func _on_width_value_text_submitted(new_text: String) -> void:
	if not new_text.is_valid_int(): return
	Lilt.settings["display_window_width"] = new_text.to_int()
	Lilt.apply_settings(Lilt.APPLY_TO.DISPLAY_WINDOW_WIDTH)
	update_values()


func _on_height_value_text_submitted(new_text: String) -> void:
	if not new_text.is_valid_int(): return
	Lilt.settings["display_window_height"] = new_text.to_int()
	Lilt.apply_settings(Lilt.APPLY_TO.DISPLAY_WINDOW_HEIGHT)
	update_values()


func _on_borderless_toggle_pressed():
	Lilt.settings["display_borderless"] = not Lilt.settings["display_borderless"]
	Lilt.apply_settings(Lilt.APPLY_TO.DISPLAY_BORDERLESS)
	update_values()


func _on_fullscreen_toggle_pressed():
	Lilt.settings["display_fullscreen"] = not Lilt.settings["display_fullscreen"]
	Lilt.apply_settings(Lilt.APPLY_TO.DISPLAY_FULLSCREEN)
	update_values()


func _on_audio_slider_drag_ended(value_changed: bool) -> void:
	if not value_changed:
		return

	Lilt.settings["audio_master_level"] = $Panel/VBoxContainer/AudioSlider.value
	Lilt.apply_settings(Lilt.APPLY_TO.AUDIO_LEVEL_MASTER)
	update_values()


func _on_audio_slider_value_changed(value: float) -> void:
	# !! atomic !!
	$Panel/VBoxContainer/AudioLabel.text = "Audio (" + str(value) + "%)"


func _on_exit_button_pressed():
	visible = false


func _on_main_menu_load_score():
	pass # Replace with function body.
