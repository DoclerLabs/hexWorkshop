package exercises.support;

import exercises.support.Dimension;

class Character
{
    public var name(default, null):String;

    public function new( ?name : String ) 
    {
        this.name = name;
    }
}