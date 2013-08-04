package places 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class InvisibleHotelFrame extends HotelFrame 
	{		
		public function InvisibleHotelFrame(x:int, y:int) 
		{
			super(x, y);
			graphic = null;
			placeable = false;
		}
		
	}

}