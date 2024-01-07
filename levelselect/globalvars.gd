extends Node2D

var lvl_num

var lc = [true,true,true,true,true,true,true,true,true,true,true] 

var playerDamage = 1
	


func addlevel(x):
	lc[x] = true

func setLevel(x):
	lvl_num = x

	
func getLevel():
	return lvl_num

func getlc(x):
	return lc[x]
	
func getPlayerDamage():
	return playerDamage
	
func addPlayerDamage():
	playerDamage+=1
