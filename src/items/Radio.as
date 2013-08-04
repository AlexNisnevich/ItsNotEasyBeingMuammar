package items 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import Math;
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Radio extends Item 
	{
		[Embed(source = '../../assets/radio.png')] private const ITEM:Class;
		protected var stillPenalty:int = 0;
		
		public function Radio(n:int) 
		{
			graphic = new Image(ITEM);
			super(n);
		}
		
		override public function item():String {
			return "radio transmitter";
		}
		
		override public function description():Array {
			return [ "No combat value.", "Highest visibility.", "Slowly reduces", "rebel support."];
		}
		
		override public function visibility():int {
			return 15 * (1 + movePenalty);
		}
		
		override public function value():int {
			return 0;
		}
		
		override public function step():void {
			var world:GameWorld = FP.world as GameWorld;
			world.rebelAnger -= 0.3;
		}
	}

}