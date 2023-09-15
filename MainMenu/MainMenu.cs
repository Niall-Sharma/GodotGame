using Godot;
using System;
using System.ComponentModel;

public partial class MainMenu : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GetNode<CanvasItem>("Options").Visible = false;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	private void _on_start_button_pressed()
	{
		GetTree().ChangeSceneToFile("res://Master/master.tscn");
	}


	private void _on_options_button_pressed()
	{

		GetNode<CanvasItem>("Options").Visible = true;
		GetNode<CanvasItem>("Main").Visible = false;

 	}


	private void _on_quit_button_pressed()
	{
		
		GetTree().Quit();
	}
	private void _on_back_button_pressed()
	{
		GetNode<CanvasItem>("Options").Visible = false;
		GetNode<CanvasItem>("Main").Visible = true;

	}
	private void _on_level_back_button_pressed(){
		GetNode<CanvasItem>("LevelSelect").Visible = false;
		GetNode<CanvasItem>("Main").Visible = true;

	}

}

