import 'package:baja_besi/View/Widget/DataPegawaiWidget.dart';
import 'package:baja_besi/View/Widget/TambahKaryawanWidget.dart';
import 'package:flutter/material.dart';

class BottomNavState extends ChangeNotifier {
  int index = 0;
  List<Widget> judulMenu = [Text("Data Pegawai"), Text("Tambah Pegawai")];
  List<Widget> pageHome = [DataPegawaiWidget(), TambahPegawaiWidget()];

  void setMenu(int newindex) {
    index = newindex;
    notifyListeners();
  }

  get getMenu => pageHome[index];
  get getJudul => judulMenu[index];
}
