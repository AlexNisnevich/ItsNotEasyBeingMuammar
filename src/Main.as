package 
{
	import flash.display.InteractiveObject;
	import flash.utils.SetIntervalTimer;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import lvl.*;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Main extends Engine 
	{
		static public var availableLevels:Array = new Array();
		
		public function Main():void
		{
			super(320, 240);
			FP.screen.scale = 2;
			
			//FP.console.enable();
		}
		
		override public function init():void
		{
			trace("FlashPunk has initialized.");
			
			availableLevels[1] = true;
			availableLevels[2] = false;
			availableLevels[3] = false;
			availableLevels[4] = false;
			availableLevels[5] = false;
			
			//Main.loadLevel();
			FP.world = new TitleScreen();
			
			super.init();
		}
		
		static public function loadLevel(num:int = 1):void
		{
			switch (num)
			{
				case 1:
					FP.world = new BaniWalid();
					break;
				
				case 2:
					FP.world = new Sirte();
					break;
				
				case 3:
					FP.world = new Brega();
					break;
		
				case 4:
					FP.world = new Misrata();
					break;
					
				case 5:
					FP.world = new Benghazi();
					break;
					
				case 6:
					FP.world = new LevelSelect();
					break;
				}

		}
		
	}
	
}