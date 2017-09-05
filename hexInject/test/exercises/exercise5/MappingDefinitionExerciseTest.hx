package exercises.exercise5;
import exercises.support.Meeseeks;
import exercises.support.Morty;
import exercises.support.PortalGun;
import exercises.support.Rick;
import hex.di.IDependencyInjector;
import hex.di.Injector;
import hex.unittest.assertion.Assert;

using hex.di.util.MappingDefinitionUtil;

/**
 * ...
 * @author 
 */
class MappingDefinitionExerciseTest 
{

	var injector:Injector;

	public function new() 
	{
	}
	

	@Before
	public function setup()
	{
		injector = new Injector();
	}
	
	@After
	public function teardown()
	{
		injector.teardown();
		injector = null;
	}
	
	@Test("Ricks list of items")
	public function test_mappingDefinitionExercise1()
	{
		var rick = new Rick();
		var definitions = new MappingDefinitionExercise().exercise1(rick);
		Assert.isNotNull(definitions, "Array of mapping definitions cannot be null");
		Assert.notEquals(0, definitions.length, "Array of mapping definitions cannot be empty");
		definitions.addToInjector(injector);
		
		Assert.isTrue(injector.satisfies(Rick), "Rick must be mapped");
		Assert.equals(injector.getInstance(Rick), injector.getInstance(Rick), "Rick must be always the same");
		Assert.equals(rick, injector.getInstance(Rick), "Rick must be always the same");
		Assert.isNotNull(rick.portalGun, "Rick must have a portal gun");
		Assert.isNotNull(injector.getInstance(Rick).portalGun, "Rick must have a portal gun");
		
		Assert.isTrue(injector.satisfies(PortalGun), "PortalGun must be mapped");
		Assert.equals(injector.getInstance(PortalGun), injector.getInstance(PortalGun), "PortalGun must always be the same one");
		
		Assert.isTrue(injector.satisfies(Meeseeks), "Meeseeks must be mapped");
		Assert.notEquals(injector.getInstance(Meeseeks), injector.getInstance(Meeseeks), "Injector must always produce new Mr. Meeseeks");
		
		Assert.isTrue(injector.satisfies(Morty), "Morty must be mapped");
	}
	
	public function getInjector():IDependencyInjector
	{
		return injector;
	}
}