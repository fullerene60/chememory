import 'package:flutter/material.dart';
import 'package:chememory/screens/common_ions.dart';
import 'assets/chemical_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white70),
        ),
      ),
      home: IonScreen(ionDataOG: ChemicalData.commonIons),
    );
  }
}
