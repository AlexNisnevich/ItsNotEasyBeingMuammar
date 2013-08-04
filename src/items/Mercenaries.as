package items 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Mercenaries extends Troops 
	{
		[Embed(source = '../../assets/merc.png')] private const ITEM:Class;
		
		public function Mercenaries(n:int) 
		{
			super(n);
			graphic = new Image(ITEM);
		}
		
		override public function item():String {
			return "mercenaries";
		}
		
		override public function description():Array {
			return [ "High value.", "High visibility,", "and visibility", "increases as", "they stand still."];
		}
		
		override public function visibility():int {
			return 3 * (1 + movePenalty + stillPenalty);
		}
		
		override public function value():int {
			return 3.5;
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