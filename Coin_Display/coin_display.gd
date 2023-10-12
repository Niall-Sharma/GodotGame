extends Node2D
var string_version


# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.text = "0"
	string_version = "0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	string_version = str($/root/Master._get_coin_counter())
	if($RichTextLabel.text != string_version):
		$RichTextLabel.text = string_version
