package  
{
	import flash.display.BitmapData;
	import flash.display.InteractiveObject;
	import flash.utils.Timer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import places.*;
	import items.*;
	import flash.utils.setInterval;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class GameWorld extends World 
	{
		[Embed(source = '../assets/sidebar.png')] private const SIDEBAR:Class;
		
		[Embed(source = '../assets/powerhouse.mp3')] static private const POWERHOUSE:Class;
		static public var powerhouse:Sfx = new Sfx(POWERHOUSE);
		
		protected var levelNum:int;
		protected var levelName:String;
		
		protected var frames:Array;
		protected var itemsList:Array;
		private var bombed:Array = new Array();
		
		public var movable:Boolean = true;
		public var bombingActive:Boolean = false;
		public var bombingStarted:Boolean = false;
		public var levelOver:Boolean = false;
		public var won:Boolean = false;
		public var lastBombTime:Date = new Date();
		
		public var strength:Number;
		public var maxStrength:Number;
		public var natoDisapproval:Number = 0;
		public var maxNatoDisapproval:Number;
		public var rebelAnger:Number = 0;
		public var maxRebelAnger:Number;
		
		protected var strengthBar:HealthBarEntity;
		private var natoBar:HealthBarEntity;
		private var rebelBar:HealthBarEntity;
		
		public var selected:Boolean = false;
		public var selectedItem:Boolean = false;
		public var currentObject:String = "";
		public var currentDescription:Array = new Array();
		public var textBig:Text;
		public var texts:Array = new Array();
		public var timedMessage:int = 0;
		
		private var readyButton:Button;
		private var levelButton:Button;
		
		public function GameWorld() 
		{
		}
		
		override public function begin():void
		{
			Sounds.stopSound("lose"); Sounds.stopSound("win");
			
			addGraphic(new Image(SIDEBAR));
			
			textBig = new Text("", 1, 180, 80, 10);
			textBig.size = 8;
			textBig.color = 0x000000;
			addGraphic(textBig);
			
			strength = maxStrength;
			strengthBar = new HealthBarEntity(0, maxStrength, maxStrength, 105, 5, "green");
			add(strengthBar);
			
			natoBar = new HealthBarEntity(0, maxNatoDisapproval, maxNatoDisapproval, 175, 5, "blue");
			rebelBar = new HealthBarEntity(0, maxRebelAnger, maxRebelAnger, 245, 5, "red");
			add(natoBar);
			add(rebelBar);
			
			var newText:Text;
			for (var i:int = 0; i < 10; i++ )
			{
				newText = new Text("", 1, 190 + 10 * i, 80, 10);
				newText.size = 8;
				newText.color = 0x000000;
				texts[i] = newText;
				addGraphic(texts[i]);
			}
			
			super.begin();
			
			for (i = 0; i < 9; i++)
			{
				bombed[i] = new Array();
				
				for (var j:int = 0; j < 9; j++)
				{
					bombed[i][j] = false;
				}
			}
			
			readyButton = new Button("Ready",  function():void { toggleBombing(); }, 9, 5, 15, 1);
			levelButton = new Button("Level Select",  function():void { powerhouse.stop();  FP.world = new LevelSelect(); }, 9, 152, 2, 1);
			
			var strengthText:Text = new Text("Combat Strength", 100, 10);
			strengthText.size = 8;
			strengthText.color = 0x4C8400;
			addGraphic(strengthText);
			
			var natoText:Text = new Text("NATO Support", 175, 10);
			natoText.size = 8;
			natoText.color = 0x0000ff;
			addGraphic(natoText);
			
			var rebelText:Text = new Text("Rebel Support", 243, 10);
			rebelText.size = 8;
			rebelText.color = 0xff0000;
			addGraphic(rebelText);
			
			var levelText:Text = new Text("Level " + levelNum + ". " + levelName, 205, 20);
			levelText.size = 8;
			levelText.color = 0x000000;
			levelText.x -= levelText.width/2
			addGraphic(levelText);
			
			powerhouse.loop();
		}
		
		override public function update():void
		{	
			if (!levelOver)
			{
			
				if ((strength / maxStrength) <= (rebelAnger / maxRebelAnger))
				{
					lose();
				}
				else if (natoDisapproval > maxNatoDisapproval)
				{
					win();
				}
				
				strengthBar.Value(Math.max(0, strength));
				natoBar.Value(Math.max(0.5, maxNatoDisapproval - natoDisapproval));
				rebelBar.Value(Math.max(0.5, rebelAnger));

				if (bombingActive && (new Date().getTime() - lastBombTime.getTime()) > 1000)
				{
					bombing();
				}
			}
				
			super.update();
			
			if (timedMessage > 0)
			{
				timedMessage--;
			}
			else
			{
				selected = false;
				selectedItem = false;
				
				if (currentObject != "")
				{
					textBig.text = upperCase(currentObject) + ":";
				}
				else
				{
					textBig.text = "";
				}
				textBig.update();
				
				for (var i:int = 0; i < 10; i++ )
				{
					texts[i].text = "";
				}
				for (var k:String in currentDescription)
				{
					texts[k].text = currentDescription[k];
				}
			}
		}
		
		private function calculateBombingSite():Array
		{
			var sum:Number = 0;
			var probabilities:Array = new Array();
			
			for (var i:int = 0; i < 9; i++)
			{
				probabilities[i] = new Array();
				
				for (var j:int = 0; j < 9; j++)
				{
					if (bombed[i][j])
					{
						probabilities[i][j] = 0;
					}
					else
					{
						probabilities[i][j] = 2;
					
						for (var k:String in frames) 
						{
							var f:Frame = frames[k];
							probabilities[i][j] += (f.visibility() / Math.pow(1 + f.distance(i, j), 2));
						}
						
						// is this an avoided site (e.g. hospital)?
						/*for (k in frames) 
						{
							f = frames[k];
							if (f.distance(i, j) == 0 && f.avoid) 
							{
								probabilities[i][j] *= 0.5;
							}
						}*/
					}
					
					sum += probabilities[i][j];
				}
			}
			
			trace(probabilities);
			
			var rand:Number = Math.random() * sum; 
			trace (sum);
			
			sum = 0;
			
			for (i = 0; i < 9; i++)
			{
				for (j = 0; j < 9; j++)
				{
					if (probabilities[i][j] == 0) {
						continue;
					}
					sum += probabilities[i][j];
					if (sum > rand) {
						return [i, j];
					}
				}
			}
			return [-1, -1];
		}
		
		private function bombSite(site:Array):void
		{
			var important:Boolean = false; // important enough for bigger sound effect?
			
			add(new Bomb(site));
			
			for (var k:String in frames) 
			{
				var f:Frame = frames[k];
				if (f.distance(site[0], site[1]) == 0) 
				{
					var results:Array = f.destroy();
					
					if (results[0]) 
					{
						var item:Item = results[0] as Item;
						remove(item);
						strength -= item.value();
						important = true;
					}
					
					natoDisapproval += results[1];
					if (results[1] > 1) {important = true;}
					
					rebelAnger += results[2];
					
				}
				
				// any adjacent areas get visibility boost
				if (f.distance(site[0], site[1]) < 2) 
				{
					f.nearBombSite = 2;
				}
			}
			
			bombed[site[0]][site[1]] = true;
			
			if (important)
			{
				Sounds.playSound("explode2");
			}
			else
			{
				Sounds.playSound("explode");
			}
			
			natoDisapproval += 0.4;
			rebelAnger += 0.2;
			if (rebelAnger < 0) rebelAnger = 0;
			
			trace(strength + " " + natoDisapproval + " " + rebelAnger);
			
			// Also, all items and frames "step"
			for (k in itemsList) 
			{
				itemsList[k].step();
			}
			for (k in frames) 
			{
				frames[k].step();
			}
		}
		
		public function getAllFramesByType (type:String):Array
		{
			var results:Array = new Array();
			for (var k:String in frames) 
			{
				var frame:Frame = frames[k];
				if (frame.place() == type)
				{
					results.push(frame);
				}
			}
			return results;
		}
		
		private function bombing():void
		{
			// check if all things placed
			
			movable = false;
			bombingActive = true;
			bombingStarted = true;
			
			var site:Array = calculateBombingSite();
			if (site[0] != -1)
			{
				bombSite(site);
			}
			
			lastBombTime = new Date();
		}
		
		private function toggleBombing():void
		{
			if (levelOver)
			{
				if (won) 
				{
					// Continue
					if (levelNum == 5)
					{
						FP.world = new Delivery(6);
					}
					else
					{
						FP.world = new LevelSelect();
					}
					Sounds.playSound("select");
				}
				else
				{
					// Reset
					Main.loadLevel(levelNum);
					Sounds.playSound("select");
				}
			}
			else if (bombingActive)
			{
				movable = true;
				bombingActive = false;
				readyButton.changeText("Ready");
				readyButton.moveText(4, 0);
				Sounds.playSound("select");
			}
			else
			{
				if (allItemsPlaced())
				{
					bombing();
					readyButton.changeText("Unready");
					readyButton.moveText(-4, 0);
				}
				else
				{
					textBig.text = "Not all items";
					texts[0].text = "placed!";
					timedMessage = FP.frameRate * 5;
					Sounds.playSound("wrong");
				}
			}
		}
		
		private function allItemsPlaced():Boolean
		{
			for (var k:String in itemsList) 
			{
				var item:Item = itemsList[k];
				if (!item.placed())
				{
					return false;
				}
			}
			return true;
		}
		
		private function lose():void
		{
			movable = false;
			levelOver = true;
			bombingActive = false;
			
			readyButton.changeText("Retry?");
			readyButton.moveText(3, 0);
			
			textBig.text = "You lose.";
			for (var i:int = 0; i < 10; i++ )
			{
				texts[i].text = "";
			}
			texts[0].text = "Rebels occupy";
			texts[1].text = levelName + ".";
			timedMessage = FP.frameRate * 999999;
			
			powerhouse.stop();
			Sounds.playSound("lose");
		}
		
		private function win():void
		{
			movable = false;
			levelOver = true;
			bombingActive = false;
			won = true;
			
			Main.availableLevels[levelNum + 1] = true;
			
			readyButton.changeText("Onward!");
			readyButton.moveText(1, 0);
			levelButton.remove();
			
			textBig.text = "You win!";
			for (var i:int = 0; i < 10; i++ )
			{
				texts[i].text = "";
			}
			texts[0].text = "NATO withdraws";
			texts[1].text = "from " + levelName + ".";
			timedMessage = FP.frameRate * 999999;
			
			powerhouse.stop();
			Sounds.playSound("win");
		}
		
		public function upperCase(str:String) : String {
			var firstChar:String = str.substr(0, 1);
			var restOfString:String = str.substr(1, str.length);
			return firstChar.toUpperCase()+restOfString.toLowerCase();
		}
	}

}