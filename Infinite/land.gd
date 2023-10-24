extends StaticBody2D

var count = 0

func _on_land_area_body_entered(body):
	if body.name == "Player":
		if count == 0:
			var area = self.get_child(0)
			remove_child(area)
			count == 1
		$/root/Master._add_coin()
