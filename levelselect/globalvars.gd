extends Node2D

var lvl_num
var lc = [] 

func poop():
	for i in range(9):
		lc.append(false)
	print(lc)
		

func shit():
	print(lc)


func addlevel(x):
	lc[x] = true

func setLevel(x):
	lvl_num = x
	print(lvl_num)
	
func getLevel():
	return lvl_num


	
