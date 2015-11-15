_this = createMarker ["DHL HQ", [14851.652, 14473.11, 0]];
_this setMarkerText "DHL HQ";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorPink";

_this = createMarker ["Cow Buyer", [10829.898, 12731.838, 0]];
_this setMarkerText "Meat Factory";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorYellow";

_this = createMarker ["Cow Seller", [8786.6973, 12532.905, 0]];
_this setMarkerText "Cow Farm";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorYellow";

_this = createMarker ["Bank", [9064.8467, 16881.297, 8.1982946]];
_this setMarkerText "Bank of Lenzburg";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBlue";

_this = createMarker ["Oil Rig", [2662.4063, 17622.42, 0]];
_this setMarkerText "Oil Rig";
_this setMarkerType "mil_circle";
_this setMarkerColor "ColorBlack";

_this = createMarker ["Oil Refinery", [6336.1006, 9906.7715, 12.901981]];
_this setMarkerText "Oil Refinery";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBlack";

_this = createMarker ["Gem Trader", [9062.8926, 15472.217, 7.5856962]];
_this setMarkerText "Gem Trader";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBlue";

_this = createMarker ["Drug Dealer", [8708.8682, 10096.274, 4.1403961]];
_this setMarkerText "Drug Dealer";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorGreen";

_this = createMarker ["Pearls", [7152.4751, 117.16736, 11.687086]];
_this setMarkerText "Pearl Fishing";
_this setMarkerType "mil_circle";
_this setMarkerColor "ColorOrange";

_this = createMarker ["Bruderholz", [9851.1094, 9960.2881, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Waldegg", [8418.9893, 911.89819, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Worb", [2418.7917, 7765.917, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Huttwil", [4180.9565, 12677.827, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Lenzburg", [8911.6494, 16238.692, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Suhrenfeld", [16310.693, 18480.355, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Emmen", [15482.803, 13317.469, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Alpnach", [18700.055, 9465.2207, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Froburg", [18049.33, 2554.0747, 0]];
_this setMarkerText "FastTravel";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorBrown";

_this = createMarker ["Internet Cafe", [14280.984, 13827.076, 0]];
_this setMarkerText "Internet Cafe";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorPink";

_this = createMarker ["Employment Agency", [11970.685, 15336.549, 0]];
_this setMarkerText "Employment Agency";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorKhaki";

_this = createMarker ["Rescue Center", [10812.842, 14974.215, 0]];
_this setMarkerText "Rescue Center";
_this setMarkerType "mil_dot";
_this setMarkerColor "ColorPink";

waitUntil { (!isNil "PV_HALV_Broadcast_weedlocations") };
_nr = 1;
for "_i" from 0 to ((count PV_HALV_Broadcast_weedlocations)-1) do {
	_markername = format["CannabisField%1",_nr];
	if (getMarkerColor _markername == "") then {
		_marker = createMarker [_markername, (PV_HALV_Broadcast_weedlocations select _i)];
		_marker setMarkerType "mil_dot";
		_marker setMarkerText "Cannabis Field";
		_marker setMarkerColor "ColorGreen";
	};
	_nr = _nr + 1;
};
PV_HALV_Broadcast_weedlocations = nil;
