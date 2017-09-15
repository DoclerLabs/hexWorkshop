package exercises.exercise3;

import hex.runtime.ApplicationAssembler;
import hex.compiletime.flow.BasicStaticFlowCompiler;
import hex.unittest.assertion.Assert;
import exercises.support.Character;
import exercises.support.Portal;

class MethodCallTest
{
    var _code : Dynamic;

    @Before
	public function setUp() : Void
	{
		_code = BasicStaticFlowCompiler.compile( new ApplicationAssembler(), "exercises/exercise3/methodCall.flow", "episode3" );
		_code.execute();
	}

	@Test( "check initial values" )
	public function exercise_3_0() : Void
	{
		Assert.isNotNull( _code.locator.rick, "Where is 'rick'?" );
		Assert.isNotNull( _code.locator.morty, "Where is 'morty'?" );

		Assert.isInstanceOf( _code.locator.rick, Character );
		Assert.isInstanceOf( _code.locator.morty, Character );

		Assert.equals( _code.locator.rick.name, "Rick" );
		Assert.equals( _code.locator.morty.name, "Morty" );
	
		Assert.isNotNull( _code.locator.travelers,  "Where is 'travelers'?" );
		Assert.isInstanceOf( _code.locator.travelers, Array );
		Assert.arrayContainsElement( _code.locator.travelers, _code.locator.rick, "'rick' should be a travelers" );
		Assert.arrayContainsElement( _code.locator.travelers, _code.locator.morty, "'morty' should be a travelers" );

		Assert.isNotNull( _code.locator.portal );
		Assert.isInstanceOf( _code.locator.portal, Portal );
		Assert.isNotNull( _code.locator.portal.dimension );
		Assert.equals( _code.locator.portal.dimension, exercises.support.Dimension.C137 );
		Assert.isNotNull( _code.locator.portal.place );
		Assert.equals( _code.locator.portal.place, exercises.support.Place.THE_GARAGE );
	}

	@Test( "time to jump()" )
	public function exercise_3_1() : Void
	{
		Assert.equals( _code.locator.portal.travelers, _code.locator.travelers );
	}

    public function new() {}
}