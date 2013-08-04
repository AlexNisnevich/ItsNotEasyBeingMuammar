package items 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.graphics.Image;
	import Math;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Troops extends Item 
	{
		[Embed(source = '../../assets/soldier.png')] private const ITEM:Class;
		protected var stillPenalty:int = 0;
		
		public function Troops(n:int) 
		{
			graphic = new Image(ITEM);
			super(n);
		}
		
		override public function item():String {
			return "troops";
		}
		
		override public function description():Array {
			return [ "Medium value.", "Medium visibility,","and visibility", "increases as", "they stand still."];
		}
		
		override public function visibility():int {
			return 2 * (1 + movePenalty + stillPenalty);
		}
		
		override public function value():int {
			return 2.5;
		}
		
		override public function step():void {
			super.step();
			if (movePenalty == 0)
			{
				stillPenalty += 2;
			}
		}
	}

}