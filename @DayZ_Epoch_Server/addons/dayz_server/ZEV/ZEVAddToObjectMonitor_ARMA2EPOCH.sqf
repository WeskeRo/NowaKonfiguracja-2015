format["Add2Monitor - adding %1",_this] call ZEVLog;
_this setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _this];	
format["Vehicle %1 added to ARMA2EPOCH SERVER OBJECT MONITOR",_this] call ZEVLog;
