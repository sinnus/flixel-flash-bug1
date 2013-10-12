package state;

import entity.GameZone;
import flixel.util.FlxColor;
import flixel.FlxState;
import flixel.FlxG;

class GameState extends FlxState
{

    private var letterZone:GameZone;

    override public function create():Void
	{
        FlxG.log.redirectTraces = false;
		bgColor = FlxColor.AZURE;
		#if !FLX_NO_MOUSE
        FlxG.mouse.useSystemCursor = true;
		#end
		super.create();
        createLetterZone();
	}

    private function createLetterZone():Void {
        letterZone = new GameZone();
        letterZone.init();
        letterZone.startWord(1, "FLIXEL");
        letterZone.startWord(3, "HAXE");
        add(letterZone);
    }

}
