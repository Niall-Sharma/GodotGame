extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.text = "0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($RichTextLabel.text != $/root/Master._get_coin_counter()):
		$RichTextLabel.text = $/root/Master._get_coin_counter()
