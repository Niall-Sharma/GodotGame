extends Label
var string_version


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "0"
	string_version = "0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	string_version = str($/root/Master._get_coin_counter())
	if(text != string_version):
		text = string_version
		
		
