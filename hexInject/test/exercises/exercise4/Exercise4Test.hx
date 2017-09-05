package exercises.exercise4;
import exercises.support.Morty;
import exercises.support.PortalGun;
import exercises.support.Rick;
import hex.di.Injector;
import hex.di.reflect.FastClassDescriptionProvider;
import hex.di.reflect.IClassDescriptionProvider;
import hex.unittest.assertion.Assert;

class Exercise4Test 
{

	var injector:Injector;
	var descriptionProvider:IClassDescriptionProvider;

	public function new() 
	{
	}
	
	@Before
	public function setup()
	{
		injector = new Injector();
		descriptionProvider = new FastClassDescriptionProvider();
	}
	
	@After
	public function teardown()
	{
		injector.teardown();
		injector = null;
	}
	
	@Test("Rick is teleporting with Morty")
	public function test_exercise4_1_rickIsTeleportingWithMorty()
	{
		var portalGun = new ReportingPortalGun();
		injector.map(PortalGun).toValue(portalGun);
		injector.map(Rick).toSingleton(Rick);
		
		var morty = new Morty();
		injector.map(Morty).toValue(morty);
		
		var e = injector.instantiateUnmapped(Exercise4_1);
		
		var description = descriptionProvider.getClassDescription(Exercise4_1);
		Assert.isNotNull(description, "Looks like the class is not reflected, make sure you implement correct interface");
		
		Assert.isNotNull(portalGun.teleportedWith, "Looks like you teleported too early and forgot Morty, again!");
		Assert.equals(morty, portalGun.teleportedWith, "You teleported with wrong Morty");
		
		Assert.isNotNull(description.pc, "Proper injection point isn't used");
		Assert.equals(1, description.pc.length, "Proper injection point isn't used");
	}
	
	@Test("Rick and morty are escaping from a planet")
	public function test_exercise4_2()
	{
		var portalGun = new ReportingPortalGun();
		injector.map(PortalGun).toValue(portalGun);
		injector.map(Rick).toSingleton(Rick);
		
		var morty = new Morty();
		injector.map(Morty).toValue(morty);
		
		var e = injector.instantiateUnmapped(Exercise4_2);
		
		Assert.isNull(portalGun.teleportedWith, "You teleported too early and both Rick and Morty were captured.");
		
		injector.destroyInstance(e);
		
		var description = descriptionProvider.getClassDescription(Exercise4_2);
		Assert.isNotNull(description, "Looks like the class is not reflected, make sure you implement correct interface");
		Assert.isNotNull(description.pd, "Proper injection point isn't used");
		Assert.equals(1, description.pd.length, "Proper injection point isn't used");
		
		Assert.isNotNull(portalGun.teleportedWith, "Looks like you teleported too early and forgot Morty, again!");
		Assert.equals(morty, portalGun.teleportedWith, "You teleported with wrong Morty");
		
	}
}

class ReportingPortalGun extends PortalGun
{
	public var teleportedWith:Dynamic;

	override public function teleportWith(someone:Dynamic):Void 
	{
		teleportedWith = someone;
	}
}