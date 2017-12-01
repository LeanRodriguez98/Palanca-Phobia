package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.effects.particles.FlxEmitter;
import flixel.math.FlxPoint;
import flixel.util.FlxCollision;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxObject;
import flixel.math.FlxRandom;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.ui.FlxBar;
import flixel.text.FlxText;
import flixel.input.gamepad.FlxGamepad;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var palancaRoja:PalancaRoja;
	private var player:Player;
	private var BrilloRojo:Bool = false;
	private var PosRojo:Bool = true;
	private var puertaRoja:PuertaRoja;
	private var TimerPuerta:Int = 0;
	private var Nivel1:FlxTilemap;
	private var bandera:Bandera;
	private var _emitter:FlxEmitter;
	private var resetTimer:Int = 0;
	private var resetBar:FlxBar;
	private var boolresetbar:Bool = true;
	

	override public function create():Void
	{
		super.create();
		var background:FlxBackdrop = new FlxBackdrop(AssetPaths.Fondo__png);
		add(background);

		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Nivel1__oel);
		Nivel1 = loader.loadTilemap(AssetPaths.tiles__png, 32, 32, "Tiles");
		loader.loadEntities(placeEntites, "Entities");
		Nivel1.setTileProperties(0, FlxObject.NONE);
		player = new Player(64, 400);
		add(Nivel1);
		add(player);
		player.y -= 120;
		puertaRoja.immovable = true;
		resetBar = new FlxBar(player.x - 20, player.y - 20, LEFT_TO_RIGHT, 60, 8, this, "resetTimer", 0, 100);
		FlxG.sound.playMusic(AssetPaths.Music__wav);

		add(resetBar);
		resetBar.kill();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		TimerPuerta = TimerPuerta + 1;
		
		collides();
		palancas();
		resetbar();
		banderaWin();
	}	
	
	public function banderaWin():Void
	{
		if (FlxG.collide(player, bandera))
		{
			FlxG.switchState(new Nivel2());
		}
	}
	
	public function collides():Void
	{
		FlxG.collide(player, puertaRoja);
		FlxG.collide(player, Nivel1);
		FlxG.collide(palancaRoja, Nivel1);
	}
	
	public function palancas():Void 
	{
		if (Math.abs(player.x-palancaRoja.x) + Math.abs(player.y - palancaRoja.y) <= 40)
		{
			if (PosRojo == false)
			{
				palancaRoja.loadGraphic(AssetPaths.Roja_0_CB_E1__png);
			}
			else
			{
				palancaRoja.loadGraphic(AssetPaths.Roja_0_CB_E0__png);
			}
			
			BrilloRojo = true;
			
			if (palancaRoja.overlapsPoint(FlxG.mouse.getWorldPosition()) == true)
			{
				if (TimerPuerta > 84)
				{
					if (FlxG.mouse.justPressed)
					{
						palancaRoja.loadGraphic(AssetPaths.Roja_0_CB_E0__png);
						if (PosRojo == true)
						{
							PosRojo = false;
							TimerPuerta = 0;
							camera.shake(0.005, 0.5);
							MovPuertas();
						}
						else
						{
							PosRojo = true;
							TimerPuerta = 0;
							camera.shake(0.005, 0.5);
							MovPuertas();
						}
					}
				}
			}
		}
		else
		{
			if (PosRojo == false)
			{
				palancaRoja.loadGraphic(AssetPaths.Roja_0_NB_E1__png);
			}
			else
			{
				palancaRoja.loadGraphic(AssetPaths.Roja_0_NB_E0__png);
			}
			BrilloRojo = false;
		}
	}
	
	public function resetbar():Void 
	{
		if (FlxG.keys.pressed.R)
		{
			resetTimer += 1;
			if (boolresetbar == true)
			{
				resetBar.revive();
				boolresetbar = false;				
			}
			resetBar.x = player.x -20;
			resetBar.y = player.y -20;
			if (resetTimer >= 100)
			{
				FlxG.switchState(new PlayState());
			}
		}
		if (FlxG.keys.pressed.R == false)
		{
			resetTimer = 0;
			if (boolresetbar == false)
			{
				resetBar.kill();
				boolresetbar = true;					
			}			
		}
	}
	public function MovPuertas():Void
	{
		falseMovement();
		if (PosRojo == true)
			FlxTween.tween(puertaRoja, {y: puertaRoja.y + 64}, 1.4, {type: FlxTween.ONESHOT, ease: FlxEase.quartInOut, onComplete: trueMovement});
		else
			FlxTween.tween(puertaRoja, {y: puertaRoja.y - 64}, 1.4, {type: FlxTween.ONESHOT, ease: FlxEase.quartInOut, onComplete: trueMovement});

		_emitter = new FlxEmitter(puertaRoja.x + 16, puertaRoja.y + 10, 20);
		_emitter.makeParticles(2, 2, FlxColor.BLACK, 20);
		add(_emitter);
		_emitter.start();
	}
	public function falseMovement():Void
	{
		Reg.movement = false;
	}
	private function trueMovement(tween:FlxTween):Void
	{
		Reg.movement = true;
	}
	function placeEntites (entityName:String, entityData:Xml):Void
	{
		var X:Int = Std.parseInt(entityData.get("x"));
		var Y:Int = Std.parseInt(entityData.get("y"));
		switch (entityName)
		{			
			case "PuertaRoja":
				puertaRoja = new PuertaRoja(X, Y, AssetPaths.PuertaRoja__png);
				add(puertaRoja);
			case "Bandera":
				bandera = new Bandera(X, Y, AssetPaths.Bndera__png);
				add(bandera);
			case "PalancaRoja":
				palancaRoja = new PalancaRoja(X, Y, AssetPaths.Roja_0_NB_E0__png);
				add(palancaRoja);
		}
	}
}