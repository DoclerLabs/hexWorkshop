package exercises.exercise1;

import exercises.support.IGrandpa;
import exercises.support.IMeeseeks;
import exercises.support.IScientist;
import exercises.support.Meeseeks;
import exercises.support.Rick;
import exercises.support.BaseExercise;

class MappingExercise extends BaseExercise 
{

	//     _____  _      _                      _   __  __            _         
	//    |  __ \(_)    | |                    | | |  \/  |          | |        
	//    | |__) |_  ___| | __   __ _ _ __   __| | | \  / | ___  _ __| |_ _   _ 
	//    |  _  /| |/ __| |/ /  / _` | '_ \ / _` | | |\/| |/ _ \| '__| __| | | |
	//    | | \ \| | (__|   <  | (_| | | | | (_| | | |  | | (_) | |  | |_| |_| |
	//    |_|  \_\_|\___|_|\_\  \__,_|_| |_|\__,_| |_|  |_|\___/|_|   \__|\__, |
	//                                                                     __/ |
	//                                                                    |___/ 


		public function mappingExercise1():Void
		{
			//TODO: Every time you ask for "Rick" you should always get the same Rick
			
		}

		public function mappingExercise1_1():Void
		{
			//TODO: "Rick" in this universe died. Remove him from the injector.
			
		}

		public function mappingExercise2():Void
		{
			//TODO: Considering this universe isn't the only one there can actually be multiple Ricks.
			//TODO: Create two Ricks whe one will be called "C-137" and one will be "C-35"
			
		}

		public function mappingExercise3():Void
		{
			//TODO: Every time someone request a scientist (IScientist) he/she gets Rick. Remember, there is only one Rick
			
		}

		public function mappingExercise4():Void
		{
			//TODO: Create a Meeseeks box. Every time someone requests a Mr. Meeseeks (IMeeseeks) he/she will receive a new instance of Mr. Meeseeks (hint: factory)
			
		}

		public function mappingExercise5():Void
		{
			//TODO:    	Rick is a scientist and also a Morty's grandpa
			//TODO:    	Whenever someone from Morty's lme family asks for a scientist (IScientist) or Morty's grandpa (IGrandpa) you should always get Rick
			//TODO:		There is only one Rick.
			
		}

}