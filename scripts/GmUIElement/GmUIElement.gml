function GmUIElement() constructor {

	minimum_size = new Vector2(0, 0)

	/// @return { Array<Struct.GmUIElement> }
	static get_children = function() {
		var _maybe_child = self[$ "child"]
		if (!is_undefined(_maybe_child)) {
			return [_maybe_child]
		}
		var _maybe_children = self[$ "children"]
		if (!is_undefined(_maybe_children)) {
			return _maybe_children
		}
		return []
	}

	/// @func begin_step(context)
	/// @arg { Struct.GmUIContext } _context
	static begin_step = function(_context) {
		for_each(get_children(), method(_context, function(_i, _child) {
			_child.begin_step(self)
		}))
	}
	
	/// @func step(context);
	/// @arg { Struct.GmUIContext } _context
	static step = function(_context) {
		for_each(get_children(), method(_context, function(_i, _child) {
			_child.step(self)
		}))
	}
	
	/// @func render(context);
	static render = function(_context) {
		for_each(get_children(), method(_context, function(_i, _child) {
			_child.render(self)
		}))
	}
}