function button(_data, _child) {
	return new Button(_child, _data)
}

function Button(_child, _data) : GmUIElement() constructor {
	child = _child
	border_radius = struct_default(_data, "border_radius", 0)
	on_click = struct_default(_data, "on_click", function() {});
	
	cache = {
		hover: false,
		clicked: false,
		x1: 0, y1: 0,
		x2: 0, y2: 0,
	}
	
	static begin_step = function(_context) {
		child.begin_step(_context)
		minimum_size.x = child.minimum_size.x
		minimum_size.y = child.minimum_size.y
	}
	
	static step = function(_context) {
		child.step(_context)
		cache.x1 = _context.zone_position.x
		cache.y1 = _context.zone_position.y
		cache.x2 = _context.zone_position.x + max(_context.zone_size.x, minimum_size.x)
		cache.y2 = _context.zone_position.y + max(_context.zone_size.y, minimum_size.y)
		cache.hover = point_in_rectangle(
			_context.mouse_position.x,
			_context.mouse_position.y,
			cache.x1, cache.y1,
			cache.x2, cache.y2
		)
		if (mouse_check_button_released(mb_left)) {
			cache.clicked = false
		}
		if (cache.hover) {
			if (mouse_check_button_pressed(mb_left)) {
				on_click()
				cache.clicked = true
			}
		}
	}
	
	static render = function(_context) {
		// DRAW BACKGROUND
		if (cache.hover or cache.clicked) {
			var _color = draw_get_color()
			draw_set_color(cache.clicked ? c_ltgray : c_gray)
			if (border_radius > 0) {
				draw_roundrect_ext(
					cache.x1, cache.y1,
					cache.x2, cache.y2,
					border_radius, border_radius,
					false
				)
			} else {
				draw_rectangle(cache.x1, cache.y1, cache.x2, cache.y2, false)
			}
			draw_set_color(_color)
		}
		// DRAW OUTLINE
		if (border_radius > 0) {
			draw_roundrect_ext(
				cache.x1, cache.y1,
				cache.x2, cache.y2,
				border_radius, border_radius,
				true
			)
		} else {
			draw_rectangle(cache.x1, cache.y1, cache.x2, cache.y2, true)
		}
		child.render()
	}
	
}