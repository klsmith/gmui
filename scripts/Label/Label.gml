
function label(_text, _halign = fa_center, _valign = fa_middle) {
	return new Label(_text, _halign, _valign)
}

function Label(_text, _halign = fa_center, _valign = fa_middle) constructor {
	text = _text
	halign = _halign
	valign = _valign
	
	static step = function(_context) {
		// step event is required for all gmui classes
	}
	
	static render = function(_context) {
		var _halign = draw_get_halign()
		var _valign = draw_get_valign()
		draw_set_halign(halign)
		draw_set_valign(valign)
		draw_text(get_x(_context), get_y(_context), read(text))
		draw_set_halign(_halign)
		draw_set_valign(_valign)
	}
	
	static get_x = function(_context) {
		switch(halign) {
			case fa_left: return _context.zone_position.x;
			case fa_right: return _context.zone_position.x + _context.zone_size.x;
			default: return _context.zone_position.x + (_context.zone_size.x / 2);
		}
	}
	
	static get_y = function(_context) {
		switch(valign) {
			case fa_top: return _context.zone_position.y;
			case fa_bottom: return _context.zone_position.y + _context.zone_size.y;
			default: return _context.zone_position.y + (_context.zone_size.y / 2);
		}
	}
	
}