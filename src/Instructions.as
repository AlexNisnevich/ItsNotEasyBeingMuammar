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
	public class Instructions extends World 
	{
		[Embed(source = '../assets/instructions.png')] private const INSTRUCTIONS:Class;
		
		private var playButton:Button;
		
		public function Instructions() 
		{
		}
		
		override public function begin():void
		{	
			addGraphic(new Image(INSTRUCTIONS));
			new Button("Main Menu", function():void { FP.world = new TitleScreen(); }, 235, 220, 6, 1);
		}
		
	}

}