package exercises.exercise5;

import hex.runtime.ApplicationAssembler;
import hex.compiletime.flow.BasicStaticFlowCompiler;
import hex.unittest.assertion.Assert;
import exercises.support.Meeseeks;
import exercises.support.Rick;
import exercises.support.Solution;
import exercises.support.JerryWithProblem;

class MappingDefinitionTest
{
    var _code : Dynamic;

    @Before
	public function setUp() : Void
	{
		_code = BasicStaticFlowCompiler.compile( new ApplicationAssembler(), "exercises/exercise5/mappingDefinition.flow", "exercise5" );
		_code.execute();
	}

	@Test( "check initial values" )
	public function exercise_5_0() : Void
	{
		Assert.isNotNull( _code.locator.rick, "Where is 'rick'?" );
		Assert.isNotNull( _code.locator.mayoProblem, "Where is 'mayoProblem'?" );
		Assert.isNotNull( _code.locator.meeseek, "Where is 'meeseek'?" );
		Assert.isNotNull( _code.locator.golfProblem, "Where is 'golfProblem'?" );

		Assert.isInstanceOf( _code.locator.rick, Rick );
		Assert.isInstanceOf( _code.locator.mayoProblem, String );
		Assert.isInstanceOf( _code.locator.meeseek, Meeseeks );
		Assert.isInstanceOf( _code.locator.golfProblem, String );
	}

	@Test( "Provide to 'jerryC137' a solution" )
	public function exercise_5_1() : Void
	{
		Assert.isNotNull( _code.locator.mappings1, "Where is 'mappings1'?" );
		Assert.isNotNull( _code.locator.jerryC137, "Where is 'jerryC137'?" );

		Assert.isInstanceOf( _code.locator.mappings1, Array );
		Assert.isInstanceOf( _code.locator.jerryC137, JerryWithProblem );

		Assert.equals( 2, _code.locator.mappings1.length );
		Assert.equals( _code.locator.mayoProblem, _code.locator.jerryC137.getProblem(), "Is not the good problem!" );
		Assert.equals( Solution.DO_BY_YOURSELF, _code.locator.jerryC137.getSolution(), "Is not the good solution!" );
	}

	@Test( "Provide to 'jerryC132' a solution" )
	public function exercise_5_2() : Void
	{
		Assert.isNotNull( _code.locator.mappings2, "Where is 'mappings2'?" );
		Assert.isNotNull( _code.locator.jerryC132, "Where is 'jerryC132'?" );

		Assert.isInstanceOf( _code.locator.mappings2, Array );
		Assert.isInstanceOf( _code.locator.jerryC132, JerryWithProblem );

		Assert.equals( 2, _code.locator.mappings2.length );
		Assert.equals( _code.locator.golfProblem, _code.locator.jerryC132.getProblem(), "Is not the good problem!" );
		Assert.equals( Solution.FIXED, _code.locator.jerryC132.getSolution(), "Is not the good solution!" );
	}

    public function new() {}
}