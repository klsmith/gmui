///
/// @func struct_default(struct, field_name, default_value);
///
/// @desc Try to access a field on the given struct, otherwise use the default.
///
/// @arg { Struct }         _struct         The struct that may or may not have the given field.
/// @arg { String }         _field_name     The field to access on the given struct.
/// @arg { Any, Const.Any, Function.()->Any }  _default_value  This value will be read if the field is not on the struct. 
///                                         See the read(_value) function.
///
/// @return { Any }  The value in the struct, otherwise the read default value.
function struct_default(_struct, _field_name, _default_value) {
	var _value = _struct[$ _field_name]
	return is_undefined(_value) 
		? read(_default_value)
		: _value
}

///
/// @func read(value);
///
/// @desc Try to read the value as a function, otherwise pass the value through.
///
/// @arg { Any, Function.()->Any }  _value  If it is callable, it will be called as a function,
///						            without parameters, otherwise it will be passed through.
///
/// @return { Any }  The result of calling value as a function, otherwise the value itself.
function read(_value) {
	return (is_callable(_value) and !is_real(_value))
		? _value() 
		: _value
}

///
/// @func required(value, message);
///
/// @desc Require the given value, otherwise throw an error with a message.
///
/// @arg { Any, Undefined }  _value    The value that should be required.
/// @arg { String }          _message  The message to throw if the value is missing.
///
/// @return { Any }  The value if it is present, otherwise throws an error message.
function require(_value, _message) {
	if (is_undefined(_value)) {
		throw _message
	}
	return _value
}

///
/// @func for_each(array, operation);
function for_each(_array, _operation) {
	for (var _i = 0; _i < array_length(_array); _i++) {
		_operation(_i, _array[_i])
	}
}