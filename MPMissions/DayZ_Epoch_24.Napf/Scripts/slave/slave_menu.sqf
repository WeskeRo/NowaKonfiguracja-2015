_pathtoscripts = "Scripts\slave\";
_EXECscrt = 'player execVM "'+_pathtoscripts+'%1"';

slavemenu =
[
    ["",true],
        ["Choose Your Slave:", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Hooker - 10,000 coins", [2],  "", -5, [["expression", format[_EXECscrt,"slave1.sqf"]]], "1", "1"],
			["Mule Light - 5,000 coins", [3],  "", -5, [["expression", format[_EXECscrt,"slave2.sqf"]]], "1", "1"],
			["Mule Heavy - 10,000 coins", [4],  "", -5, [["expression", format[_EXECscrt,"slave3.sqf"]]], "1", "1"],
			["Bodyguard Light - 10,000 coins", [5],  "", -5, [["expression", format[_EXECscrt,"slave4.sqf"]]], "1", "1"],
			["Bodyguard Heavy - 20,000 coins", [6],  "", -5, [["expression", format[_EXECscrt,"slave5.sqf"]]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
        ["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:slavemenu";