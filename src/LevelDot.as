package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class LevelDot extends Entity 
	{
		[Embed(source = '../assets/leveldot.png')] private static const DOT:Class;
		[Embed(source = '../assets/leveldot_big.png')] private static const DOTBIG:Class;
		[Embed(source = '../assets/leveldot_lock.png')] private static const DOTLOCK:Class;
		private var small:Image = new Image(DOT);
		private var big:Image = new Image(DOTBIG);
		private var lock:Image = new Image(DOTLOCK);
		
		private var textField:Text;
		private var locked:Boolean = false;
		private var hover:Boolean = false;
		private var soundPlayed:Boolean = false;
		private var _x:int, _y:int, num:int;
		
		public function LevelDot(text:String, n:int, x:int, y:int) 
		{
			super(x, y);
			_x = x, _y = y;
			num = n;
			
			setHitbox(60, 10, 0, 0);
			textField = new Text("Lvl " + num + ". " + text);
			textField.size = 8;
			textField.x = x + 10;
			textField.y = y;
			FP.world.addGraphic(textField);
			
			locked = !Main.availableLevels[num];
			
			if (locked)
			{
				graphic = lock;
				textField.color = 0x808080;
			}
			else
			{
				graphic = small;
				textField.color = 0xff0000;
			}
		}
		
		override public function update():void
		{
			if (!locked)
			{
				if (this.collidePoint(x, y, Input.mouseX, Input.mouseY))
				{
					graphic = big;
					x = _x - 3;
					y = _y - 3;
					textField.x = x + 16;
					setHitbox(60, 10, -3, -3);
					
					hover = true;
					FP.world.buttonHover = true;
					if (!soundPlayed)
					{
						Sounds.playSound("select");
						soundPlayed = true;
					}
				}
				else if (hover)
				{
					hover = false;
					resetPos();
				}
			}
			
			if (this.collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				if (Input.mousePressed)
				{
					(FP.world as LevelSelect).selected = num;
				}
				else if (Input.mouseReleased)
				{
					if ((FP.world as LevelSelect).selected == num)
					{
						if (locked)
						{
							Sounds.playSound("wrong");
						}
						else
						{
							FP.world = new Delivery(num);
						}
					}
				}
			}
			
			super.update();
		}
		
		protected function resetPos():void
		{
			graphic = small;
			x = _x;
			y = _y;
			textField.x = _x + 10;
			setHitbox(60, 10, 0, 0);
			
			soundPlayed = false;
			(FP.world as LevelSelect).selected = -1;
		}
	}

}