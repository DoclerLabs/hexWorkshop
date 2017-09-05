package exercises.support;

class Character
{
    public var name(default, null):String;

    public function new( ?name : String ) 
    {
        this.name = name;
    }
}