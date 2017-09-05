package exercises.exercise5;

import hex.core.IApplicationAssembler;
import hex.runtime.ApplicationAssembler;
import hex.compiletime.flow.BasicStaticFlowCompiler;
import hex.unittest.assertion.Assert;
import exercises.support.Character;
import exercises.support.Meeseeks;
import exercises.support.Portal;

class FlowConversionTest
{
    var _applicationAssembler : IApplicationAssembler;
    var _code : Dynamic;

    @Before
	public function setUp() : Void
	{
		_applicationAssembler = new ApplicationAssembler();
		_code = BasicStaticFlowCompiler.compile( _applicationAssembler, "exercises/exercise5/conversion.flow", "episode5" );
		_code.execute();
	}
	
	@After
	public function tearDown() : Void
	{
		_applicationAssembler.release();
	}

	@Test( "Convert characters" )
	public function exercice_5_1() : Void
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
	}

	@Test( "Convert 'dimension'" )
	public function exercice_5_2() : Void
	{
		Assert.equals( _code.locator.dimension.name, "C-137", "dimension should be named 'C-137'");
	}

	@Test( "Convert 'travelers'" )
	public function exercice_5_3() : Void
	{
		Assert.isInstanceOf( _code.locator.travelers, Array );
		Assert.arrayContainsElement( _code.locator.travelers, _code.locator.rick, "'rick' should be a travelers" );
		Assert.arrayContainsElement( _code.locator.travelers, _code.locator.morty, "'morty' should be a travelers" );
	}

	@Test( "Convert 'portal'" )
	public function exercice_5_4() : Void
	{
		Assert.isNotNull( _code.locator.portal );
		Assert.isInstanceOf( _code.locator.portal, Portal );
		Assert.isNotNull( _code.locator.portal.dimension );
		Assert.equals( _code.locator.portal.dimension, _code.locator.dimension );
		Assert.isNotNull( _code.locator.portal.place );
		Assert.equals( _code.locator.portal.place, exercises.support.Place.THE_GARAGE );
	}

	@Test( "Convert Mr. Meeseeks" )
	public function exercice_5_5() : Void
	{
		Assert.isNotNull( _code.locator.meeseeks );
		Assert.isInstanceOf( _code.locator.meeseeks, Meeseeks );
	}

	@Test( "Convert pushing Mr. Meeseeks into 'travelers'" )
	public function exercice_5_6() : Void
	{
		Assert.arrayContainsElement( _code.locator.travelers, _code.locator.meeseeks, "'meeseeks' should be a travelers" );
		Assert.isTrue( _code.locator.travelers.length == 3, "no more than 3 travelers" );
	}

	@Test( "Convert time to jump()" )
	public function exercice_5_7() : Void
	{
		Assert.equals( _code.locator.portal.travelers, _code.locator.travelers );
	}

    public function new() {}
}