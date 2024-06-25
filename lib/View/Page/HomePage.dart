import 'package:baja_besi/ViewModel/BottomNavState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 55, 80, 1),
        appBar: AppBar(
          centerTitle: true,
          title: Consumer<BottomNavState>(builder: (context, value, child) => value.getJudul,),
          backgroundColor: Color.fromRGBO(17, 2, 28, 1),
        ),
        body: Consumer<BottomNavState>(
            builder: (context, value, child) {
              return value.getMenu;
            },),
        bottomNavigationBar: Consumer<BottomNavState>(
          builder: (context, value, child) {
            return BottomNavigationBar(
              
              unselectedItemColor: Colors.white,
              unselectedLabelStyle: TextStyle(
                color: Colors.white
              ),
              iconSize: 30,
              backgroundColor: Color.fromRGBO(17, 2, 28, 1),
                currentIndex: value.index,
                onTap: value.setMenu,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      size: 40,
                      Icons.person),
                      label: "Data Pegawai", icon: Icon(
                        color: Colors.white,
                        Icons.person)),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      size: 40,
                      Icons.add),
                    label: "Tambah Pegawai",
                    icon: Icon(
                      color: Colors.white,
                      Icons.add))
                ]);
          },
        ),
      ),
    );
  }
}
