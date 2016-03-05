_this addEventHandler ["GetIn",{
			if (isPlayer (_this select 2)) then {
				(_this select 2) action ["getOut",(_this select 0)]; 
				0 = [nil,(_this select 2),"loc",rTITLETEXT,"Players are not permitted to enter AI vehicles!","PLAIN DOWN",5] call RE;
				/*(_this select 0) setVehicleLock "LOCKED";*/
			};
		}];