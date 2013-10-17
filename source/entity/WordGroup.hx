package entity;

import flixel.util.FlxPoint;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flash.display.BitmapData;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class WordGroup extends FlxSpriteGroup {

    private var texts:Array<FlxText>;
    private var backgrounds:Array<FlxSprite>;
    public static var GAP:Int = 2;

    public function init(word:String, size:Int, letterBackgroundBitmap:BitmapData):Void {
        revive();
        backgrounds = [];
        texts = [];
        var x = 0;
        var y = 0;
        for(i in 0...word.length) {
            var letter = word.charAt(i);
            var text = new FlxText(x, y, size, letter);
            text.systemFont = "AGOpus Roman";
            text.alignment = "center";
            text.size = size - 8;
            text.color = FlxColor.BLACK;
            text.forceComplexRender = true;
            text.moves = true;
            var sprite:FlxSprite = new FlxSprite(x, y);
            sprite.loadGraphic(letterBackgroundBitmap);
            sprite.forceComplexRender = true;
            backgrounds.push(sprite);
            add(sprite);
            texts.push(text);
            add(text);
            x += size + GAP;
        }
        this.velocity = new FlxPoint(-55, 0);
    }

    override function update():Void {
        super.update();
    }

}