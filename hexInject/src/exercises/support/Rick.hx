package exercises.support;
import hex.di.IInjectorContainer;

class Rick implements IGrandpa implements IScientist
	implements IInjectorContainer
{
	
	@Inject
	@Optional(true)
	public var portalGun:PortalGun;

	public function new() 
	{
	}
}