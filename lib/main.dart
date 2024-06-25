import 'package:baja_besi/View/Page/LoginPage.dart';
import 'package:baja_besi/View/Page/SplashScreenPage.dart';
import 'package:baja_besi/ViewModel/BottomNavState.dart';
import 'package:baja_besi/ViewModel/EditPegawaiState.dart';
import 'package:baja_besi/ViewModel/GetPegawaiState.dart';
import 'package:baja_besi/ViewModel/TambahPegawaiState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomNavState(),),
      ChangeNotifierProvider(create: (context) => TambahPegawaState(),),
      ChangeNotifierProvider(create: (context) => GetPegawaiFromAPI(),),
      ChangeNotifierProvider(create: (context) => EditPegawaiState(),)
    ],
    child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScrennPage();
          } else {
            return Myapp();
          }
        }),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
