import 'package:flutter/material.dart';

import 'color.dart';

ThemeData Ten = ThemeData(
    fontFamily: "Lato",
    primaryColor: ColorApp.intergalactic,

    /////////////////////////////////////////////////////////////////////////////////////
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          overflow: TextOverflow.fade,
          color: ColorApp.intergalactic,
          fontSize: 25,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          overflow: TextOverflow.fade,
          color: ColorApp.caddiesSilk,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
        overflow: TextOverflow.fade,
        color: ColorApp.caddiesSilk,
        fontSize: 12,
      ),
    ));

//******************************************************************************************************************************************************
ThemeData Tar = ThemeData(
    fontFamily: "NotoKufiArabic",
    primaryColor: ColorApp.intergalactic,

    /////////////////////////////////////////////////////////////////////////////////////

    textTheme: const TextTheme(
      displayLarge: TextStyle(
          overflow: TextOverflow.fade,
          color: ColorApp.intergalactic,
          fontSize: 25,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
        overflow: TextOverflow.fade,
        color: ColorApp.mildBlue,
        fontSize: 15,
      ),
      displaySmall: TextStyle(
        overflow: TextOverflow.fade,
        color: ColorApp.caddiesSilk,
        fontSize: 12,
      ),
    ));
