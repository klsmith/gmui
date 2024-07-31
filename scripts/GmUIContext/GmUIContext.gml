function GmUIContext(_data = {}) constructor {
	zone_position = struct_default(
		_data, "zone_position", 
		function(){ return new Vector2(0, 0) }
	)
	zone_size = struct_default(
		_data, "zone_size", 
		function(){ return new Vector2(
			display_get_gui_width(), 
			display_get_gui_height()
		)}
	)
	mouse_position = struct_default(
		_data, "mouse_position", 
		function(){ return new Vector2(
			device_mouse_x_to_gui(0), 
			device_mouse_y_to_gui(0)
		)}
	)

	static update = function(_data = {}) {
		return new GmUIContext({
			zone_position: struct_default(
				_data, "zone_position", zone_position
			),
			zone_size: struct_default(
				_data, "zone_size", zone_size
			),
			mouse_position: struct_default(
				_data, "mouse_position", mouse_position
			)
		})
	}
}