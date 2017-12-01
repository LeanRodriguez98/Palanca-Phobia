package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PalancaRoja extends FlxSprite 
{
	var palancaRoja:FlxSprite;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		palancaRoja = new FlxSprite(50, 50);
		palancaRoja.loadGraphic(AssetPaths.Roja_0_NB_E0__png);
		y = y + 17;
		
		
		
	}
	
}