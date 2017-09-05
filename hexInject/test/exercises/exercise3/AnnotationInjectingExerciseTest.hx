package exercises.exercise3;
import exercises.support.PortalGun;
import hex.di.Injector;
import hex.di.reflect.FastClassDescriptionProvider;
import hex.di.reflect.IClassDescriptionProvider;
import hex.unittest.assertion.Assert;

class AnnotationInjectingExerciseTest 
{

	var injector:Injector;
	var descriptionProvider:IClassDescriptionProvider;
	var portalGun:PortalGun;

	public function new() 
	{
	}
	
	@Before
	public function setup()
	{
		injector = new Injector();
		descriptionProvider = new FastClassDescriptionProvider();
		
		portalGun = new PortalGun();
		injector.map(PortalGun).toValue(portalGun);
	}
	
	@After
	public function teardown()
	{
		injector.teardown();
		injector = null;
	}
	
	@Test("Portal gun injection - Constructor")
	public function test_constructorInjection_injected()
	{
		var description = descriptionProvider.getClassDescription(InjectConstructorExercise);
		Assert.isNotNull(description, "Looks like the class is not reflected, make sure you implement correct interface");
		
		var exercise = injector.instantiateUnmapped(InjectConstructorExercise);
		
		Assert.isNotNull(exercise.getPortalGun(), "Portal gun can't be null");
		Assert.equals(portalGun, exercise.getPortalGun(), "You must return a propr portal gun and not some crap you");
		
		Assert.isNotNull(description.c, "Constructor injection must be used");
		Assert.equals(1, description.c.a.length, "There has to be at least one argument to successfully inject variable");
	}
	
	@Test("Portal gun injection - Function")
	public function test_functionInjection_injected()
	{
		var description = descriptionProvider.getClassDescription(InjectFunctionExercise);
		Assert.isNotNull(description, "Looks like the class is not reflected, make sure you implement correct interface");
		
		var exercise = injector.instantiateUnmapped(InjectFunctionExercise);
		
		Assert.isNotNull(exercise.getPortalGun(), "Portal gun can't be null");
		Assert.equals(portalGun, exercise.getPortalGun(), "You must return a propr portal gun and not some crap you");
		
		Assert.isNotNull(description.m, "Function injection must be used");
		Assert.equals(1, description.m.length, "At least one function must be annotated");
		Assert.equals(1, description.m[0].a.length, "Function has to have at least one argument");
	}
	
	@Test("Portal gun injection - Public var")
	public function test_publicVarInjection_injected()
	{
		var description = descriptionProvider.getClassDescription(InjectPublicVariableExercise);
		Assert.isNotNull(description, "Looks like the class is not reflected, make sure you implement correct interface");
		
		var exercise = injector.instantiateUnmapped(InjectPublicVariableExercise);
		
		Assert.isNotNull(exercise.getPortalGun(), "Portal gun can't be null");
		Assert.equals(portalGun, exercise.getPortalGun(), "You must return a propr portal gun and not some crap you");
		
		Assert.isNotNull(description.p, "Property injection must be used");
		Assert.equals(1, description.p.length, "At least one property must be injected");
	}
	
}