extends Node


enum APPLY_TO {
	DISPLAY_WINDOW_WIDTH,
	DISPLAY_WINDOW_HEIGHT,
	DISPLAY_BORDERLESS,
	DISPLAY_FULLSCREEN,
	AUDIO_LEVEL_MASTER,
}

const SETTINGS_PATH: String = "user://settings.json"

@export var settings: Dictionary = {
	"display_window_width": 0,
	"display_window_height": 0,
	"display_borderless": true,
	"display_fullscreen": true,
	"audio_master_level": 100,
}


func load_settings() -> int:
	# returns:
	#   0 - all good
	#   1 - non existent
	#   2 - couldnt parse json
	#   3 - parsed non dictionary
	#   4 - missing key
	#   5X - incorrect key type
	if not File.file_exists(SETTINGS_PATH):
		return 1

	var file: File = File.new()
	file.open(SETTINGS_PATH, File.READ)
	
	var settings_string = file.get_as_text()
	var json: JSON = JSON.new()
	var error = json.parse(settings_string)
	if error == OK:
		var data_received = json.get_data()
		if typeof(data_received) == TYPE_DICTIONARY:
			if not ("display_window_width" in data_received): return 4
			if not (typeof(data_received["display_window_width"]) == TYPE_FLOAT): return 51
			if not ("display_window_height" in data_received): return 4
			if not (typeof(data_received["display_window_height"]) == TYPE_FLOAT): return 52
			if not ("display_borderless" in data_received): return 4
			if not (typeof(data_received["display_borderless"]) == TYPE_BOOL): return 53
			if not ("display_fullscreen" in data_received): return 4
			if not (typeof(data_received["display_fullscreen"]) == TYPE_BOOL): return 54
			if not ("audio_master_level" in data_received): return 4
			if not (typeof(data_received["audio_master_level"]) == TYPE_FLOAT): return 55
			settings = data_received
		else: return 3
	else:
		return 2
	
	return 0


func save_settings() -> void:
	var json: JSON = JSON.new()
	var settings_string = json.stringify(settings)
	var file: File = File.new()
	file.open(SETTINGS_PATH, File.WRITE)
	file.store_string(settings_string)


func apply_settings(to: APPLY_TO) -> void:
	if Lilt.settings["display_window_width"] == 0:
		Lilt.settings["display_window_width"] = get_viewport().size.x

	if Lilt.settings["display_window_height"] == 0:
		Lilt.settings["display_window_height"] = get_viewport().size.y

	match to:
		APPLY_TO.DISPLAY_BORDERLESS:
			if OS.get_name() in ["iOS", "Android"]: return
			DisplayServer.window_set_flag(
				DisplayServer.WINDOW_FLAG_BORDERLESS,
				Lilt.settings["display_borderless"]
			)

		APPLY_TO.DISPLAY_FULLSCREEN:
			if OS.get_name() in ["iOS", "Android"]: return

			# windowed
			if not Lilt.settings["display_fullscreen"]:
				var new_width: int = int(get_viewport().size.x * 0.75)
				var new_height: int = int(get_viewport().size.y * 0.75)
				Lilt.settings["display_window_width"] = float(new_width)
				Lilt.settings["display_window_height"] = float(new_height)
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				DisplayServer.window_set_size(Vector2i(new_width, new_height))

			# fullscreen
			else:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
				DisplayServer.window_set_flag(
					DisplayServer.WINDOW_FLAG_BORDERLESS,
					Lilt.settings["display_borderless"]
				)
				Lilt.settings["display_window_width"] = float(get_viewport().size.x)
				Lilt.settings["display_window_height"] = float(get_viewport().size.y)

		APPLY_TO.DISPLAY_WINDOW_WIDTH:
			if settings["display_fullscreen"]: return
			if OS.get_name() in ["iOS", "Android"]: return
			DisplayServer.window_set_size(
				Vector2i(
					int(settings["display_window_width"]),
					int(settings["display_window_height"])
				)
			)

		APPLY_TO.DISPLAY_WINDOW_HEIGHT:
			if settings["display_fullscreen"]: return
			if OS.get_name() in ["iOS", "Android"]: return
			DisplayServer.window_set_size(
				Vector2i(
					int(settings["display_window_width"]),
					int(settings["display_window_height"])
				)
			)

		APPLY_TO.AUDIO_LEVEL_MASTER:
			pass  # TODO


func apply_all_settings() -> void:
	apply_settings(APPLY_TO.DISPLAY_FULLSCREEN)
	apply_settings(APPLY_TO.DISPLAY_BORDERLESS)
	apply_settings(APPLY_TO.DISPLAY_WINDOW_WIDTH)
	apply_settings(APPLY_TO.DISPLAY_WINDOW_HEIGHT)
	apply_settings(APPLY_TO.AUDIO_LEVEL_MASTER)
