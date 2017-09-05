package exercises.support;
import hex.di.IInjectorContainer;

class Human implements IInjectorContainer
{
	public var hairColor:HairColor;
	public var gender:Gender;
	
	@Inject
	public function new( gender:Gender, hairColor:HairColor ) 
	{
		this.hairColor = hairColor;
		this.gender = gender;
		
	}
	
}

enum Gender
{
	male;
	female;
}

enum HairColor
{
	blonde;
	dark;
	red;
}