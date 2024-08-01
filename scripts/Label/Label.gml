
function label(_data) {
	return new Label(_data)
}

function Label(_data) : GmUIElement() constructor {
	text = _data.text
	halign = struct_default(_data, "halign", function(){return fa_center})
	valign = struct_default(_data, "valign", function(){return fa_middle})
	
	cache = {
		x: 0,
		y: 0,
	}
	
	static step = function(_context) {
		cache.x = get_x(_context)
		cache.y = get_y(_context)
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
	
	static render = function() {
		var _halign = draw_get_halign()
		var _valign = draw_get_valign()
		draw_set_halign(halign)
		draw_set_valign(valign)
		draw_text(cache.x, cache.y, read(text))
		draw_set_halign(_halign)
		draw_set_valign(_valign)
	}
}