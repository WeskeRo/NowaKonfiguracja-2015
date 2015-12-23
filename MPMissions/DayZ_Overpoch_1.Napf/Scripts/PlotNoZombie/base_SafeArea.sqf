while {true} do {
  sleep 10;

  _playerPos = getPos player;
  _nearPole = nearestObject [_playerPos, "Plastic_Pole_EP1_DZ"];
  if (!isNull _nearPole) then {
    _pos2 = getPos _nearPole;
    _zombies2 = _pos2 nearEntities ["zZombie_Base", dayz_poleSafeArea];
    _count2 = count _zombies2;
    for "_i" from 0 to (_count2 -1) do
    {
      _zombie2 = _zombies2 select _i;
      _zombie2 setpos [-3367.739,-120.84577,-8247.0625];
    };
  };
};