package exercises.support;

import exercises.support.Character;
import exercises.support.Dimension;
import exercises.support.Place;

class Portal
{
	public var dimension(default, null) : Dimension;
	public var place(default, null) : Place;

	public var travelers(default, null) : Array<Character>;

	public function new( ?dimension : Dimension, ?place : Place ) 
	{
		this.dimension = dimension;
		this.place = place;
	}

	public function jump( travelers : Array<Character> )
	{
		if( this.travelers == null )
		{
			this.travelers = travelers;
		} else
		{
			this.travelers = this.travelers.concat(travelers);
		}
	}
}