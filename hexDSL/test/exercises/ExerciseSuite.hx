package exercises;

import exercises.exercise1.SimpleInstantiationTest;
import exercises.exercise2.ArgumentAndPropertyTest;
import exercises.exercise3.ReferenceTest;
import exercises.exercise4.MethodCallTest;
import exercises.exercise5.FlowConversionTest;

class ExerciseSuite 
{
	@Suite( "hexDSL exercises suite" )
    public var list : Array<Class<Dynamic>> = [
		SimpleInstantiationTest, 
		ArgumentAndPropertyTest, 
		ReferenceTest,
		MethodCallTest, 
		FlowConversionTest
	];
}