
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
	
	static step = function(_context) {
		var _l = read(left)
		var _r = read(right)
		var _t = read(top)
		var _b = read(bottom)
		var _pos = _context.zone_position
		var _size = _context.zone_size
		child.step(_context.update({
			zone_position: new Vector2(_pos.x + _l, _pos.y + _t),
			zone_size: new Vector2(_size.x - _l - _r, _size.y - _t - _b)
		}))
	}
}