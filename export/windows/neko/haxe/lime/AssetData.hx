package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Nivel1.oel", "assets/data/Nivel1.oel");
			type.set ("assets/data/Nivel1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Nivel2.oel", "assets/data/Nivel2.oel");
			type.set ("assets/data/Nivel2.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Nivel2.oep", "assets/data/Nivel2.oep");
			type.set ("assets/data/Nivel2.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Nivel3.oel", "assets/data/Nivel3.oel");
			type.set ("assets/data/Nivel3.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Nivel4.oel", "assets/data/Nivel4.oel");
			type.set ("assets/data/Nivel4.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Nivel5.oel", "assets/data/Nivel5.oel");
			type.set ("assets/data/Nivel5.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Bndera.png", "assets/images/Bndera.png");
			type.set ("assets/images/Bndera.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fondo.png", "assets/images/Fondo.png");
			type.set ("assets/images/Fondo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Azul-0-CB-E0.png", "assets/images/PalancasRojas/Azul-0-CB-E0.png");
			type.set ("assets/images/PalancasRojas/Azul-0-CB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Azul-0-CB-E1.png", "assets/images/PalancasRojas/Azul-0-CB-E1.png");
			type.set ("assets/images/PalancasRojas/Azul-0-CB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Azul-0-NB-E0.png", "assets/images/PalancasRojas/Azul-0-NB-E0.png");
			type.set ("assets/images/PalancasRojas/Azul-0-NB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Azul-0-NB-E1.png", "assets/images/PalancasRojas/Azul-0-NB-E1.png");
			type.set ("assets/images/PalancasRojas/Azul-0-NB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-0-CB-E0.png", "assets/images/PalancasRojas/Roja-0-CB-E0.png");
			type.set ("assets/images/PalancasRojas/Roja-0-CB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-0-CB-E1.png", "assets/images/PalancasRojas/Roja-0-CB-E1.png");
			type.set ("assets/images/PalancasRojas/Roja-0-CB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-0-NB-E0.png", "assets/images/PalancasRojas/Roja-0-NB-E0.png");
			type.set ("assets/images/PalancasRojas/Roja-0-NB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-0-NB-E1.png", "assets/images/PalancasRojas/Roja-0-NB-E1.png");
			type.set ("assets/images/PalancasRojas/Roja-0-NB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-270-CB-E0.png", "assets/images/PalancasRojas/Roja-270-CB-E0.png");
			type.set ("assets/images/PalancasRojas/Roja-270-CB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-270-CB-E1.png", "assets/images/PalancasRojas/Roja-270-CB-E1.png");
			type.set ("assets/images/PalancasRojas/Roja-270-CB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-270-NB-E0.png", "assets/images/PalancasRojas/Roja-270-NB-E0.png");
			type.set ("assets/images/PalancasRojas/Roja-270-NB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-270-NB-E1.png", "assets/images/PalancasRojas/Roja-270-NB-E1.png");
			type.set ("assets/images/PalancasRojas/Roja-270-NB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-90-CB-E0.png", "assets/images/PalancasRojas/Roja-90-CB-E0.png");
			type.set ("assets/images/PalancasRojas/Roja-90-CB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-90-CB-E1.png", "assets/images/PalancasRojas/Roja-90-CB-E1.png");
			type.set ("assets/images/PalancasRojas/Roja-90-CB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-90-NB-E0.png", "assets/images/PalancasRojas/Roja-90-NB-E0.png");
			type.set ("assets/images/PalancasRojas/Roja-90-NB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Roja-90-NB-E1.png", "assets/images/PalancasRojas/Roja-90-NB-E1.png");
			type.set ("assets/images/PalancasRojas/Roja-90-NB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Verde-0-CB-E0.png", "assets/images/PalancasRojas/Verde-0-CB-E0.png");
			type.set ("assets/images/PalancasRojas/Verde-0-CB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Verde-0-CB-E1.png", "assets/images/PalancasRojas/Verde-0-CB-E1.png");
			type.set ("assets/images/PalancasRojas/Verde-0-CB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Verde-0-NB-E0.png", "assets/images/PalancasRojas/Verde-0-NB-E0.png");
			type.set ("assets/images/PalancasRojas/Verde-0-NB-E0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PalancasRojas/Verde-0-NB-E1.png", "assets/images/PalancasRojas/Verde-0-NB-E1.png");
			type.set ("assets/images/PalancasRojas/Verde-0-NB-E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Puertas/PuertaAzul.png", "assets/images/Puertas/PuertaAzul.png");
			type.set ("assets/images/Puertas/PuertaAzul.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Puertas/PuertaRoja.png", "assets/images/Puertas/PuertaRoja.png");
			type.set ("assets/images/Puertas/PuertaRoja.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Puertas/PuertaVerde.png", "assets/images/Puertas/PuertaVerde.png");
			type.set ("assets/images/Puertas/PuertaVerde.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/Music.mp3", "assets/music/Music.mp3");
			type.set ("assets/music/Music.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/Music.wav", "assets/music/Music.wav");
			type.set ("assets/music/Music.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
