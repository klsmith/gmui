
function padding(_padding_x, _padding_y, _child) {
	return new PaddingContainer(_padding_x, _padding_y, _child)
}

function PaddingContainer(_padding_x, _padding_y, _child) : GmUIElement() constructor {
	self.padding = new Vector2(_padding_x, _padding_y)
	child = _child
	
	static step = function(_context) {
		handle("step", _context)	
	}
	
	static render = function(_context) {
		handle("render", _context)
	}
	
	static handle = function(_event, _context) {
		method(child, child[$ _event])(_context.update({
			zone_position: _context.zone_position.add(self.padding),
			zone_size: _context.zone_size.subtract(self.padding.scale_by(2))
		}))
	}
}