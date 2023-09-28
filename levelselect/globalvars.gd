extends Node2D

var lvl_num

func setLevel(x):
	lvl_num = x
	print(lvl_num)
	
func getLevel():
	return lvl_num
