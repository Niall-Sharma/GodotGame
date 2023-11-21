extends Node2D

var lvl_num

var lc = [true,true,false,true,false,false,false,false,false,false,true] 

	


func addlevel(x):
	lc[x] = true

func setLevel(x):
	lvl_num = x

	
func getLevel():
	return lvl_num

func getlc(x):
	return lc[x]
	
