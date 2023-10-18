extends Node2D

var lvl_num
var lc = [true,false,false,false,false,false,false,false,false,false] 


func check_lock():
	for i in range(len(lc)):
		if lc[i] == true:
			get_tree().change_scene_to_file("res://Master/master.tscn")
		elif lc[i] == false:
			print ("Locked")
			get_tree().change_scene_to_file("res://levelselect/level_select.tscn")

func lvl_lock(levelcomplete):
	for i in range(len(levelcomplete)):
		if i != 0:
			if lc[i] == true:
				lc[i+1] = true
			elif lc[i] == false:
				lc[i+1] == false
	

func lcprint():
	print(lc)


func addlevel(x):
	lc[x] = true

func setLevel(x):
	lvl_num = x
	print(lvl_num)
	
func getLevel():
	return lvl_num


	
