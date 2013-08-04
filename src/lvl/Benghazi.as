package lvl 
{
	import net.flashpunk.graphics.Image;
	import items.*;
	import places.*;
	
	/**
	 * ...
	 * @author Alex Nisnevich
	 */
	public class Benghazi extends GameWorld
	{
		[Embed(source = '../../assets/lvl5.png')]  private const LVL5:Class;
		
		public function Benghazi() 
		{
			super();
		}
		
		override public function begin():void
		{
			levelNum = 5;
			levelName = "Benghazi";
			
			maxStrength = 34;
			maxNatoDisapproval = 50;
			maxRebelAnger = 50;
			rebelAnger = 20;
			
			super.begin();
			
			addGraphic(new Image(LVL5));
			
			frames = [ new HospitalFrame(7, 2),
					   new HospitalFrame(8, 2),
					   new InvisibleHospitalFrame(7, 1),
					   new InvisibleHospitalFrame(8, 1),
					   
					   new HospitalFrame(1, 8),
					   new HospitalFrame(2, 8),
					   new InvisibleHospitalFrame(1, 7),
					   new InvisibleHospitalFrame(2, 7),
					   
					   new HotelFrame(7, 8),
					   new HotelFrame(8, 8),
					   new InvisibleHotelFrame(7, 7),
					   new InvisibleHotelFrame(8, 7),
					   
					   new HotelFrame(1, 2),
					   new HotelFrame(2, 2),
					   new InvisibleHotelFrame(1, 1),
					   new InvisibleHotelFrame(2, 1),
					   
					   new SchoolFrame(1, 5),
					   new SchoolFrame(2, 5),
					   new InvisibleSchoolFrame(1, 4),
					   new InvisibleSchoolFrame(2, 4),
					   
					   new SchoolFrame(7, 5),
					   new SchoolFrame(8, 5),
					   new InvisibleSchoolFrame(7, 4),
					   new InvisibleSchoolFrame(8, 4)];
			addList(frames);
			
			itemsList = [ new Tank(0),
						  new Tank(1),
						  new Troops(2),
						  new Troops(3),
						  new Troops(4),
						  new Troops(5),
						  new Mercenaries(6),
						  new Mercenaries(7),
						  new SpecOps(8),
						  new SpecOps(9),
						  new Radio(10),
						  new Radio(11) ];
			addList(itemsList);
		}
		
	}

}