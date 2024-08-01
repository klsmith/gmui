
function row(_data, _children) {
	return new RowContainer(_data.gap, _children)	
}

function RowContainer(_gap, _children) : GmUIElement() constructor {
	children = _children
	gap = _gap
	
	cache = {
		children_count: array_length(_children)
	}
	
	static step = function(_context) {
		var _total_gaps = (cache.children_count - 1) * gap
		var _child_zone_size = new Vector2(
			(_context.zone_size.x - _total_gaps) / cache.children_count,
			_context.zone_size.y
		)
		for (var _i = 0; _i < cache.children_count; _i++) {
			var _child = children[_i]
			_child.step(_context.update({
				zone_position: _context.zone_position
								.add(new Vector2((_child_zone_size.x + gap) * _i, 0)),
				zone_size: _child_zone_size
			}))
		}
	}
}