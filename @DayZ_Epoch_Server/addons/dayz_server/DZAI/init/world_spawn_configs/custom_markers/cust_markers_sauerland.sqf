/*
	Custom Marker Requirements:
	
	Spawn markers: The area covered by the marker will be used as the patrol and spawning area.
	
		1. Marker shape must be Ellipse (Could be rectangular but the function will consider the marker as elliptical regardless)
		2. Marker should have identical x and y dimensions. If they are different, the smaller dimension will be used instead.
	
	Blacklist markers: If a player is within this area, they will not be selected as a target for dynamic AI spawns.
	
		1. Marker shape may be Ellipse or Rectangle
		2. Marker dimensions should cover the area to be blacklisted.
	
	Example Marker (Note: the marker name must be unique! In this example, it's named "dzaicustomspawntest"):
	
	_this = createMarker ["dzaicustomspawntest", [6650.9883, 9411.541, -6.1035156e-005]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [200, 200];
	_this setMarkerAlpha 0;
	_dzaicustomspawntest = _this;		//_dzaicustomspawntest must be a unique name
	
	Note: This marker is used in the example found in the custom_spawns config files.
*/

//----------------------------Add your custom markers below this line ----------------------------


	_sp1 = createMarker ["Castle1", [5476.3892, 23562.309, 0]];
	_sp1 setMarkerShape "RECTANGLE";
	_sp1 setMarkerType "Empty";
	_sp1 setMarkerBrush "Solid";
	_sp1 setMarkerSize [20, 20];
	_sp1 setMarkerDir 54.42905;
	_sp1 setMarkerAlpha 0;
	Castle1 = _sp1;
	
	_sp2 = createMarker ["Castle2", [5515.5649, 23571.691, 0]];
	_sp2 setMarkerShape "RECTANGLE";
	_sp2 setMarkerType "Empty";
	_sp2 setMarkerBrush "Solid";
	_sp2 setMarkerSize [20, 20];
	_sp2 setMarkerDir 54.42905;
	_sp2 setMarkerAlpha 0;
	Castle2 = _sp2;
	
	_sp3 = createMarker ["Castle3", [5561.9834, 23561.98, 0]];
	_sp3 setMarkerShape "RECTANGLE";
	_sp3 setMarkerType "Empty";
	_sp3 setMarkerBrush "Solid";
	_sp3 setMarkerSize [20, 20];
	_sp3 setMarkerDir 54.42905;
	_sp3 setMarkerAlpha 0;
	Castle3 = _sp3;
	
	_sp4 = createMarker ["Castle4", [5565.1108, 23523.957, 0]];
	_sp4 setMarkerShape "RECTANGLE";
	_sp4 setMarkerType "Empty";
	_sp4 setMarkerBrush "Solid";
	_sp4 setMarkerSize [20, 20];
	_sp4 setMarkerDir 54.42905;
	_sp4 setMarkerAlpha 0;
	Castle4 = _sp4;
	
	_sp5 = createMarker ["Castle5", [5530.0503, 23511.447, 0]];
	_sp5 setMarkerShape "RECTANGLE";
	_sp5 setMarkerType "Empty";
	_sp5 setMarkerBrush "Solid";
	_sp5 setMarkerSize [20, 20];
	_sp5 setMarkerDir 54.42905;
	_sp5 setMarkerAlpha 0;
	Castle5 = _sp5;
	
	_sp6 = createMarker ["Castle6", [5498.7754, 23516.055, 0]];
	_sp6 setMarkerShape "RECTANGLE";
	_sp6 setMarkerType "Empty";
	_sp6 setMarkerBrush "Solid";
	_sp6 setMarkerSize [20, 20];
	_sp6 setMarkerDir 54.42905;
	_sp6 setMarkerAlpha 0;
	Castle6 = _sp6;
	
	_sp7 = createMarker ["Castle7", [5474.7432, 23524.451, 0]];
	_sp7 setMarkerShape "RECTANGLE";
	_sp7 setMarkerType "Empty";
	_sp7 setMarkerBrush "Solid";
	_sp7 setMarkerSize [20, 20];
	_sp7 setMarkerDir 54.42905;
	_sp7 setMarkerAlpha 0;
	Castle7 = _sp7;
	
//-----------Valley

	_sp8 = createMarker ["Valley1", [24247.076, 14448.748, 0]];
	_sp8 setMarkerShape "RECTANGLE";
	_sp8 setMarkerType "Empty";
	_sp8 setMarkerBrush "Solid";
	_sp8 setMarkerSize [20, 20];
	_sp8 setMarkerDir 54.42905;
	_sp8 setMarkerAlpha 0;
	Valley1 = _sp8;
	
	_sp9 = createMarker ["Valley2", [24319.314, 14383.945, 0]];
	_sp9 setMarkerShape "RECTANGLE";
	_sp9 setMarkerType "Empty";
	_sp9 setMarkerBrush "Solid";
	_sp9 setMarkerSize [20, 20];
	_sp9 setMarkerDir 54.42905;
	_sp9 setMarkerAlpha 0;
	Valley2 = _sp9;
	
	_sp10 = createMarker ["Valley3", [24195.561, 14399.024, 0]];
	_sp10 setMarkerShape "RECTANGLE";
	_sp10 setMarkerType "Empty";
	_sp10 setMarkerBrush "Solid";
	_sp10 setMarkerSize [20, 20];
	_sp10 setMarkerDir 54.42905;
	_sp10 setMarkerAlpha 0;
	Valley3 = _sp10;
	
	_sp11 = createMarker ["Valley4", [24464.441, 14444.724, 0]];
	_sp11 setMarkerShape "RECTANGLE";
	_sp11 setMarkerType "Empty";
	_sp11 setMarkerBrush "Solid";
	_sp11 setMarkerSize [20, 20];
	_sp11 setMarkerDir 54.42905;
	_sp11 setMarkerAlpha 0;
	Valley4 = _sp11;
	
	_sp12 = createMarker ["Valley5", [24381.111, 14312.157, 0]];
	_sp12 setMarkerShape "RECTANGLE";
	_sp12 setMarkerType "Empty";
	_sp12 setMarkerBrush "Solid";
	_sp12 setMarkerSize [20, 20];
	_sp12 setMarkerDir 54.42905;
	_sp12 setMarkerAlpha 0;
	Valley5 = _sp12;
	
//-----------Outposts

	_sp25 = createMarker ["Outpost1", [14899.841, 9419.7969, 0]];
	_sp25 setMarkerShape "RECTANGLE";
	_sp25 setMarkerType "Empty";
	_sp25 setMarkerBrush "Solid";
	_sp25 setMarkerSize [30, 30];
	_sp25 setMarkerDir 54.42905;
	_sp25 setMarkerAlpha 0;
	Outpost1 = _sp25;
	
	_sp26 = createMarker ["Outpost2", [2423.6245, 6917.0059, 0]];
	_sp26 setMarkerShape "RECTANGLE";
	_sp26 setMarkerType "Empty";
	_sp26 setMarkerBrush "Solid";
	_sp26 setMarkerSize [30, 30];
	_sp26 setMarkerDir 54.42905;
	_sp26 setMarkerAlpha 0;
	Outpost2 = _sp26;
	
	_sp27 = createMarker ["Outpost3", [1588.3259, 21280.508, 0]];
	_sp27 setMarkerShape "RECTANGLE";
	_sp27 setMarkerType "Empty";
	_sp27 setMarkerBrush "Solid";
	_sp27 setMarkerSize [30, 30];
	_sp27 setMarkerDir 54.42905;
	_sp27 setMarkerAlpha 0;
	Outpost3 = _sp27;