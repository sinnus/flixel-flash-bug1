package entity;

import flixel.FlxG;
import flash.display.BitmapData;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;

class GameZone extends FlxTypedGroup<WordGroup> {

    private var letterSize:Int;
    private var letterBackgroundBitmap:BitmapData;

    public function init():Void {
        letterSize = 40;
        letterBackgroundBitmap = createLetterBackgroundBitmap(0x53bec8);
    }

    public function startWord(lineNo:Int, word:String) {
        var wordGroup:WordGroup = recycle(WordGroup);
        wordGroup.x = FlxG.width;
        wordGroup.y = lineNo * 25;
        wordGroup.init(word, letterSize, letterBackgroundBitmap);
        add(wordGroup);
    }

    private function createLetterBackgroundBitmap(color:UInt):BitmapData {
        var gfx = FlxSpriteUtil.flashGfxSprite.graphics;
        gfx.beginFill(color);
        gfx.drawRoundRect(0, 0, letterSize, letterSize, 2, 2);
        gfx.endFill();
        gfx.lineStyle(2, FlxColor.WHITE);
        gfx.drawRoundRect(0, 0, letterSize, letterSize, 2, 2);
        var bitmapData = new BitmapData(letterSize, letterSize, true, color);
        bitmapData.draw(FlxSpriteUtil.flashGfxSprite);
        return bitmapData;
    }


}
