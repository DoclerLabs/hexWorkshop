package exercises.support;

import hex.di.IDependencyInjector;
import hex.di.Injector;
import hex.di.mapping.MappingDefinition;
import hex.di.mapping.IDependencyOwner;

@Dependency( var problem:String )
@Dependency( var _:String->exercises.support.Solution )
class JerryWithProblem implements IDependencyOwner
{
    var _injector : Injector = new Injector();

    public function new( mapping : Array<hex.di.mapping.MappingDefinition> ) 
    {
        // mapping is done by Macro through IDependencyOwner
        // all @Dependency are checked at compilation
    }

    public function getProblem() : String
    {
       return _injector.getInstance(String, "problem");
    }

    public function getSolution() : String
    {
        var f = _injector.getInstanceWithClassName("String->exercises.support.Solution");
       return f( getProblem() );
    }

    public function getInjector() : IDependencyInjector
    {
        return _injector;
    }
}