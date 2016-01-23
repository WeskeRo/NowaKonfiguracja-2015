//Prevent moving while locking a safe
private ["_obj"];
disableUserInput true;disableUserInput true;disableUserInput true;
uiSleep 0.1;
_obj = _this select 3;
_obj spawn player_lockVault;
uiSleep 6.5;
disableUserInput false;disableUserInput false;disableUserInput false;
disableUserInput true;disableUserInput false;
