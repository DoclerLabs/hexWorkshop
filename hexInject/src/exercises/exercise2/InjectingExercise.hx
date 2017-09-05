package exercises.exercise2;

import exercises.exercise2.support.Plumbus;
import exercises.support.Human;
import exercises.support.Jerry;
import exercises.support.PortalGun;
import exercises.support.Rick;
import exercises.support.BaseExercise;

class InjectingExercise extends BaseExercise 
{

	//     _____  _      _                      _   __  __            _         
	//    |  __ \(_)    | |                    | | |  \/  |          | |        
	//    | |__) |_  ___| | __   __ _ _ __   __| | | \  / | ___  _ __| |_ _   _ 
	//    |  _  /| |/ __| |/ /  / _` | '_ \ / _` | | |\/| |/ _ \| '__| __| | | |
	//    | | \ \| | (__|   <  | (_| | | | | (_| | | |  | | (_) | |  | |_| |_| |
	//    |_|  \_\_|\___|_|\_\  \__,_|_| |_|\__,_| |_|  |_|\___/|_|   \__|\__, |
	//                                                                     __/ |
	//                                                                    |___/ 


	public function injectingExercise1(rick:Rick):PortalGun
	{
		//TODO: Morty misplaced Rick's portal gun (but it's still somewhere in the injector), make sure Rick has his portal gun and return it
		
		return null;
	}
	
	public function injectingExercise2():Human
	{
		// TODO: You are Unity and Rick is requesting a person with specific body charateristic. There is always a different characteristic every time
		// TODO: Create a new Human and return it (but you don't know what's on Ricks mind at this moment)
		
		return null;
	}

	public function injectingExercise3():Jerry
	{
		// TODO:  You left Jerry at day care. Make sure you get your "C-137" Jerry and return him.
		
		return null;
	}
	
	public function injectingExercise4():Plumbus
	{
		// TODO: Apparently your neighbor doesn't have a Plumbus, what an idiot. It's well known that everybody has one.
		// TODO: Just make sure you return an instance of a Plumbus. Don't be like your neighbor.

		return null;
	}
	
}