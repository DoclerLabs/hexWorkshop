package exercises.support;

import exercises.support.Solution;

class Meeseeks extends Character
{
    public function new() 
    {
        super( "Mr. Meeseeks" );
    }
    
    public function fullfillProphecy( problem : String ) : Solution
    {
        return Solution.FIXED;
    }
}