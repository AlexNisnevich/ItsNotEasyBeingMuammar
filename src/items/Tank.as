package items 
{
	import net.flashpunk.graphics.Image;
	import Math;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Tank extends Item 
	{
		[Embed(source = '../../assets/tank.png')] private const ITEM:Class;
		
		public function Tank(n:int) 
		{
			graphic = new Image(ITEM);
			super(n);
		}
		
		override public function item():String {
			return "tank";
		}
		
		override public function description():Array {
			return [ "High value.", "High visibility."];
		}
		
		override public function visibility():int {
			return 3 * (1 + movePenalty);
		}
		
		override public function value():int {
			return 4;
		}
	}

}