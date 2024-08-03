
function column(_data, _children) { 
	return new ColumnContainer(_data.gap, _children)
}

/// @arg { Real } _gap
/// @arg { Array.Struct.GmUIElement } _children
function ColumnContainer(_gap, _children) : GmUIElement() constructor {
	children = _children
	gap = _gap
	
	cache = {
		children_count: array_length(_children)
	}
	
	static step = function(_context) {
		var _total_gaps = (cache.children_count - 1) * gap
		var _child_zone_size = new Vector2(
			_context.zone_size.x,
			(_context.zone_size.y - _total_gaps) / cache.children_count
		)
		for (var _i = 0; _i < cache.children_count; _i++) {
			var _child = children[_i]
			_child.step(_context.update({
				zone_position: _context.zone_position
								.add(new Vector2(0, (_child_zone_size.y + gap) * _i)),
				zone_size: _child_zone_size
			}))
		}
	}
}