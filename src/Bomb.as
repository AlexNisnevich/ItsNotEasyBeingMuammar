package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Bomb extends Entity 
	{
		[Embed(source = '../assets/bomb.png')] private const BOMB:Class;
		
		public function Bomb(location:Array) 
		{
			graphic = new Image(BOMB);
			super(102 + 21 * location[0], 32 + 21 * location[1]);
			layer -= 100000;
		}
		
	}

}