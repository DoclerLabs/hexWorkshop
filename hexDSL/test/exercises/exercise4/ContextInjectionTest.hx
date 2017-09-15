package exercises.exercise4;

import hex.runtime.ApplicationAssembler;
import hex.compiletime.flow.BasicStaticFlowCompiler;
import hex.unittest.assertion.Assert;
import exercises.support.Character;
import exercises.support.RickAndMorty;

class ContextInjectionTest
{
    var _code : Dynamic;

    @Before
	public function setUp() : Void
	{
		_code = BasicStaticFlowCompiler.compile( new ApplicationAssembler(), "exercises/exercise4/injection.flow", "episode4" );
		_code.execute();
	}

	@Test( "check initial values" )
	public function exercise_4_0() : Void
	{
		Assert.isNotNull( _code.locator.rick, "Where is 'rick'" );
		Assert.isNotNull( _code.locator.morty, "Where is 'morty'" );

		Assert.isInstanceOf( _code.locator.rick, Character );
		Assert.isInstanceOf( _code.locator.morty, Character );

		Assert.equals( _code.locator.rick.name, "Rick" );
		Assert.equals( _code.locator.morty.name, "Morty" );
	}

	@Test( "map rick and morty in context injector." )
	public function exercise_4_1() : Void
	{
		var injector = _code.applicationContext.getInjector();

		Assert.equals( _code.locator.rick, injector.getInstanceWithClassName( "exercises.support.Character", "rick",  null), "'rick' should be mapped has a Character" );
		Assert.equals( _code.locator.morty, injector.getInstanceWithClassName( "exercises.support.Character", "morty",  null), "'morty' should be mapped has a Character" );
	}

	@Test( "Let's put Rick and Morty together." )
	public function exercise_4_2() : Void
	{
		Assert.isInstanceOf( _code.locator.rickandmorty, RickAndMorty );

		Assert.equals( _code.locator.rick, _code.locator.rickandmorty.rick, "Where is 'Rick', 'Morty' needs him!" );
		Assert.equals( _code.locator.morty, _code.locator.rickandmorty.morty, "Where is 'Morty', 'Rick' needs him!" );
	}

    public function new() {}
}