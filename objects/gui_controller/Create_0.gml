// initialize variables
count = 0

// initialize functions
read_fps = function(){ return "FPS: " + string(fps) }
read_count = function(){ return "Count: " + string(count) }
reset_count = function(){ count = 0 }
decrement_count = function(){ if (count > 0) count-- }
increment_count = function(){ count++ }

gmui = // build gui
padding( 512, 128,
	column( 32, [
		label(read_fps),
		button(
			padding( 32, 32,
				row( 32, [ 
					label( "<--", fa_left ),
					label( "-->", fa_right ),
				])
			)
		),
		button(
			label(read_count),
			reset_count
		),
		row(32,[
			button(label( "--" ), decrement_count),
			button(label( "++" ), increment_count),
		])
	])
)