package exercises.exercise2;
import exercises.exercise2.support.Plumbus;
import exercises.support.Human.Gender;
import exercises.support.Human.HairColor;
import exercises.support.Jerry;
import exercises.support.PortalGun;
import exercises.support.Rick;
import hex.di.Injector;
import hex.unittest.assertion.Assert;

using hex.di.util.InjectorUtil;

class InjectingExerciseTest 
{

	var injector:Injector;
	var exercise:InjectingExercise;

	public function new() 
	{
	}
	
	@Before
	public function setup()
	{
		injector = new Injector();
		exercise = new InjectingExercise(injector);
	}
	
	@After
	public function teardown()
	{
		injector.teardown();
		exercise = null;
	}
	
	@Test("Rick and his portal gun")
	public function test_exercise1_rickGetsPortalGun()
	{
		var gun = new PortalGun();
		injector.map(PortalGun).toValue(gun);
		var rick = new Rick();
		var returnedPortalGun = exercise.injectingExercise1(rick);
		Assert.isNotNull(returnedPortalGun, "Portal gun can't be null");
		Assert.equals(gun, returnedPortalGun, "You must return correct portal gun - not some piece of crap you crafted right now ;)");
	}
	
	@Test("Unity summons humans")
	public function test_exercise2_differentHumansSummonedByUnity()
	{
		injector.mapDependencyToValue(new Dependency<HairColor>(), HairColor.red);
		injector.mapDependencyToValue(new Dependency<Gender>(), Gender.female);
		
		var human1 = exercise.injectingExercise2();
		var human2 = exercise.injectingExercise2();
		
		Assert.isNotNull(human1, "Human can't be null");
		Assert.isNotNull(human2, "Human can't be null");
		Assert.notEquals(human1, human2, "You have to return new human everytime");
		
		Assert.equals(HairColor.red, human1.hairColor, "Human must have correct hair color");
		Assert.equals(HairColor.red, human2.hairColor, "Human must have correct hair color");
		
		Assert.equals(Gender.female, human1.gender, "Human must have correct gender");
		Assert.equals(Gender.female, human2.gender, "Human must have correct gender");
		
		injector.unmapClassName(Type.getEnumName(HairColor));
		injector.unmapClassName(Type.getEnumName(Gender));
		injector.mapDependencyToValue(new Dependency<HairColor>(), HairColor.dark);
		injector.mapDependencyToValue(new Dependency<Gender>(), Gender.male);
		
		var human3 = exercise.injectingExercise2();
		
		Assert.isNotNull(human3, "Human can't be null");
		Assert.equals(HairColor.dark, human3.hairColor, "Human must have correct hair color");
		Assert.equals(Gender.male, human3.gender, "Human must have correct gender");
	}
	
	@Test("Jerry in daycare")
	public function test_exercise3_jerryInDaycare()
	{
		var earthJerry = new Jerry();
		injector.map(Jerry).toType(Jerry);
		injector.map(Jerry, "C-137").toValue(earthJerry);
		
		var jerry = exercise.injectingExercise3();
		
		Assert.isNotNull(jerry, "Jerry can't be null");
		Assert.equals(earthJerry, jerry, 'You must return "C-137" Jerry');
	}
	
	@Test("Plumbus, everybody has one")
	public function test_exercise4_returnPlumbus()
	{
		var plumbus = new Plumbus();
		injector.map(Plumbus).toValue(plumbus);
		var value = exercise.injectingExercise4();
		
		Assert.isNotNull(value, "Plumbus can't be null");
		Assert.equals(plumbus, value, "You have a Plumbus at home and you're not returning it? You're very greedy.");
		
		injector.unmap(Plumbus);
		
		value = exercise.injectingExercise4();
		
		Assert.isNotNull(value, "Plumbus can't be null");
	}
	
}