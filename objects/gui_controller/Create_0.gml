// gui layer stuff
display_set_gui_maximize()

// initialize variables
padding_x = 100
padding_y = 100
INCREMENT = 10
RADIUS = 32

// FPS
read_fps = function(){ return "FPS: " + string(fps) }

// PADDING X
decrement_padding_x = function() { padding_x -= INCREMENT }
increment_padding_x = function() { padding_x += INCREMENT }
reset_padding_x = function() { padding_x = 100 }
read_padding_x = function() { return padding_x }
read_label_x = function() { return "X: " +  string(padding_x) }

// PADDING Y
decrement_padding_y = function() { padding_y -= INCREMENT }
increment_padding_y = function() { padding_y += INCREMENT }
reset_padding_y = function() { padding_y = 100 }
read_padding_y = function() { return padding_y }
read_label_y = function() { return "Y: " + string(padding_y) }

show_debug_message(string(display_get_gui_width()))
show_debug_message(string(display_get_gui_height()))

gmui = // build gui
padding_xy(read_padding_x, read_padding_y,
	column({ gap: 32 }, [
		label({ text: read_fps, valign: fa_bottom }),
		row({ gap: 32 }, [
			button(
				{ on_click: decrement_padding_x,
				  border_radius: RADIUS},
				label({ text: "--" })
			),
			button(
				{ on_click: reset_padding_x,
				  border_radius: RADIUS },
				label({ text: read_label_x })
			),
			button(
				{ on_click: increment_padding_x,
				  border_radius: RADIUS },
				label({ text: "++" })
			),
		]),
		row({ gap: 32 }, [
			button(
				{ on_click: decrement_padding_y,
				  border_radius: RADIUS },
				label({ text: "--" })
			),
			button(
				{ on_click: reset_padding_y,
				  border_radius: RADIUS },
				label({ text: read_label_y })
			),
			button(
				{ on_click: increment_padding_y,
				  border_radius: RADIUS },
				label({ text: "++" })
			),
		]),
	])
)