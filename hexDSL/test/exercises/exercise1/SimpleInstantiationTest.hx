package exercises.exercise1;

import hex.core.IApplicationAssembler;
import hex.runtime.ApplicationAssembler;
import hex.compiletime.xml.BasicStaticXmlCompiler;
import hex.unittest.assertion.Assert;
import exercises.support.Character;

class SimpleInstantiationTest
{
    var _applicationAssembler : IApplicationAssembler;
    var _code : Dynamic;

    @Before
	public function setUp() : Void
	{
		_applicationAssembler = new ApplicationAssembler();
		_code = BasicStaticXmlCompiler.compile( _applicationAssembler, "exercises/exercise1/simpleInstantiation.xml", "episode1" );
		_code.execute();
	}
	
	@After
	public function tearDown() : Void
	{
		_applicationAssembler.release();
	}

    @Test( "building simple instance without argument" )
	public function exercice_1() : Void
	{
		Assert.isNotNull( _code.locator.rick, "Where is 'rick'" );
		Assert.isNotNull( _code.locator.morty, "Where is 'morty'" );
		Assert.isNotNull( _code.locator.summer, "Where is 'summer'" );

		Assert.isInstanceOf( _code.locator.rick, Character );
		Assert.isInstanceOf( _code.locator.morty, Character );
		Assert.isInstanceOf( _code.locator.summer, Character );
	}

    public function new() {}
}