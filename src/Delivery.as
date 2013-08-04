package  
{
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Delivery extends World 
	{
		[Embed(source = '../assets/delivery1.png')] private const D1:Class;
		[Embed(source = '../assets/delivery2.png')] private const D2:Class;
		[Embed(source = '../assets/delivery3.png')] private const D3:Class;
		[Embed(source = '../assets/delivery4.png')] private const D4:Class;
		[Embed(source = '../assets/delivery5.png')] private const D5:Class;
		[Embed(source = '../assets/delivery6.png')] private const D6:Class;
		
		private var num:int = 0;
		
		public function Delivery(n:int) 
		{
			num = n;
			switch (num)
			{
				case 1:
					addGraphic(new Image(D1));
					break;
				
				case 2:
					addGraphic(new Image(D2));
					break;
				
				case 3:
					addGraphic(new Image(D3));
					break;
				
				case 4:
					addGraphic(new Image(D4));
					break;
				
				case 5:
					addGraphic(new Image(D5));
					break;
				
				case 6:
					addGraphic(new Image(D6));
					break;
			}
			
		}
		
		override public function begin():void {
			new Button("OK",  function():void { Sounds.playSound("select"); Main.loadLevel(num); }, 135, 220, 23, 1);
		}
		
	}

}