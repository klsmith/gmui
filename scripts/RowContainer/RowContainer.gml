
function row(_gap = 0, _children = []) {
	return new RowContainer(_gap, _children)	
}

function RowContainer(_gap = 0, _children = []) constructor {
	children = _children
	gap = _gap
	
	static step = function(_context) {
		handle("step", _context)	
	}
	
	static render = function(_context) {
		handle("render", _context)
	}
	
	static handle = function(_event, _context) {
				var _children_count = array_length(children)
		var _total_gaps = (_children_count - 1) * gap
		var _child_zone_size = new Vector2(
			(_context.zone_size.x - _total_gaps) / _children_count,
			_context.zone_size.y
		)
		for (var _i = 0; _i < _children_count; _i++) {
			var _child = children[_i]
			method(_child, _child[$ _event])(_context.update({
				zone_position: _context.zone_position
								.add(new Vector2((_child_zone_size.x + gap) * _i, 0)),
				zone_size: _child_zone_size
			}))
		}
	}
}