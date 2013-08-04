package items 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Ammo extends Item 
	{
		[Embed(source = '../../assets/ammo.png')] private const ITEM:Class;
		
		public function Ammo(n:int) 
		{
			graphic = new Image(ITEM);
			super(n);
		}
		
		override public function item():String {
			return "ammo";
		}
		
		override public function description():Array {
			return [ "Low value.", "Low visibility." ];
		}
		
		override public function visibility():int {
			return 1 * (1 + movePenalty);
		}
		
		override public function value():int {
			return 1;
		}
		
	}

}