// Check Ownership by RimBlock (http://epochmod.com/forum/index.php?/user/12612-rimblock/)

private ["_player","_object","_playerUID","_ObjectOwner","_owner","_friendlies","_friendly","_return"];

_player = _this select 0;
_Object = _this select 1;
_Owner = false;
_friendly = false;

_playerUID = [_player] call FNC_GetPlayerUID;
_ObjectOwner = _object getVariable ["ownerPUID","0"];
_friendlies	= _object getVariable ["plotfriends",[]];



if (_playerUID == _ObjectOwner) then {
	_owner = true;
};

_fuid  = [];
{
      _friendUID = _x select 0;
      _fuid  =  _fuid  + [_friendUID];
} forEach _friendlies;

if ( _playerUID in _fuid) then {
	_friendly = true;
};

_return = [_owner, _friendly];
_return