package  
{
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Sounds 
	{
		[Embed(source = '../assets/explode.mp3')] static private const EXPLODE:Class;
		static public var explode:Sfx = new Sfx(EXPLODE);

		[Embed(source = '../assets/explode2.mp3')] static private const EXPLODE2:Class;
		static public var explode2:Sfx = new Sfx(EXPLODE2);
		
		[Embed(source = '../assets/lose.mp3')] static private const LOSE:Class;
		static public var lose:Sfx = new Sfx(LOSE);
		
		[Embed(source = '../assets/place.mp3')] static private const PLACE:Class;
		static public var place:Sfx = new Sfx(PLACE);
		
		[Embed(source = '../assets/select.mp3')] static private const SELECT:Class;
		static public var select:Sfx = new Sfx(SELECT);
		
		[Embed(source = '../assets/win.mp3')] static private const WIN:Class;
		static public var win:Sfx = new Sfx(WIN);
		
		[Embed(source = '../assets/wrong.mp3')] static private const WRONG:Class;
		static public var wrong:Sfx = new Sfx(WRONG);
		
		public function Sounds() 
		{
		}
		
		static public function playSound(name:String):void
		{
			switch (name)
			{
				case "explode":
					explode.play();
					break;
				
				case "explode2":
					explode2.play();
					break;
				
				case "lose":
					lose.play();
					break; 
					
				case "place":
					place.play();
					break; 
				
				case "select":
					select.play();
					break; 

				case "win":
					win.play();
					break; 
				
				case "wrong":
					wrong.play();
					break; 
				}
		}
		
		static public function stopSound(name:String):void
		{
			switch (name)
			{
				case "explode":
					explode.stop();
					break;
				
				case "explode2":
					explode.stop();
					break;
				
				case "lose":
					lose.stop();
					break; 
					
				case "place":
					place.stop();
					break; 
				
				case "select":
					select.stop();
					break; 

				case "win":
					win.stop();
					break; 
				
				case "wrong":
					wrong.stop();
					break; 
				}
		}
		
	}

}