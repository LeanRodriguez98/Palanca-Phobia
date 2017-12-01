package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Bandera extends FlxSprite 
{
	var bandera:FlxSprite;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		bandera = new FlxSprite();
		bandera.loadGraphic(AssetPaths.Bndera__png);		
		immovable = true;
		
	}
	
}