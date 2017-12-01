package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class Inicio extends FlxState 
{	
	var texto:FlxText;
	
	override public function create():Void 
	{
		texto = new FlxText (90, 20, 0, "PalancaPhobia", 50);
		texto.color = 0x00ff00;
		add (texto);
		
		texto = new FlxText (105, 120, 0, "Leandro Rodriguez", 35);
		texto.color = 0x00ff00;
		add (texto);
		
		texto = new FlxText (40, 220, 0, "Dale un cabezazo a", 24);
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 260, 0, "Z para iniciar", 24);		
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 320, 0, "Dale un cabezazo a", 24);
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 360, 0, "X para ver los controles", 24);		
		texto.color = 0x00ff00;
		add(texto);
		FlxG.sound.playMusic(AssetPaths.Music__wav);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.Z)
			FlxG.switchState(new PlayState());
		if (FlxG.keys.justPressed.X)
			FlxG.switchState(new Controes());
		
	}
	
	
}