extends Node2D

#SpdBst, DJmp, BigMode, MiniMode, DmgBst, JmpBst, Fly??

func _DmgBst():
	$/root/Player/StateMachine/Attack._add_Dmg()



func _on_place_holder_powerup_pressed():
	if($/root/Master._get_coin_counter() >= 3):
		$/root/Master._set_coin_counter($/root/Master._get_coin_counter() - 3)
		_DmgBst()
