
function column(_gap, _children) { 
	return new ColumnContainer(_gap, _children)
}

/// @arg { Real } _gap
/// @arg { Array.Struct.GmUIElement } _children
function ColumnContainer(_gap, _children) : GmUIElement() constructor {
	children = _children
	gap = _gap
	
	static step = function(_context) {
		handle("step", _context)
	}
	
	static render = function(_context) {
		handle("render", _context)
	}
	
	/// @arg { String } _event
	/// @arg { Struct.GmUIContext } _context
	static handle = function(_event, _context) {
		var _children_count = array_length(children)
		var _total_gaps = (_children_count - 1) * gap
		var _child_zone_size = new Vector2(
			_context.zone_size.x,
			(_context.zone_size.y - _total_gaps) / _children_count
		)
		for (var _i = 0; _i < _children_count; _i++) {
			var _child = children[_i]
			method(_child, _child[$ _event])(_context.update({
				zone_position: _context.zone_position
								.add(new Vector2(0, (_child_zone_size.y + gap) * _i)),
				zone_size: _child_zone_size
			}))
		}
	}
}