package exercises.support;

import hex.di.IDependencyInjector;
import hex.di.Injector;

class BaseExercise
{
	var dependencyInjector:IDependencyInjector;
	var injector:Injector;

	public function new(injector:Injector) 
	{
		this.injector = injector;
		this.dependencyInjector = injector;
	}
	
}
