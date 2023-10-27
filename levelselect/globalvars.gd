extends Node2D

var lvl_num
<<<<<<< HEAD
var lc = [true,true,true,false,false,false,false,false,false,false,true] 
=======
var lc = [true,true,false,false,false,false,false,false,false,false,true] 
>>>>>>> 75cb0dd0baaeb4efc58e8ac7fb3d20f61f3f21fc
	


func addlevel(x):
	lc[x] = true

func setLevel(x):
	lvl_num = x

	
func getLevel():
	return lvl_num

func getlc(x):
	return lc[x]
	
