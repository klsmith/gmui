// gui layer stuff
display_set_gui_maximize()

// initialize variables
count = 128

// initialize functions
read_fps = function(){ return "FPS: " + string(fps) }
read_count = function(){ return count }
read_count_label = function() { return "Count: " + string(count) }
reset_count = function(){ count = 32 }
decrement_count = function(){ if (count > 0) count-- }
increment_count = function(){ count++ }

gmui = // build gui
padding_xy(512, read_count,
	column({ gap: 32 }, [
		label({ text: read_fps }),
		button(
			{ on_click: reset_count },
			label({ text: read_count_label })
		),
		row({ gap: 32 }, [
			button(
				{ on_click: decrement_count },
				label({ text: "--" })
			),
			button(
				{ on_click: increment_count },
				label({ text: "++" })
			),
		])
	])
)