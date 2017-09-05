package exercises.support;

class MeeseeksBox
{
    static var _I : MeeseeksBox;

    function new() {}

    public static function getInstance() 
    {
        if( _I == null )
        {
            _I = new MeeseeksBox();
        }
        return _I;
    }

    public function pressButton() 
    {
        return new Meeseeks();
    }

}