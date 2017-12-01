package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PalancaVerde extends FlxSprite 
{

	var palancaVerde:FlxSprite;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		palancaVerde = new FlxSprite(50, 50);
		palancaVerde.loadGraphic(AssetPaths.Verde_0_NB_E0__png);
		y = y + 17;
			
	}
	
}