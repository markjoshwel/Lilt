extends Control


func _ready():
	Lilt.load_settings()
	Lilt.apply_all_settings()
	$FileDialog.set_filters(PackedStringArray(["*.pck"]))


func _on_load_button_pressed() -> void:
	$FileDialog.popup()


func _on_settings_button_pressed() -> void:
	$SettingsMenu.visible = not $SettingsMenu.visible
	if $SettingsMenu.visible:
		$SettingsMenu.update_values()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_file_dialog_file_selected(path: String) -> void:
	if not ProjectSettings.load_resource_pack(path): return
	if not File.file_exists("res://cover.jpg"): return
	if not File.file_exists("res://meta.json"): return
	if not File.file_exists("res://song.mp3"): return

	# set cover
	var cover_image: Image = Image.new()
	var cover_texture: ImageTexture = ImageTexture.new()
	cover_image.load("res://cover.jpg")
	cover_texture.create_from_image(cover_image)
	$CenterContainer/Cover.texture = cover_texture
