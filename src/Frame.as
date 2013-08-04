package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Frame extends Entity 
	{
		[Embed(source = '../assets/frame.png')] private const FRAME:Class;
		
		public var item:Item = null;
		private var _x:int, _y:int;
		public var bombed:Boolean = false;
		public var nearBombSite:int = 1; // 1 = no, 2 = yes
		public var avoid:Boolean = false;
		public var placeable:Boolean = true;
		
		public function Frame(x:int, y:int) 
		{
			graphic = new Image(FRAME);
			setHitbox(10, 10, -5, -5);
			_x = x; _y = y;
			super(100 + 21*x, 30 + 21*y);
		}
		
		public function empty():Boolean
		{
			return (item == null);
		}
		
		public function distance(x:int, y:int):Number
		{
			return Math.sqrt((Math.pow(x - _x, 2) + Math.pow(y - _y, 2)));
		}
		
		public function distanceFromFrame(f:Frame):Number
		{
			return distance(f._x, f._y);
		}
		
		public function place():String { return ""; }
		public function description():Array { return new Array(); }
		public function visibility():int { return 0;  }
		public function natoDisapproval():int { return 0;  }
		public function rebelAnger():int { return 0;  }
		public function step():void {}
		
		public function destroy():Array
		{
			var results:Array = new Array();
			results[0] = null;
			
			if (!empty())
			{
				results[0] = item;
			}
			
			results[1] = natoDisapproval();
			results[2] = rebelAnger();
			
			bombed = true;
			
			return results;
		}
		
		override public function update():void
		{
			var world:GameWorld = FP.world as GameWorld; 
			
			if (Input.mouseX >= (x - 1) && Input.mouseX <= (x + 21) &&
				Input.mouseY >= (y - 1) && Input.mouseY <= (y + 21) && !world.selectedItem)
			{
				world.selected = true;
				world.currentObject = place();
				world.currentDescription = description();
			}
			
			if (!world.selected)
			{
				world.currentObject = "";
				world.currentDescription = new Array();
			}
			
			super.update();
		}
	}

}