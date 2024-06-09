extends Polygon2D

var is_fill := true
var is_drain := false


func _process(delta: float) -> void:
	var old_offset = (texture as GradientTexture1D).gradient.offsets[1]
	var new_offset
	
	if is_fill:
		new_offset = old_offset + delta
	elif is_drain:
		new_offset = old_offset - delta

	(texture as GradientTexture1D).gradient.offsets[1] = clampf(new_offset, 0.0, 1.0)

	if is_fill and new_offset >= 1:
		is_fill = false
		is_drain = true
	elif is_drain and new_offset <= 0:
		is_fill = true
		is_drain = false
