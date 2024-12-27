import "package:flutter/material.dart";

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: "Muli"
  );
}

AppBarTheme appBarTheme(){
  return const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
  );
}
