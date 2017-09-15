package exercises;

import exercises.exercise1.InstantiationTest;
import exercises.exercise2.ReferenceTest;
import exercises.exercise3.MethodCallTest;
import exercises.exercise4.ContextInjectionTest;
import exercises.exercise5.MappingDefinitionTest;

class ExerciseSuite 
{
	@Suite( "hexDSL exercises suite" )
    public var list : Array<Class<Dynamic>> = [
		InstantiationTest, 
		ReferenceTest,
		MethodCallTest, 
		ContextInjectionTest, 
		MappingDefinitionTest
	];
}