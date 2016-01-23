player playMove "AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou";
_isDancing = ["AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou",_animState] call fnc_inString;


 
r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
 
    while {r_doLoop} do {
        _animState = animationState player;
        _isDancing = ["AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou",_animState] call fnc_inString;
        if (_isDancing) then {
            _started = true;
        };
        if (_started and !_isDancing) then {
            r_doLoop = false;
            _finished = true;
        };
        if (r_interrupt) then {
            r_doLoop = false;
        };
        sleep 0.1;
    };
    r_doLoop = false;
 
if (_finished) then {
 

 
} else {
r_interrupt = false;
[objNull, player, rSwitchMove,""] call RE;
player playActionNow "stop";

};