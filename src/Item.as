package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Item extends Entity 
	{
		private var num:int;
		private var selected:Boolean = false;
		
		protected var movePenalty:Number = 0;
		
		public var frame:Frame = null;
		private var oldFrame:Frame = null;
		
		public function Item(n:int) 
		{
			num = n;
			width = 16;
			height = 16;
			super();
			resetPosition();
		}
		
		override public function update():void 
		{
			var world:GameWorld = FP.world as GameWorld; 
			
			if (Input.mouseX >= x && Input.mouseX <= (x + 16) &&
					Input.mouseY >= y && Input.mouseY <= (y + 16))
			{
				world.selected = true;
				world.selectedItem = true;
				world.currentObject = item();
				world.currentDescription = description();
			}
			
			if (Input.mouseDown && selected)
			{
				x = Input.mouseX - 8;
				y = Input.mouseY - 8;
			}
			
			if (Input.mousePressed && (FP.world as GameWorld).movable)
			{
				if (Input.mouseX >= x && Input.mouseX <= (x + 16) &&
					Input.mouseY >= y && Input.mouseY <= (y + 16))
				{
					if (frame) 
					{
						frame.item = null;
						oldFrame = frame;
					}
					frame = null;
					selected = true;
					layer -= 20;
				}
			}
			
			if (Input.mouseReleased)
			{				
				if (selected)
				{
					var f:Frame = collide("frame", x, y) as Frame;
					
					if (f && f.empty() && !f.bombed && f.placeable)
					{
						if ((FP.world as GameWorld).bombingStarted)
						{
							var dist:Number = oldFrame.distanceFromFrame(f);
							applyMovePenalty(dist);
						}
						
						frame = f;
						f.item = this;
						x = f.x + 2;
						y = f.y + 2;
						
						Sounds.playSound("place");
					}
					else
					{
						resetPosition();
					}
				}
				
				selected = false;
			}
			
			super.update();
		}
		
		public function resetPosition():void
		{
			if (num % 2 == 0)
			{
				x = 20;
				y = 25 + 21 * Math.floor(num/2);
			}
			else
			{
				x = 41;
				y = 25 + 21 * Math.floor(num/2);
			}
			
		}
		
		public function placed():Boolean
		{
			return (frame != null);
		}
		
		public function step():void
		{
			if (movePenalty > 0)
			{
				movePenalty -= 0.3;
			}
			if (movePenalty < 0)
			{
				movePenalty = 0;
			}
		}
		
		public function item():String { return ""; }
		public function description():Array { return new Array(); }
		public function visibility():int { return 0;  }
		public function value():int { return 0;  }
		
		public function applyMovePenalty(dist:Number):void
		{
			movePenalty += 0.5;
			movePenalty += Math.sqrt(dist);
		}
		
	}

}