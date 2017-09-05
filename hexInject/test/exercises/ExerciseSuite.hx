package exercises;
import exercises.exercise1.MappingExerciseTest;
import exercises.exercise1.MappingExercise_1_Test;
import exercises.exercise2.InjectingExerciseTest;
import exercises.exercise3.AnnotationInjectingExerciseTest;
import exercises.exercise4.Exercise4Test;
import exercises.exercise5.MappingDefinitionExerciseTest;

class ExerciseSuite 
{
	@Suite( "hexInject exercises suite" )
    public var list : Array<Class<Dynamic>> = [
		MappingExerciseTest,
		MappingExercise_1_Test,
		InjectingExerciseTest,
		AnnotationInjectingExerciseTest,
		Exercise4Test,
		MappingDefinitionExerciseTest
	];
}