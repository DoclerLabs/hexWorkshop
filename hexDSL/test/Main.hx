package;
import exercises.ExerciseSuite;
import hex.unittest.runner.ExMachinaUnitCore;

class Main
{

	public static function main()
	{
		var emu = new ExMachinaUnitCore();
        
		#if flash
		emu.addListener( new hex.unittest.notifier.TraceNotifier( flash.Lib.current.loaderInfo, false, true ) );
		#elseif php
		emu.addListener( new hex.unittest.notifier.TraceNotifier( ) );
		#else
		emu.addListener( new hex.unittest.notifier.ConsoleNotifier( ) );
		#end
		
        emu.addTest( ExerciseSuite );
        emu.run();
	}

}