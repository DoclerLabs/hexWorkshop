package exercises.support;

import exercises.support.Character;
import hex.di.IInjectorContainer;

class RickAndMorty implements IInjectorContainer
{
    @Inject("rick")
    public var rick:Character;

    @Inject("morty")
    public var morty:Character;

    public function new() 
    {
    }
}