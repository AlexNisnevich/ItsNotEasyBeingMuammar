package places 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class HotelFrame extends Frame 
	{		
		public function HotelFrame(x:int, y:int) 
		{
			super(x, y);
			type = "frame";
			avoid = true;
		}
		
		override public function place():String {
			return "hotel";
		}
		
		override public function description():Array {
			return [ "Medium visibility.", "Bombing it has", "unpredictable", "results." ];
		}
		
		override public function visibility():int {
			if (empty())
			{
				return 0;
			}
			else 
			{
				return 4 * item.visibility() * nearBombSite;
			}
		}
		
		override public function natoDisapproval():int {
			return FP.rand(10);
		}
		
		override public function rebelAnger():int {
			return FP.rand(3);
		}
		
	}

}