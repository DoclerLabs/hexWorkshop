package exercises.support;

class Jerry 
{

	public function new() 
	{
	}
	
	public static inline function isJerry(type:Class<Dynamic>):Bool
	{
		return type == Jerry || Type.getSuperClass(type) == Jerry;
	}
}