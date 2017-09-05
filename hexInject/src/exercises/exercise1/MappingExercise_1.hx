package exercises.exercise1;
import exercises.exercise1.support.Answer;
import exercises.exercise1.support.IAnswer;
import exercises.exercise1.support.ICounter;
import exercises.exercise1.support.Insult;
import exercises.support.IMeeseeks;
import exercises.support.Jerry;
import exercises.support.Meeseeks;
import exercises.support.BaseExercise;
import hex.di.IDependencyInjector;
import hex.di.provider.IDependencyProvider;

class MappingExercise_1 extends BaseExercise
{


	//     _____  _      _                      _   __  __            _         
	//    |  __ \(_)    | |                    | | |  \/  |          | |        
	//    | |__) |_  ___| | __   __ _ _ __   __| | | \  / | ___  _ __| |_ _   _ 
	//    |  _  /| |/ __| |/ /  / _` | '_ \ / _` | | |\/| |/ _ \| '__| __| | | |
	//    | | \ \| | (__|   <  | (_| | | | | (_| | | |  | | (_) | |  | |_| |_| |
	//    |_|  \_\_|\___|_|\_\  \__,_|_| |_|\__,_| |_|  |_|\___/|_|   \__|\__, |
	//                                                                     __/ |
	//                                                                    |___/ 

	public function mappingExercise6():ICounter
	{
		//TODO:    	We want to count how many Meeseeks (IMeeseeks) were ever created
		//hint: make sure you implement ICounter and return it
		
		return null;
	}

	public function mappingExercise7():Void
	{
		//TODO: Someone is asking Rick a question and you should always provide an answer.
		//TODO:  Rick doesn't always answer the same way based on who's asking.
		//TODO:  If it's Jerry who's asking a question make sure you provide an "Insult", otherwise provide a regular "Answer"
		
		//hint: Both Insult an Answer implement IAnswer so use that interface for mapping
		//hint: To figure out if supplied type is Jerry use static helper method Jerry.isJerry(type)
		
	}
}
