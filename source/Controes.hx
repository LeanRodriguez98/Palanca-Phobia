package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class Controes extends FlxState 
{

	var texto:FlxText;
	
	override public function create():Void 
	{
		
		
		texto = new FlxText (40, 50, 0, "Si le das cabezazos a", 24);
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 90, 0, "WAD te moves", 24);		
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 150, 0, "Si mantenes un cabezazo en", 24);
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 190, 0, "R reinicias el nivel", 24);		
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 250, 0, "Si le das un cabezazo al click izquierdo", 24);
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 290, 0, "sobre una palanca la activas", 24);		
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 350, 0, "Dale un cabezazo a", 24);
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 390, 0, "Z para volver al inicio", 24);		
		texto.color = 0x00ff00;
		add(texto);
		FlxG.sound.playMusic(AssetPaths.Music__wav);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.Z)
			FlxG.switchState(new Inicio());
	
		
	}
	
}