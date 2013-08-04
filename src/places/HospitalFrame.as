package places 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class HospitalFrame extends Frame 
	{		
		public function HospitalFrame(x:int, y:int) 
		{
			super(x, y);
			type = "frame";
			avoid = true;
		}
		
		override public function place():String {
			return "hospital";
		}
		
		override public function description():Array {
			return [ "High visibility.", "Bombing it leads", "to large drop", "in NATO support,", "can anger rebels." ];
		}
		
		override public function visibility():int {
			if (empty())
			{
				return 0;
			}
			else 
			{
				return 7 * item.visibility() * nearBombSite;
			}
		}
		
		override public function natoDisapproval():int {
			return 10;
		}
		
		override public function rebelAnger():int {
			// 0 if there's nothing in the hospital
			
			var world:GameWorld = FP.world as GameWorld;
			var hospitals:Array = world.getAllFramesByType("hospital");
			
			var anythingInHospitals:Boolean = false;
			for (var k:String in hospitals) 
			{
				var frame:Frame = hospitals[k];
				if (!frame.empty())
				{
					anythingInHospitals = true;
				}
			}
			
			if (anythingInHospitals)
			{
				return 5;
			}
			else
			{
				return 0;
			}
		}
		
	}

}