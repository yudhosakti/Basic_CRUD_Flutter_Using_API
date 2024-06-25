import 'package:baja_besi/Model/PegawaiAPI.dart';
import 'package:baja_besi/Model/PegawaiModel.dart';
import 'package:flutter/material.dart';

class GetPegawaiFromAPI extends ChangeNotifier {
  List<PegawaiModel> list_pegawai = [];
  bool isLoading = true;

  Future<void> tampilKanPegawai() async {
    await PegawaiAPI.getPegawai().then((value) {
      list_pegawai = value;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> hapusPegawai(int id) async {
    await PegawaiAPI.hapusPegawaiAPI(id).then((value) {
      return print("Berhasil Hapus data");
    });
    tampilKanPegawai();
    notifyListeners();
  }
}
