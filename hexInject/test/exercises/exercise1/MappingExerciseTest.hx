package exercises.exercise1;
import exercises.exercise1.MappingExercise;
import exercises.support.IGrandpa;
import exercises.support.IMeeseeks;
import exercises.support.IScientist;
import exercises.support.Rick;
import hex.di.Injector;
import hex.unittest.assertion.Assert;

class MappingExerciseTest 
{

	var injector:Injector;
	var exercise:MappingExercise;

	public function new() 
	{
	}
	
	@Before
	public function setup()
	{
		injector = new Injector();
		exercise = new MappingExercise(injector);
	}
	
	@After
	public function teardown()
	{
		injector.teardown();
		exercise = null;
	}
	
	@Test("Ask for Rick, get the same")
	public function test_exercise1_1_getRick_alwaysSameRick()
	{
		exercise.mappingExercise1();
		if(injector.hasMapping(Rick))
		{
			var rick1 = injector.getInstance(Rick);
			var rick2 = injector.getInstance(Rick);
			var rick3 = injector.getInstance(Rick);
			
			Assert.equals(rick1, rick2, "Ricks must be the same");
			Assert.equals(rick1, rick3, "Ricks must be the same");
		}
		else
		{
			Assert.fail("There has to be mapping for Rick");
		}
	}
	
	@Test("Remove Rick")
	public function test_exercise1_1_1_destroyRick_RickIsRemoved()
	{
		injector.map(Rick).toValue(new Rick());
		exercise.mappingExercise1_1();
		if(injector.hasMapping(Rick))
		{
			Assert.fail("Rick must be removed from the injector");
		}
	}
	
	@Test("Ricks from different realities")
	public function test_exercise1_2_multipleRicks_twoDifferentInstances()
	{
		exercise.mappingExercise2();
		if(injector.hasMapping(Rick))
		{
			Assert.fail("Can't determine which Rick is this as he doesn't have name");
		}
		if (injector.hasMapping(Rick, "C-137") && injector.hasMapping(Rick, "C-35"))
		{
			Assert.notEquals(injector.getInstance(Rick, "C-137"), injector.getInstance(Rick, "C-35"), "Ricks are from different universes so the have to be different");
		}
		else
		{
			Assert.fail("Ricks aren't properly mapped");
		}
	}
	
	@Test("One Rick, different role")
	public function test_exercise1_3_oneRick_differentRole()
	{
		exercise.mappingExercise3();
		if(injector.hasMapping(IScientist))
		{
			var r1 = injector.getInstance(IScientist);
			var r2 = injector.getInstance(IScientist);
			Assert.equals(r1, r2, "There has to be only one Rick");
		}
		else
		{
			Assert.fail("Rick isn't properly mapped");
		}
	}
	
	@Test("Meeseeks box")
	public function test_exercise1_4_meeseeks_multipleDifferentInstances()
	{
		exercise.mappingExercise4();
		if(injector.hasMapping(IMeeseeks))
		{
			var m1 = injector.getInstance(IMeeseeks);
			var m2 = injector.getInstance(IMeeseeks);
			Assert.notEquals(m1, m2, "All Meeseeks are must be different");
		}
		else
		{
			Assert.fail("Meeseeks box isn't properly working");
		}
	}
	
	@Test("One Rick, multiple roles")
	public function test_exercise1_5_oneRick_multipleRoles()
	{
		exercise.mappingExercise5();
		if(injector.hasMapping(IScientist) && injector.hasMapping(IGrandpa))
		{
			var r1 = injector.getInstance(IScientist);
			var r2 = injector.getInstance(IScientist);
			Assert.equals(r1, r2, "There has to be only one Rick");
			
			var r3 = injector.getInstance(IGrandpa);
			var r4 = injector.getInstance(IGrandpa);
			Assert.equals(r3, r4, "There has to be only one Rick");
			
			Assert.equals(r1, r3, "There has to be only one Rick");
		}
		else
		{
			Assert.fail("Rick isn't properly mapped");
		}
	}
	
	
}