within IDEAS.Buildings.Data.Glazing.Specialized;
record InterpaneIPLUSCKR4_12_4_14004 = IDEAS.Buildings.Data.Interfaces.Glazing
    (
final nLay=3,
final mats={ IDEAS.Buildings.Data.Materials.Glass(d=4.0, epsLw_b=0.4),
 IDEAS.Buildings.Data.Materials.Krypton(d=12.0, epsLw_b=0.4),
 IDEAS.Buildings.Data.Materials.Glass(d=4.0, epsLw_b=0.4)},final SwTrans=[0,0.462;
10,0.465;
20,0.458;
30,0.450;
40,0.438;
50,0.415;
60,0.364;
70,0.266;
80,0.125;
90,0.000],
final SwAbs= [0,0.097, 0.0,0.124;
10,0.097, 0.0,0.126;
20,0.099, 0.0,0.133;
30,0.101, 0.0,0.137;
40,0.105, 0.0,0.138;
50,0.110, 0.0,0.140;
60,0.114, 0.0,0.147;
70,0.118, 0.0,0.146;
80,0.115, 0.0,0.100;
90,0.001, 0.0,0.000],final SwTransDif=0.364,
final SwAbsDif={0.114,0.0,0.147},
final U_value=0.96,
final g_value=0.498) "InterpaneIPLUSCKR4_12_4(U-design =0.96 g-design =0.498)
";