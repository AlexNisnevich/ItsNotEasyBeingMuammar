package places 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class SchoolFrame extends Frame 
	{		
		private var hour:int = 0;
		
		public function SchoolFrame(x:int, y:int) 
		{
			super(x, y);
			type = "frame";
			avoid = true;
		}
		
		override public function place():String {
			return "school";
		}
		
		override public function description():Array {
			return [ "High visibility.", "Bombing it drops", "NATO support, will", "anger rebels if", "it's in session." ];
		}
		
		override public function visibility():int {
			if (empty())
			{
				return 0;
			}
			else 
			{
				return 12 * item.visibility() * nearBombSite;
			}
		}
		
		override public function natoDisapproval():int {
			return 15;
		}
		
		override public function rebelAnger():int {
			if (isInSession())
			{
				return 10;
			}
			else
			{
				return 3;
			}
		}
		
		private function isInSession():Boolean {
			return (hour >= 8 && hour < 15);
		}
		
		override public function step():void {
			var world:GameWorld = FP.world as GameWorld;

			hour = (hour + 1) % 24;
			
			if (hour == 8)
			{
				for (var i:int = 0; i < 10; i++ )
				{
					world.texts[i].text = "";
				}
				world.texts[0].text = "School is now";
				world.texts[1].text = "in session.";
				world.currentObject = "";
				world.timedMessage = FP.frameRate * 4;
			}
			else if (hour == 15)
			{
				for (i = 0; i < 10; i++ )
				{
					world.texts[i].text = "";
				}
				world.texts[0].text = "School is now";
				world.texts[1].text = "out of session.";
				world.currentObject = "";
				world.timedMessage = FP.frameRate * 4;
			}
		}
		
	}

}