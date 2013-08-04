package items 
{
	import net.flashpunk.graphics.Image;
	import Math;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Guns extends Item 
	{
		[Embed(source = '../../assets/guns.png')] private const ITEM:Class;
		
		public function Guns(n:int) 
		{
			graphic = new Image(ITEM);
			super(n);
		}
		
		override public function item():String {
			return "guns";
		}
		
		override public function description():Array {
			return [ "Medium value.", "Medium visibility." ];
		}
		
		override public function visibility():int {
			return 2 * (1 + movePenalty);
		}
		
		override public function value():int {
			return 2;
		}
		
	}

}