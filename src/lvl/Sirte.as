package lvl 
{
	import net.flashpunk.graphics.Image;
	import items.*;
	import places.*;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Sirte extends GameWorld
	{
		[Embed(source = '../../assets/lvl2.png')]  private const LVL2:Class;
		
		public function Sirte() 
		{
			super();
		}
		
		override public function begin():void
		{
			levelNum = 2;
			levelName = "Sirte";
			
			maxStrength = 12;
			maxNatoDisapproval = 25;
			maxRebelAnger = 20;
			
			super.begin();
			
			addGraphic(new Image(LVL2));
			
			frames = [ new AqueductFrame(7, 1),
					   new AqueductFrame(7, 2),
					   new AqueductFrame(7, 3),
					   
					   new HotelFrame(2, 3),
					   new HotelFrame(3, 3),
					   new InvisibleHotelFrame(2, 2),
					   new InvisibleHotelFrame(3, 2),
					   
					   new HospitalFrame(3, 7),
					   new HospitalFrame(4, 7),
					   new InvisibleHospitalFrame(3, 6),
					   new InvisibleHospitalFrame(4, 6)];
			addList(frames);
			
			itemsList = [ new Ammo(0),
						  new Ammo(1),
						  new Guns(2),
						  new Tank(3),
						  new Tank(4)];
			addList(itemsList);
		}
		
	}

}