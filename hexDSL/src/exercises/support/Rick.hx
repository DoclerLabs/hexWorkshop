package exercises.support;

import exercises.support.Solution;

class Rick extends Character 
{
    public function new()
    {
        super("Rick C-137");
    }
    
    public function getDefaultSolution( problem : String ) : Solution
    {
        return Solution.DO_BY_YOURSELF;
    }
}