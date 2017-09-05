package exercises.exercise2;

import hex.core.IApplicationAssembler;
import hex.runtime.ApplicationAssembler;
import hex.compiletime.xml.BasicStaticXmlCompiler;
import hex.unittest.assertion.Assert;
import exercises.support.Character;

class ArgumentAndPropertyTest
{
    var _applicationAssembler : IApplicationAssembler;
    var _code : Dynamic;

    @Before
	public function setUp() : Void
	{
		_applicationAssembler = new ApplicationAssembler();
    	_code = BasicStaticXmlCompiler.compile( _applicationAssembler, "exercises/exercise2/argumentAndProperty.xml", "episode2" );
		_code.execute();
	}
	
	@After
	public function tearDown() : Void
	{
		_applicationAssembler.release();
	}
	
	@Test( "check initial values" )
	public function exercice_2_0() : Void
	{
		Assert.isNotNull( _code.locator.rick, "Where is 'rick'" );
		Assert.isNotNull( _code.locator.morty, "Where is 'morty'" );
		Assert.isNotNull( _code.locator.summer, "Where is 'summer'" );

		Assert.isInstanceOf( _code.locator.rick, Character );
		Assert.isInstanceOf( _code.locator.morty, Character );
		Assert.isInstanceOf( _code.locator.summer, Character );
	}

    @Test( "characters should have name" )
	public function exercice_2_1() : Void
	{
		Assert.equals( _code.locator.rick.name, "Rick" );
		Assert.equals( _code.locator.morty.name, "Morty" );
		Assert.equals( _code.locator.summer.name, "Summer" );
	}

	@Test( "Object 'dimension' should have name 'C-137'" )
	public function exercice_2_2() : Void
	{
		Assert.equals( _code.locator.dimension.name, "C-137", "dimension should be named 'C-137'");
	}

    public function new() {}
}