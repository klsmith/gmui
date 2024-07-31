
function button(_child, _on_click = function(){}) {
	return new Button(_child, _on_click)
}

function Button(_child, _on_click = function(){}) : GmUIElement() constructor {
	child = require(_child, "Button requires _child.")
	on_click = _on_click
	cache = {
		hover: false,
		clicked: false,
		x1: 0, y1: 0,
		x2: 0, y2: 0,
	}
	
	static step = function(_context) {
		child.step(_context)
		cache.x1 = _context.zone_position.x
		cache.y1 = _context.zone_position.y
		cache.x2 = _context.zone_position.x + _context.zone_size.x
		cache.y2 = _context.zone_position.y + _context.zone_size.y
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
		if (cache.hover or cache.clicked) {
			var _color = draw_get_color()
			draw_set_color(cache.clicked ? c_ltgray : c_gray)
			draw_rectangle(cache.x1, cache.y1, cache.x2, cache.y2, false)
			draw_set_color(_color)
		}
		draw_rectangle(cache.x1, cache.y1, cache.x2, cache.y2, true)
		child.render(_context)
	}
}