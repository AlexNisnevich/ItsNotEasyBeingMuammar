package lvl 
{
	import net.flashpunk.graphics.Image;
	import items.*;
	import places.*;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Misrata extends GameWorld
	{
		[Embed(source = '../../assets/lvl4.png')]  private const LVL4:Class;
		
		public function Misrata() 
		{
			super();
		}
		
		override public function begin():void
		{
			levelNum = 4;
			levelName = "Misrata";
			
			maxStrength = 25;
			maxNatoDisapproval = 35;
			maxRebelAnger = 30;
			rebelAnger = 10;
			
			super.begin();
			
			addGraphic(new Image(LVL4));
			
			frames = [ new HotelFrame(7, 2),
					   new HotelFrame(8, 2),
					   new InvisibleHotelFrame(7, 1),
					   new InvisibleHotelFrame(8, 1),
					   
					   new HotelFrame(1, 8),
					   new HotelFrame(2, 8),
					   new InvisibleHotelFrame(1, 7),
					   new InvisibleHotelFrame(2, 7),
					   
					   new HospitalFrame(7, 8),
					   new HospitalFrame(8, 8),
					   new InvisibleHospitalFrame(7, 7),
					   new InvisibleHospitalFrame(8, 7),
					   
					   new HospitalFrame(1, 2),
					   new HospitalFrame(2, 2),
					   new InvisibleHospitalFrame(1, 1),
					   new InvisibleHospitalFrame(2, 1),
					   
					   new SchoolFrame(4, 5),
					   new SchoolFrame(5, 5),
					   new InvisibleSchoolFrame(4, 4),
					   new InvisibleSchoolFrame(5, 4)];
			addList(frames);
			
			itemsList = [ new Tank(0),
						  new Tank(1),
						  new Troops(2),
						  new Troops(3),
						  new Troops(4),
						  new Troops(5),
						  new Mercenaries(6),
						  new Mercenaries(7) ];
			addList(itemsList);
		}
		
	}

}