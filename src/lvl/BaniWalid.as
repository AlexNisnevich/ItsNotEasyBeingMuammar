package lvl 
{
	import net.flashpunk.graphics.Image;
	import items.*;
	import places.*;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class BaniWalid extends GameWorld
	{
		[Embed(source = '../../assets/lvl1.png')]  private const LVL1:Class;
		
		public function BaniWalid() 
		{
			super();
		}
		
		override public function begin():void
		{
			levelNum = 1;
			levelName = "Bani Walid";
			
			maxStrength = 4;
			maxNatoDisapproval = 20;
			maxRebelAnger = 25;
			
			super.begin();
			
			addGraphic(new Image(LVL1));
			
			frames = [ new AqueductFrame(1, 2),
					   new AqueductFrame(1, 3),
					   new AqueductFrame(1, 4),
					   new HospitalFrame(5, 5),
					   new HospitalFrame(6, 5),
					   new InvisibleHospitalFrame(5, 4),
					   new InvisibleHospitalFrame(6, 4)];
			addList(frames);
			
			itemsList = [ new Ammo(0),
						  new Ammo(1),
						  new Guns(2)];
			addList(itemsList);
		}
		
	}

}