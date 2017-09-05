package exercises.exercise1;
import exercises.exercise1.MappingExercise_1;
import exercises.exercise1.support.Answer;
import exercises.exercise1.support.IAnswer;
import exercises.exercise1.support.Insult;
import exercises.support.IMeeseeks;
import exercises.support.Jerry;
import hex.di.IInjectorContainer;
import hex.di.Injector;
import hex.unittest.assertion.Assert;

class MappingExercise_1_Test 
{

	var injector:Injector;
	var exercise:MappingExercise_1;

	public function new() 
	{
	}
	
	@Before
	public function setup()
	{
		injector = new Injector();
		exercise = new MappingExercise_1(injector);
	}
	
	@After
	public function teardown()
	{
		injector.teardown();
		exercise = null;
	}
	
	@Test("Meeseeks counter")
	public function test_exercise1_6_meeseeksCounter_countsInstances()
	{
		var counter = exercise.mappingExercise6();
		
		Assert.isNotNull(counter, "You must return the coutner");
		
		if(injector.hasMapping(IMeeseeks))
		{
			var m1 = injector.getInstance(IMeeseeks);
			var m2 = injector.getInstance(IMeeseeks);
			var m3 = injector.getInstance(IMeeseeks);
			
			Assert.notEquals(m1, m2, "Meeseeks must be different");
			Assert.notEquals(m1, m3, "Meeseeks must be different");
			
			Assert.equals(3, counter.getCount(), "Counter has to be counting");
		}
		else
		{
			Assert.fail("IMeeseeks isn't properly mapped");
		}
	}
	
	@Test("Rick's answering")
	public function test_rickAnswers_correctAnswer()
	{
		exercise.mappingExercise7();
		
		if (injector.hasMapping(IAnswer))
		{
			var jerry = injector.instantiateUnmapped(QuestionningJerry);
			Assert.isNotNull(jerry.answer, "Rick must provide an answer");
			Assert.isInstanceOf(jerry.answer, Insult, "Rick must answer Jerry with Insult");
			
			var notJerry = injector.instantiateUnmapped(NotJerry);
			Assert.isNotNull(notJerry.answer, "Rick must provide an answer");
			Assert.isInstanceOf(notJerry.answer, Answer, "Rick must answer every intelligent human being with Answer");
		}
		else
		{
			Assert.fail("IAnswer isn't properly mapped");
		}
	}
}


class QuestionningJerry extends Jerry implements IInjectorContainer
{
	@Inject
	public var answer:IAnswer;
}

class NotJerry implements IInjectorContainer
{
	@Inject
	public var answer:IAnswer;
	
	public function new() 
	{
	}
}