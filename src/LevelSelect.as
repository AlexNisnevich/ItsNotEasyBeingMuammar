package  
{
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class LevelSelect extends World 
	{
		[Embed(source = '../assets/levelselect_bg.png')] private const BG:Class;
		
		public var selected:int = -1;
		
		public function LevelSelect() 
		{
		}
		
		override public function begin():void
		{
			Sounds.stopSound("lose"); Sounds.stopSound("win");
			
			addGraphic(new Image(BG));
			var title:Text = new Text("LEVEL SELECT", 110, 0);
			title.color = 0x000000;
			addGraphic(title);
			
			add(new LevelDot("Bani Walid", 1, 87, 58));
			add(new LevelDot("Sirte", 2, 147, 66));
			add(new LevelDot("Brega", 3, 200, 83));
			add(new LevelDot("Misrata", 4, 118, 46));
			add(new LevelDot("Benghazi", 5, 213, 50));
			
			new Button("Main Menu", function():void { FP.world = new TitleScreen(); }, 135, 220, 6, 1);
		}
		
	}

}