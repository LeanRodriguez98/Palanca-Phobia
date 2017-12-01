package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.input.gamepad.FlxGamepad;

/**
 * ...
 * @author Leandro
 */

enum Estado
{
	IDLE;
	RUN;
	JUMP;
}

class Player extends FlxSprite
{
	private var state:Estado = Estado.IDLE;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(20, 20, 0xffff00ff);

		acceleration.y = 1500;
	}

	override public function update(elapsed:Float):Void
	{
		stateMachine();
		super.update(elapsed);

	}

	private function stateMachine():Void
	{
		switch (state)
		{
			case Estado.IDLE:
				jump();
				Movement();

				if (velocity.y != 0)
				{
					state = Estado.JUMP;
				}
				else if (velocity.x != 0)
				{
					state = Estado.RUN;
				}
			case Estado.JUMP:
				Movement();

				if (velocity.y == 0)
				{
					if (velocity.x != 0)
					{
						state = Estado.RUN;
					}
					else
					{
						state = Estado.IDLE;
					}
				}

			case Estado.RUN:
				jump();
				Movement();

				if (velocity.y != 0)
				{
					state = Estado.JUMP;
				}
				else if (velocity.x == 0)
				{
					state = Estado.IDLE;
				}
		}
	}

	private function jump():Void
	{
		if (Reg.movement == true)
		{
			if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
			{
				velocity.y -= 500;
			}
		}
	}

	private function Movement():Void
	{
		velocity.x = 0;
		if (Reg.movement == true)
		{
			if (FlxG.keys.pressed.D)
			{
				velocity.x += 300;
			}
			if (FlxG.keys.pressed.A)
			{
				velocity.x -= 300;
			}
		}
		
	}

}