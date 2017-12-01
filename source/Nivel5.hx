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
class Nivel5 extends FlxState
{

	private var palancaRoja:PalancaRoja;
	private var palancaAzul:PalancaAzul;
	private var palancaVerde:PalancaVerde;
	private var player:Player;
	private var BrilloRojo:Bool = false;
	private var BrilloVerde:Bool = false;

	private var PosRojo:Bool = true;
	private var PosVerde:Bool = true;

	private var puertaRoja:PuertaRoja;
	private var puertaAzul:PuertaAzul;
	private var puertaVerde:PuertaVerde;
	private var TimerPuerta:Int = 0;
	private var nivel5:FlxTilemap;
	private var bandera:Bandera;
	private var _emitter:FlxEmitter;
	private var palancaRojasGrup:FlxTypedGroup<PalancaRoja>;
	private var puertasRojasGrup:FlxTypedGroup<PuertaRoja>;
	private var palancaAzulGrup:FlxTypedGroup<PalancaAzul>;
	private var puertasAzulGrup:FlxTypedGroup<PuertaAzul>;
	private var palancaVerdeGrup:FlxTypedGroup<PalancaVerde>;
	private var puertasVerdeGrup:FlxTypedGroup<PuertaVerde>;
	private var PosAzul:Bool = false;
	private var BrilloAzul:Bool = false;
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
		palancaAzulGrup = new FlxTypedGroup<PalancaAzul>();
		palancaVerdeGrup = new FlxTypedGroup<PalancaVerde>();
		puertasRojasGrup = new FlxTypedGroup<PuertaRoja>();
		puertasAzulGrup = new FlxTypedGroup<PuertaAzul>();
		puertasVerdeGrup = new FlxTypedGroup<PuertaVerde>();

		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Nivel5__oel);
		nivel5 = loader.loadTilemap(AssetPaths.tiles__png, 32, 32, "Tiles");
		loader.loadEntities(placeEntites, "Entities");
		nivel5.setTileProperties(0, FlxObject.NONE);
		FlxG.camera.follow(player);
		FlxG.camera.setScrollBounds(0, nivel5.width, 0, nivel5.height);

		resetBar = new FlxBar(player.x - 20, player.y - 20, LEFT_TO_RIGHT, 60, 8, this, "resetTimer", 0, 100);
		FlxG.sound.playMusic(AssetPaths.Music__wav);
		
		add(palancaRojasGrup);
		add(palancaAzulGrup);
		add(palancaVerdeGrup);
		add(puertasVerdeGrup);
		add(puertasRojasGrup);
		add(puertasAzulGrup);
		add(nivel5);
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		palancasVerdes();
		palancasRojas();
		palancasAzules();
		collides();
		banderaWin();
		resetbar();
	}

	public function palancasRojas():Void
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
								MovPuertasRojas();
							}
							else
							{
								PosRojo = true;
								TimerPuerta = 0;
								camera.shake(0.005, 0.5);
								MovPuertasRojas();
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

	public function palancasAzules():Void
	{
		for (i in 0...palancaAzulGrup.length)
		{

			if (Math.abs(player.x - palancaAzulGrup.members[i].x) + Math.abs(player.y - palancaAzulGrup.members[i].y) <= 40)
			{
				if (PosAzul == false)
				{
					palancaAzulGrup.members[i].loadGraphic(AssetPaths.Azul_0_CB_E1__png);
				}
				else
				{
					palancaAzulGrup.members[i].loadGraphic(AssetPaths.Azul_0_CB_E0__png);
				}

				BrilloAzul = true;

				if (palancaAzulGrup.members[i].overlapsPoint(FlxG.mouse.getWorldPosition()) == true)
				{
					if (TimerPuerta > 84)
					{
						if (FlxG.mouse.justPressed)
						{
							palancaAzulGrup.members[i].loadGraphic(AssetPaths.Roja_0_CB_E0__png);
							if (PosAzul == true)
							{
								PosAzul = false;
								TimerPuerta = 0;
								camera.shake(0.005, 0.5);
								MovPuertasAzul();
							}
							else
							{
								PosAzul = true;
								TimerPuerta = 0;
								camera.shake(0.005, 0.5);
								MovPuertasAzul();
							}

						}
					}
				}
			}
			else
			{
				if (PosAzul == false)
				{
					palancaAzulGrup.members[i].loadGraphic(AssetPaths.Azul_0_NB_E1__png);
				}
				else
				{
					palancaAzulGrup.members[i].loadGraphic(AssetPaths.Azul_0_NB_E0__png);
				}
				BrilloAzul = false;
			}
		}
	}

	public function palancasVerdes():Void
	{
		for (i in 0...palancaVerdeGrup.length)
		{

			if (Math.abs(player.x - palancaVerdeGrup.members[i].x) + Math.abs(player.y - palancaVerdeGrup.members[i].y) <= 40)
			{
				if (PosVerde == false)
				{
					palancaVerdeGrup.members[i].loadGraphic(AssetPaths.Verde_0_CB_E1__png);
				}
				else
				{
					palancaVerdeGrup.members[i].loadGraphic(AssetPaths.Verde_0_CB_E0__png);
				}

				BrilloVerde = true;

				if (palancaVerdeGrup.members[i].overlapsPoint(FlxG.mouse.getWorldPosition()) == true)
				{
					if (TimerPuerta > 84)
					{
						if (FlxG.mouse.justPressed)
						{
							palancaVerdeGrup.members[i].loadGraphic(AssetPaths.Verde_0_CB_E0__png);
							if (PosVerde == true)
							{
								PosVerde = false;
								TimerPuerta = 0;
								camera.shake(0.005, 0.5);
								MovPuertasVerde();
							}
							else
							{
								PosVerde = true;
								TimerPuerta = 0;
								camera.shake(0.005, 0.5);
								MovPuertasVerde();
							}

						}
					}
				}
			}
			else
			{
				if (PosVerde == false)
				{
					palancaVerdeGrup.members[i].loadGraphic(AssetPaths.Verde_0_NB_E1__png);
				}
				else
				{
					palancaVerdeGrup.members[i].loadGraphic(AssetPaths.Verde_0_NB_E0__png);
				}
				BrilloVerde = false;
			}
		}
	}

	public function collides():Void
	{
		FlxG.collide(player, puertasRojasGrup);
		FlxG.collide(player, nivel5);
		FlxG.collide(palancaRojasGrup, nivel5);
		FlxG.collide(palancaAzulGrup, nivel5);
		FlxG.collide(player, puertasAzulGrup);
		FlxG.collide(player, puertasVerdeGrup);
		
	}

	public function banderaWin():Void
	{
		if (FlxG.collide(player, bandera))
		{
			FlxG.switchState(new Ganaste());
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
				FlxG.switchState(new Nivel5());
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

	public function MovPuertasVerde():Void
	{
		for (i in 0 ...puertasVerdeGrup.length)
		{
			falseMovement();
			if (PosVerde == true)
				FlxTween.tween(puertasVerdeGrup.members[i], {y: puertasVerdeGrup.members[i].y - 64}, 2, {type: FlxTween.ONESHOT, ease: FlxEase.quartInOut, onComplete: trueMovement});
			else
				FlxTween.tween(puertasVerdeGrup.members[i], {y: puertasVerdeGrup.members[i].y + 64}, 2, {type: FlxTween.ONESHOT, ease: FlxEase.quartInOut, onComplete: trueMovement});

			_emitter = new FlxEmitter(puertasVerdeGrup.members[i].x + 16, puertasVerdeGrup.members[i].y + 10, 20);
			_emitter.makeParticles(2, 2, FlxColor.BLACK, 20);
			add(_emitter);
			_emitter.start();
		}
	}

	public function MovPuertasAzul():Void
	{
		for (i in 0 ...puertasAzulGrup.length)
		{
			falseMovement();
			if (PosAzul == true)
				FlxTween.tween(puertasAzulGrup.members[i], {y: puertasAzulGrup.members[i].y + 64}, 2, {type: FlxTween.ONESHOT, ease: FlxEase.quartInOut, onComplete: trueMovement});
			else
				FlxTween.tween(puertasAzulGrup.members[i], {y: puertasAzulGrup.members[i].y - 64}, 2, {type: FlxTween.ONESHOT, ease: FlxEase.quartInOut, onComplete: trueMovement});

			_emitter = new FlxEmitter(puertasAzulGrup.members[i].x + 16, puertasAzulGrup.members[i].y + 10, 20);
			_emitter.makeParticles(2, 2, FlxColor.BLACK, 20);
			add(_emitter);
			_emitter.start();
		}
	}
	public function MovPuertasRojas():Void
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
			case "PuertaRoja":
				puertaRoja = new PuertaRoja(X, Y, AssetPaths.PuertaRoja__png);
				puertasRojasGrup.add(puertaRoja);
			case "Bandera":
				bandera = new Bandera(X, Y, AssetPaths.Bndera__png);
				add(bandera);
			case "palancaRoja":
				palancaRoja = new PalancaRoja(X, Y, AssetPaths.Roja_0_NB_E0__png);
				palancaRojasGrup.add(palancaRoja);
			case"PuertaAzul":
				puertaAzul = new PuertaAzul(X, Y, AssetPaths.PuertaAzul__png);
				puertasAzulGrup.add(puertaAzul);
			case"PalancaAzul":
				palancaAzul = new PalancaAzul(X, Y, AssetPaths.Azul_0_NB_E0__png);
				palancaAzulGrup.add(palancaAzul);
			case"PalancaVerde":
				palancaVerde = new PalancaVerde(X, Y, AssetPaths.Verde_0_NB_E0__png);
				palancaVerdeGrup.add(palancaVerde);
			case"PuertaVerde":
				puertaVerde = new PuertaVerde(X, Y, AssetPaths.PuertaVerde__png);
				puertasVerdeGrup.add(puertaVerde);
		}
	}
}

