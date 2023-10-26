extends StaticBody2D



func _on_land_area_body_entered(body):
	if body.name == "Player":
		var area = self.get_child(0)

		if area.name == "land_area":
			remove_child(area)
			$/root/Master._add_coin()
