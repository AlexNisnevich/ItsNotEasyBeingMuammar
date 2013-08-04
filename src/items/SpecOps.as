package items 
{
	import net.flashpunk.graphics.Image;
	import Math;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class SpecOps extends Item 
	{
		[Embed(source = '../../assets/specops.png')] private const ITEM:Class;
		
		public function SpecOps(n:int) 
		{
			graphic = new Image(ITEM);
			super(n);
		}
		
		override public function item():String {
			return "spec ops";
		}
		
		override public function description():Array {
			return [ "High value.", "Low visibility.", "No movement", "penalty." ];
		}
		
		override public function visibility():int {
			return 1;
		}
		
		override public function value():int {
			return 4.5;
		}
		
	}

}