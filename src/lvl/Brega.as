package lvl 
{
	import net.flashpunk.graphics.Image;
	import items.*;
	import places.*;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Brega extends GameWorld
	{
		[Embed(source = '../../assets/lvl3.png')]  private const LVL3:Class;
		
		public function Brega() 
		{
			super();
		}
		
		override public function begin():void
		{
			levelNum = 3;
			levelName = "Brega";
			
			maxStrength = 16;
			maxNatoDisapproval = 30;
			maxRebelAnger = 20;
			
			super.begin();
			
			addGraphic(new Image(LVL3));
			
			frames = [ new AqueductFrame(0, 2),
					   
					   new HotelFrame(5, 7),
					   new HotelFrame(6, 7),
					   new InvisibleHotelFrame(5, 6),
					   new InvisibleHotelFrame(6, 6),
					   
					   new HotelFrame(1, 7),
					   new HotelFrame(2, 7),
					   new InvisibleHotelFrame(1, 6),
					   new InvisibleHotelFrame(2, 6),
					   
					   new HospitalFrame(7, 3),
					   new HospitalFrame(8, 3),
					   new InvisibleHospitalFrame(7, 2),
					   new InvisibleHospitalFrame(8, 2)];
			addList(frames);
			
			itemsList = [ new Ammo(0),
						  new Guns(1),
						  new Tank(2),
						  new Tank(3),
						  new Troops(4),
						  new Troops(5)];
			addList(itemsList);
		}
		
	}

}