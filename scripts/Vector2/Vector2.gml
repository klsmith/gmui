
/// @func Vector2(x, y)
/// @arg { Real } _x
/// @arg { Real } _y
function Vector2(_x, _y) constructor {
	x = _x
	y = _y
	
	static clone = function() {
		return new Vector2(x, y)
	}
	
	/// @func add(vector2)
	/// @arg { Struct.Vector2 } _vector
	static add = function(_vector) {
		return new Vector2(x + _vector.x, y + _vector.y)
	}
	
	/// @func subtract(vector2)
	/// @arg { Struct.Vector2 } _vector
	static subtract = function(_vector) {
		return new Vector2(x - _vector.x, y - _vector.y)	
	}
	
	/// @func scale_by(scalar)
	/// @arg { Real } _scalar
	static scale_by = function(_scalar) {
		return new Vector2(x * _scalar, y * _scalar)	
	}
}