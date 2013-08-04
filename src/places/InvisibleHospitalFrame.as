package places 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class InvisibleHospitalFrame extends HospitalFrame 
	{		
		public function InvisibleHospitalFrame(x:int, y:int) 
		{
			super(x, y);
			graphic = null;
			placeable = false;
		}
		
	}

}