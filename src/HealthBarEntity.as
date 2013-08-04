package  
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Richard Marks
	 */
	public class HealthBarEntity extends Entity
	{
		public var minimum:Number = 0;
		public var maximum:Number = 100;
		public var value:Number = maximum;
		
		private var img:Image;
		private var clippingRectangle:Rectangle = new Rectangle(0, 0, 0, 0);
		private var imgWidth:Number;
		
		[Embed(source = '../assets/health_bar_filler_red.png')] private var BAR_GRAPHIC_RED:Class;
		[Embed(source = '../assets/health_bar_filler_blue.png')] private var BAR_GRAPHIC_BLUE:Class;
		[Embed(source = '../assets/health_bar_filler_green.png')] private var BAR_GRAPHIC_GREEN:Class;
		
		public function HealthBarEntity(minimumValue:Number = 0, maximumValue:Number = 100, initialValue:Number = 100, 
			x:int = 0, y:int = 0, color:String = "red"):void
		{
			minimum = minimumValue;
			maximum = maximumValue;
			value = initialValue;
			
			if (color == "red")
			{
				img = new Image(BAR_GRAPHIC_RED, clippingRectangle);
			}
			else if (color == "blue")
			{
				img = new Image(BAR_GRAPHIC_BLUE, clippingRectangle);
			}
			else if (color == "green")
			{
				img = new Image(BAR_GRAPHIC_GREEN, clippingRectangle);
			}	
			
			clippingRectangle.width = img.width;
			clippingRectangle.height = img.height;
			clippingRectangle.x = 0;
			clippingRectangle.y = 0;
			graphic = img;
			imgWidth = img.width;
			UpdateBarWidth();
			super(x, y);
		}
		
		private function UpdateBarWidth():void
		{
			// make sure the bar is drawn correctly
			var newWidth:Number = (imgWidth * (value / maximum));
			
			// cannot draw 0 pixels
			if (newWidth <= 1)
			{
				newWidth = 1;
			}
			clippingRectangle.width = newWidth;
			// note: requires Patch of flashPunk's Image.as file.
			// PATCH: make createBuffer a public method instead of protected.
			img.createBuffer();
			img.updateBuffer();
			graphic = img;
		}
		
		public function Value(amount:Number):void
		{
			value = amount;
			if (value < minimum)
			{
				value = minimum;
			}
			if (value > maximum)
			{
				value = maximum;
			}
			UpdateBarWidth();
		}
	}
}
