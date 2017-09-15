package exercises.exercise1;

import hex.runtime.ApplicationAssembler;
import hex.compiletime.flow.BasicStaticFlowCompiler;
import hex.unittest.assertion.Assert;
import exercises.support.Character;

class InstantiationTest
{
    var _code : Dynamic;

    @Before
	public function setUp() : Void
	{
		_code = BasicStaticFlowCompiler.compile( new ApplicationAssembler(), "exercises/exercise1/instantiation.flow", "episode1" );
		_code.execute();
	}

    @Test( "instantied 3 characters" )
	public function exercise_1() : Void
	{
		Assert.isNotNull( _code.locator.rick, "Where is 'rick' ?" );
		Assert.isNotNull( _code.locator.morty, "Where is 'morty' ?" );
		Assert.isNotNull( _code.locator.summer, "Where is 'summer' ?" );

		Assert.isInstanceOf( _code.locator.rick, Character, "'rick' should be a Character!" );
		Assert.isInstanceOf( _code.locator.morty, Character, "'morty' should be a Character!" );
		Assert.isInstanceOf( _code.locator.summer, Character, "'summer' should be a Character!" );

		Assert.equals( "Rick", _code.locator.rick.name, "the name of 'rick' is wrong!" );
		Assert.equals( "Morty", _code.locator.morty.name, "the name of 'morty' is wrong!" );
		Assert.equals( "Summer", _code.locator.summer.name, "the name of 'summer' is wrong!" );
	}

    public function new() {}
}