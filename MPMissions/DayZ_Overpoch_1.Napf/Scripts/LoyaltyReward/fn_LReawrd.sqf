multiPlyWith = 1;
_i=0;

while {_i < 7} do
{
    if ( _i == 1) then 
    {
        _reward = (5000 * multiPlyWith);
        player setVariable ["cashMoney", ((player getVariable ["cashMoney", 0]) + _reward), true];
        _msg = parseText format ["<t align='center' color='#FFFFFF' shadow='2' size='1.75'>Loyalty time reward!</t><br/><t align='center' color='#17FF41'>------------------------------</t><br/><t align='center' color='#FFFFFF'>%1 thank you for playing with [DayZ RVL]! Your loyalty has been rewarded with: </t><t align='center' color='#40FF00'>£%2</t>", name player, _reward];
        hint _msg;
        multiPlyWith = multiPlyWith + 1;
        _i = 0;
    };
    sleep 1800;
    _i = _i + 1;
};