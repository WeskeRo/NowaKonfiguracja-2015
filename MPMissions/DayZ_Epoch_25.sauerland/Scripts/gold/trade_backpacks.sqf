private ["_part_out","_part_in","_qty_out","_qty_in","_qty","_bos","_bag","_class","_started","_finished","_animState","_isMedic","_num_removed","_needed","_activatingPlayer","_buy_o_sell","_textPartIn","_textPartOut","_traderID","_abort","_msg"];
//		   [part_out,part_in, qty_out, qty_in,];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

_activatingPlayer = player;

//diag_log format["DEBUG BACKPACK: %1", _this];

_part_out = (_this select 3) select 0;
_part_in = (_this select 3) select 1;
_qty_out = (_this select 3) select 2;
_qty_in = (_this select 3) select 3;
_buy_o_sell = (_this select 3) select 4;
_textPartIn = (_this select 3) select 5;
_textPartOut = (_this select 3) select 6;
_traderID = (_this select 3) select 7;
_bos = 0;
_abort = false;
_msg = "";

if(_buy_o_sell == "buy") then {
	//_qty = {_x == _part_in} count magazines player;
	_qty = player getVariable ["cashMoney",0]; // get your money variable	
	_bag = unitBackpack player;
	_class = typeOf _bag;
	if(!isNil "_class") then {
		if(_class != "") then {
			_abort = true;
			_msg = "Drop or sell your current backpack before you can buy a new one.";
		};
	};
} else {
	_bos = 1;
	_qty = 0;
	_bag = unitBackpack player;
	_class = typeOf _bag;
	if(_class == _part_in) then {
		_qty = 1;
	};
};

if (_abort) exitWith {
	cutText [_msg, "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

if (_qty >= _qty_in) then {

	cutText [(localize "str_epoch_player_105"), "PLAIN DOWN"];
	 
	[1,1] call dayz_HungerThirst;
	// force animation 
	player playActionNow "Medic";
	
	r_interrupt = false;
	_animState = animationState player;
	r_doLoop = true;
	_started = false;
	_finished = false;
	
	while {r_doLoop} do {
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {
			_started = true;
		};
		if (_started and !_isMedic) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};
	r_doLoop = false;

	if (!_finished) exitWith { 
		r_interrupt = false;
		if (vehicle player == player) then {
			[objNull, player, rSwitchMove,""] call RE;
			player playActionNow "stop";
		};
		cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
	};

	if (_finished) then {

		// Double check we still have parts
		if(_buy_o_sell == "buy") then {
			//_qty = {_x == _part_in} count magazines player;
			_qty = player getVariable ["cashMoney",0]; // get your money variable	
		} else {
			_qty = 0;
			_bag = unitBackpack player;
			_class = typeOf _bag;
			if(_class == _part_in) then {
				_qty = 1;
			};
		};

		if (_qty >= _qty_in) then {

			//["PVDZE_obj_Trade",[_activatingPlayer,_traderID,_bos]] call callRpcProcedure;
			if (isNil "_bag") then { _bag = "Unknown Backpack" };
			if (isNil "inTraderCity") then {
				inTraderCity = "Unknown Trader"; 
			} else {
				if (inTraderCity == "Any") then {
					inTraderCity = "Unknown Trader"; 
				};
			};
			
			if (_bos == 1) then {
				// Selling
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_in,inTraderCity,CurrencyName,_qty_out];
			} else {
				// Buying
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_out,inTraderCity,CurrencyName,_qty_in];
			};
			
			publicVariableServer  "PVDZE_obj_Trade";
	
			//diag_log format["DEBUG Starting to wait for answer: %1", PVDZE_obj_Trade];

			waitUntil {!isNil "dayzTradeResult"};

			//diag_log format["DEBUG Complete Trade: %1", dayzTradeResult];

			if(dayzTradeResult == "PASS") then {

				if(_buy_o_sell == "buy") then {
					
					// Buy
					//_num_removed = ([player,_part_in,_qty_in] call BIS_fnc_invRemove);
					_qtychange = _qty - _qty_in;
					player setVariable ["cashMoney", _qtychange , true];
					_newM = player getVariable ["cashMoney",0];
					//_removed = ([player,_part_in,_qty_in] call BIS_fnc_invRemove);
					
					_num_removed = _qty - _newM; // 
					
					if(_num_removed == _qty_in) then {
						removeBackpack player;
						player addBackpack _part_out;
					};
				} else {
				
					// Sell
					if((typeOf (unitBackpack player)) == _part_in) then {
						removeBackpack player;
						//for "_x" from 1 to _qty_out do {
						//	player addMagazine _part_out;
						//};
						
						_myMoney = player getVariable ["cashMoney",0];
						_myMoney = _myMoney + _qty_out;
						player setVariable ["cashMoney", _myMoney , true];
						
					};
				};

				cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];

				{player removeAction _x} forEach s_player_parts;s_player_parts = [];
				s_player_parts_crtl = -1;
	
			} else {
				cutText [format[(localize "str_epoch_player_183"),_textPartOut] , "PLAIN DOWN"];
			};
			dayzTradeResult = nil;
		};
	};
	
} else {
	_needed =  _qty_in - _qty;
	cutText [format["You need %1 %2",_needed,_textPartIn] , "PLAIN DOWN"];
};

DZE_ActionInProgress = false;