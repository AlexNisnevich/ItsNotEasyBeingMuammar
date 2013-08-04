package places 
{
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class AqueductFrame extends Frame 
	{		
		public function AqueductFrame(x:int, y:int) 
		{
			super(x, y);
			type = "frame";
		}
		
		override public function place():String {
			return "aqueduct";
		}
		
		override public function description():Array {
			return [ "Low visibility.", "Its destruction", "angers no one." ];
		}
		
		override public function visibility():int {
			if (empty())
			{
				return 0;
			}
			else 
			{
				return 1 * item.visibility() * nearBombSite;
			}
		}
		
		override public function natoDisapproval():int {
			return 0;
		}
		
		override public function rebelAnger():int {
			return 0;
		}
		
	}

}