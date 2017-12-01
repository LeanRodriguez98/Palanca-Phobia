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

/**
 * ...
 * @author ...
 */
class Nivel2 extends FlxState
{
	private var palancaRoja:PalancaRoja;
	private var player:Player;
	private var BrilloRojo:Bool = false;
	private var PosRojo:Bool = true;
	private var puertaRoja:PuertaRoja;
	private var TimerPuerta:Int = 0;
	private var nivel2:FlxTilemap;
	private var bandera:Bandera;
	private var _emitter:FlxEmitter;
	private var palancaRojasGrup:FlxTypedGroup<PalancaRoja>;
	private var puertasRojasGrup:FlxTypedGroup<PuertaRoja>;
	private var resetTimer:Int = 0;
	private var resetBar:FlxBar;
	private var boolresetbar:Bool = true;

	override public function create():Void
	{
		FlxG.worldBounds.width = 1216;
		FlxG.worldBounds.height = 800;
		super.create();
		var background:FlxBackdrop = new FlxBackdrop(AssetPaths.Fondo__png);
		add(background);
		palancaRojasGrup = new FlxTypedGroup<PalancaRoja>();
		puertasRojasGrup = new FlxTypedGroup<PuertaRoja>();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Nivel2__oel);
		nivel2 = loader.loadTilemap(AssetPaths.tiles__png, 32, 32, "Tiles");
		loader.loadEntities(placeEntites, "Entities");
		nivel2.setTileProperties(0, FlxObject.NONE);
		FlxG.camera.follow(player);
		FlxG.camera.setScrollBounds(0, nivel2.width, 0, nivel2.height);
		resetBar = new FlxBar(player.x - 20, player.y - 20, LEFT_TO_RIGHT, 60, 8, this, "resetTimer", 0, 100);
		FlxG.sound.playMusic(AssetPaths.Music__wav);

		add(puertasRojasGrup);
		add(nivel2);
		add(palancaRojasGrup);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		palancas();
		banderaWin();
		collides();
		resetbar();

	}

	public function palancas():Void
	{
		TimerPuerta = TimerPuerta + 1;
		for (i in 0...palancaRojasGrup.length)
		{

			if (Math.abs(player.x - palancaRojasGrup.members[i].x) + Math.abs(player.y - palancaRojasGrup.members[i].y) <= 40)
			{
				if (PosRojo == false)
				{
					palancaRojasGrup.members[i].loadGraphic(AssetPaths.Roja_0_CB_E1__png);
				}
				else
				{
					palancaRojasGrup.members[i].loadGraphic(AssetPaths.Roja_0_CB_E0__png);
				}

				BrilloRojo = true;

				if (palancaRojasGrup.members[i].overlapsPoint(FlxG.mouse.getWorldPosition()) == true)
				{
					if (TimerPuerta > 84)
					{
						if (FlxG.mouse.justPressed)
						{
							palancaRojasGrup.members[i].loadGraphic(AssetPaths.Roja_0_CB_E0__png);
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
					palancaRojasGrup.members[i].loadGraphic(AssetPaths.Roja_0_NB_E1__png);
				}
				else
				{
					palancaRojasGrup.members[i].loadGraphic(AssetPaths.Roja_0_NB_E0__png);
				}
				BrilloRojo = false;
			}
		}
	}

	public function collides():Void
	{
		FlxG.collide(player, puertasRojasGrup);
		FlxG.collide(player, nivel2);
		FlxG.collide(palancaRojasGrup, nivel2);
	}

	public function banderaWin():Void
	{
		if (FlxG.collide(player, bandera))
		{
			FlxG.switchState(new Nivel3());
		}
	}

	public function resetbar():Void
	{
		if (FlxG.keys.pressed.R)
		{
			resetTimer += 1;
			if (boolresetbar == true)
			{
				add(resetBar);
				boolresetbar = false;

			}
			resetBar.x = player.x -20;
			resetBar.y = player.y -20;
			if (resetTimer >= 100)
			{
				FlxG.switchState(new Nivel2());
			}
		}
		if (FlxG.keys.pressed.R == false)
		{
			resetTimer = 0;
			if (boolresetbar == false)
			{
				resetBar.y = -300;
				boolresetbar = true;
			}
		}
	}
	public function MovPuertas():Void
	{
		for (i in 0 ...puertasRojasGrup.length)
		{
			falseMovement();
			if (PosRojo == true)
				FlxTween.tween(puertasRojasGrup.members[i], {y: puertasRojasGrup.members[i].y - 64}, 2, {type: FlxTween.ONESHOT, ease: FlxEase.quartInOut, onComplete: trueMovement});
			else
				FlxTween.tween(puertasRojasGrup.members[i], {y: puertasRojasGrup.members[i].y + 64}, 2, {type: FlxTween.ONESHOT, ease: FlxEase.quartInOut, onComplete: trueMovement});

			_emitter = new FlxEmitter(puertasRojasGrup.members[i].x + 16, puertasRojasGrup.members[i].y + 10, 20);
			_emitter.makeParticles(2, 2, FlxColor.BLACK, 20);
			add(_emitter);
			_emitter.start();
		}
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
			case "Player":
				player = new Player (X, Y, AssetPaths.player__png);
				add(player);
			case "Puerta":
				puertaRoja = new PuertaRoja(X, Y, AssetPaths.PuertaRoja__png);
				puertasRojasGrup.add(puertaRoja);
			case "Bandera":
				bandera = new Bandera(X, Y, AssetPaths.Bndera__png);
				add(bandera);
			case "palanca":
				palancaRoja = new PalancaRoja(X, Y, AssetPaths.Roja_0_NB_E0__png);
				palancaRojasGrup.add(palancaRoja);
		}
	}

}