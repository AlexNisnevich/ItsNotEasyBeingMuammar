package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class TitleScreen extends World 
	{
		[Embed(source = '../assets/title.png')] private const TITLE:Class;
		
		[Embed(source = '../assets/anthem-gaddafi.mp3')] static private const ANTHEM:Class;
		static public var anthem:Sfx = new Sfx(ANTHEM);
		
		private var playButton:Button;
		
		public function TitleScreen() 
		{
		}
		
		override public function begin():void
		{	
			addGraphic(new Image(TITLE));
			var title:Text = new Text("IT'S NOT EASY BEING MUAMMAR.", 25, 0);
			addGraphic(title);
			anthem.loop();
			
			new Button("Play",  function():void { anthem.stop(); Sounds.playSound("select"); FP.world = new LevelSelect(); }, 35, 220, 19, 1);
			new Button("Instructions",  function():void { anthem.stop(); Sounds.playSound("select"); FP.world = new Instructions(); }, 235, 220, 2, 1);
		}
		
	}

}