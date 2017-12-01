package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class Ganaste extends FlxState 
{

	var texto:FlxText;
	
	override public function create():Void 
	{
		texto = new FlxText (170, 20, 0, "Ganaste", 50);
		texto.color = 0x00ff00;
		add (texto);
		
		texto = new FlxText (40, 150, 0, "Sos lo más mejor del mundo", 24);
		texto.color = 0x00ff00;
		add(texto);
		
	
		
		texto = new FlxText (40, 230, 0, "Dale un cabezazo a", 24);
		texto.color = 0x00ff00;
		add(texto);
		
		texto = new FlxText (40, 270, 0, "z para reiniciar", 24);		
		texto.color = 0x00ff00;
		add(texto);
		FlxG.sound.playMusic(AssetPaths.Music__wav);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.Z)
			FlxG.switchState(new PlayState());
		
		
	}
}