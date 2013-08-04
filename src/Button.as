package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Button extends Entity 
	{
		[Embed(source = '../assets/button.png')] private const BUTTON:Class;
		
		private var func:Function;
		private var textField:Text;
		private var buttonDrop:int = 1;
		private var pressed:Boolean = false;
		
		public function Button(text:String, f:Function, x:int = 0, y:int = 0, tx:int = 0, ty:int = 0 ) 
		{
			func = f;
			graphic = new Image(BUTTON);			
			this.x = x;
			this.y = y;	
			width = 60;
			height = 12;

			textField = new Text(text);
			textField.size = 8;
			textField.color = 0x000000;
			textField.x = x + tx;
			textField.y = y + ty;
			
			FP.world.add(this);
			FP.world.addGraphic(textField);

		}
		
		override public function update():void
		{
			if (this.collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				FP.world.buttonHover = true;
			}
			
			if (Input.mousePressed && this.collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				if (func != null)
					func();
				this.x += buttonDrop;
				textField.x += buttonDrop;
				this.y += buttonDrop;
				textField.y += buttonDrop;
				pressed = true;
			}
			else if (Input.mouseReleased && pressed)
			{
				pressed = false;
				resetPos();
			}
		}

		protected function resetPos():void
		{
			this.x -= buttonDrop;
			textField.x -= buttonDrop;
			this.y -= buttonDrop;
			textField.y -= buttonDrop;
		}
		
		public function changeText(txt:String):void
		{
			textField.text = txt;
			textField.update();
		}
		
		public function moveText(x:int = 0, y:int = 0):void
		{
			textField.x += x;
			textField.y += y;
		}
		
		public function remove():void
		{
			textField.x = 1000;
			FP.world.remove(this);
		}
	}

}