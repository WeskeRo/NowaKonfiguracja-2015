private ["_ai","_m","_list"];
_ai 	= _this;
if(isNull _ai) exitWith { diag_log "ZEV# ZEVADDAI2List: _ai = null"; };
_m 		= _ai getVariable ZEVObject; 
if((isNil "_m") || (isNull _m)) exitWith
{
	"mission object is NULL, abort adding AI to mission list" call ZEVLog;
};

format ["AddAI2List _ai = %1, _m=%2", _ai, _m] call ZEVLog;
_list	= [];
_list   = _m getVariable [ZEVAIList, []];
_list set [count _list, _ai];
_m setVariable [ZEVAIList, _list, true];