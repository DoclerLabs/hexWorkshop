package exercises.exercise3;

import hex.core.IApplicationAssembler;
import hex.runtime.ApplicationAssembler;
import hex.compiletime.xml.BasicStaticXmlCompiler;
import hex.unittest.assertion.Assert;
import exercises.support.Character;
import exercises.support.Portal;

class ReferenceTest
{
    var _applicationAssembler : IApplicationAssembler;
    var _code : Dynamic;

    @Before
	public function setUp() : Void
	{
		_applicationAssembler = new ApplicationAssembler();
		_code = BasicStaticXmlCompiler.compile( _applicationAssembler, "exercises/exercise3/reference.xml", "episode3" );
		_code.execute();
	}
	
	@After
	public function tearDown() : Void
	{
		_applicationAssembler.release();
	}

	@Test( "check initial values" )
	public function exercice_3_0() : Void
	{
		Assert.isNotNull( _code.locator.rick, "Where is 'rick'" );
		Assert.isNotNull( _code.locator.morty, "Where is 'morty'" );
		Assert.isNotNull( _code.locator.summer, "Where is 'summer'" );

		Assert.isInstanceOf( _code.locator.rick, Character );
		Assert.isInstanceOf( _code.locator.morty, Character );
		Assert.isInstanceOf( _code.locator.summer, Character );

		Assert.equals( _code.locator.rick.name, "Rick" );
		Assert.equals( _code.locator.morty.name, "Morty" );
		Assert.equals( _code.locator.summer.name, "Summer" );

		Assert.equals( _code.locator.dimension.name, "C-137", "dimension should be named 'C-137'");
	}

    @Test( "create an Array of travelers" )
	public function exercice_3_1() : Void
	{
		Assert.isInstanceOf( _code.locator.travelers, Array );
		Assert.arrayContainsElement( _code.locator.travelers, _code.locator.rick, "'rick' should be a travelers" );
		Assert.arrayContainsElement( _code.locator.travelers, _code.locator.morty, "'morty' should be a travelers" );
		Assert.isTrue( _code.locator.travelers.length == 2, "no more than 2 travelers" );
	}

	@Test( "open a portal" )
	public function exercice_3_2() : Void
	{
		Assert.isNotNull( _code.locator.portal );
		Assert.isInstanceOf( _code.locator.portal, Portal );
		Assert.isNotNull( _code.locator.portal.dimension );
		Assert.equals( _code.locator.portal.dimension, _code.locator.dimension );
		Assert.isNotNull( _code.locator.portal.place );
		Assert.equals( _code.locator.portal.place, exercises.support.Place.THE_GARAGE );
	}

    public function new() {}
}