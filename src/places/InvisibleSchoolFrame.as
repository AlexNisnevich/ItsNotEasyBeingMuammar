package places 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class InvisibleSchoolFrame extends SchoolFrame 
	{		
		public function InvisibleSchoolFrame(x:int, y:int) 
		{
			super(x, y);
			graphic = null;
			placeable = false;
		}
		
	}

}