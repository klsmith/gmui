
function padding(_value, _child) {
	return new PaddingContainer(_value, _value, _value, _value, _child)
}

function padding_xy(_x, _y, _child) {
	return new PaddingContainer(_x, _x, _y, _y, _child)
}

function padding_lrtb(_left, _right, _top, _bottom, _child) {
	return new PaddingContainer(_left, _right, _top, _bottom, _child)
}

function PaddingContainer(_left, _right, _top, _bottom, _child) : GmUIElement() constructor {
	left = _left
	right = _right
	top = _top
	bottom = _bottom
	child = _child
	
	cache = {
		left: 0,
		right: 0,
		top : 0,
		bottom: 0,
		zone_position: new Vector2(0, 0),
		zone_size: new Vector2(0, 0),
	}
	
	static begin_step = function(_context) {
		cache.left = read(left)
		cache.right = read(right)
		cache.top = read(top)
		cache.bottom = read(bottom)
		child.begin_step(_context)
		minimum_size.x = child.minimum_size.x + cache.left + cache.right
		minimum_size.y = child.minimum_size.y + cache.top + cache.bottom
	}
	
	static step = function(_context) {
		var _pos = _context.zone_position
		var _size = _context.zone_size
		cache.zone_position = new Vector2(
			_pos.x + cache.left, 
			_pos.y + cache.top
		)
		cache.zone_size = new Vector2(
			_size.x - cache.left - cache.right,
			_size.y -cache.top - cache.bottom
		)
		child.step(_context.update({
			zone_position: cache.zone_position.clone(),
			zone_size: cache.zone_size.clone() 
		}))
	}
	
	static render = function(_context) {
		if (debug_mode) {
			var _alp = draw_get_alpha()
			var _col = draw_get_color()
			draw_set_alpha(0.1)
			draw_set_color(c_fuchsia)
			draw_rectangle(
				cache.zone_position.x,
				cache.zone_position.y,
				cache.zone_position.x + cache.zone_size.x,
				cache.zone_position.y + cache.zone_size.y,
				false
			)
			draw_set_alpha(1)
			draw_set_color(c_red)
			draw_arrow(
				_context.zone_position.x,
				_context.zone_position.y + (_context.zone_size.y / 2),
				cache.zone_position.x,
				cache.zone_position.y + (cache.zone_size.y / 2),
				cache.left / 4
			)
			draw_arrow(
				_context.zone_position.x + (_context.zone_size.x / 2),
				_context.zone_position.y,
				cache.zone_position.x + (cache.zone_size.x / 2),
				cache.zone_position.y,
				cache.top / 4
			)
			draw_arrow(
				_context.zone_position.x + _context.zone_size.x,
				_context.zone_position.y + (_context.zone_size.y / 2),
				cache.zone_position.x + cache.zone_size.x,
				cache.zone_position.y + (cache.zone_size.y / 2),
				cache.right / 4
			)
			draw_arrow(
				_context.zone_position.x + (_context.zone_size.x / 2),
				_context.zone_position.y + _context.zone_size.y,
				cache.zone_position.x + (cache.zone_size.x / 2),
				cache.zone_position.y + cache.zone_size.y,
				cache.bottom / 4
			)
			draw_set_alpha(_alp)
			draw_set_color(_col)
		}
		child.render(_context)
	}
}