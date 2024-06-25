import 'package:baja_besi/Model/PegawaiAPI.dart';
import 'package:baja_besi/Model/PegawaiModelPost.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TambahPegawaState extends ChangeNotifier {
  TextEditingController namaPegawai = TextEditingController();
  TextEditingController pangkatPegawai = TextEditingController();
  TextEditingController tempatLahirPegawai = TextEditingController();
  List<TextEditingController> listKeahlian = [TextEditingController()];
  List<TextEditingController> listSifatPegawai = [TextEditingController()];
  List<TextEditingController> listDiklatPegawai = [TextEditingController()];
  List<bool> enable = [];
  late DateTime tanggalLahir;
  late DateTime tmtPns;
  late DateTime tmGolongan;
  List<String> keahlihanPegawai = [];
  List<String> sifatPegawai = [];
  List<String> diklatPegawai = [];
  List<String> ijazahTerakhir = [
    "SMA Sederajat",
    "D1",
    "D2",
    "D3",
    "D4",
    "S1",
    "S2"
  ];
  List<String> listGolonganKaryawan = [
    "2A",
    "2B",
    "2C",
    "2D",
    "3A",
    "3B",
    "3C",
    "3D",
    "4A",
    "4B"
  ];

  String selectedGolongan = "2A";
  String selectedIjazah = "D3";

  void setDropDownPegawai(String? golonganSelected) {
    selectedGolongan = golonganSelected!;
    notifyListeners();
  }

  void setDropDownIjazah(String? golonganSelected) {
    selectedIjazah = golonganSelected!;
    notifyListeners();
  }

  void incrementJumlahKeahlihan(List<TextEditingController> selectedList) {
    selectedList.add(TextEditingController());
    notifyListeners();
  }

  void decrementJumlahKeahliahan(List<TextEditingController> selectedList) {
    if (selectedList.length == 1) {
      notifyListeners();
    } else {
      selectedList.removeLast();
      notifyListeners();
    }
  }

  void tambahEnable() {
    if (enable.length != listDiklatPegawai.length) {
      enable.add(false);
      notifyListeners();
    }
  }

  void ubahEnable(int index) {
    if (enable[index]) {
      enable[index] = false;
      notifyListeners();
    } else {
      enable[index] = true;
      notifyListeners();
    }
  }

  void setTanggal(DateTime tanggal, DateTime tanggalBaru) {
    tanggal = tanggalBaru;
    notifyListeners();
  }

  Future<void> tambahPegawai() async {
    keahlihanPegawai.clear();
    sifatPegawai.clear();
    diklatPegawai.clear();
    for (var i = 0; i < listKeahlian.length; i++) {
      keahlihanPegawai
          .add(listKeahlian[i].text);
    }

    for (var i = 0; i < listDiklatPegawai.length; i++) {
      diklatPegawai.add(listDiklatPegawai[i].text);
    }

    for (var i = 0; i < listSifatPegawai.length; i++) {
      sifatPegawai.add(listSifatPegawai[i].text);
    }

    http.Response response = await PegawaiAPI.tambahPegawaiAPI(
        PegawaiModelPost(
            nama: namaPegawai.text,
            pangkat: pangkatPegawai.text,
            golongan: selectedGolongan,
            tanggalLahir: tanggalLahir.toString(),
            tempatLahir: tempatLahirPegawai.text.toString(),
            tmtPNS: tmtPns.toString(),
            Ijazah: selectedIjazah,
            tmtGolongan: tmGolongan.toString(),
            sifat: sifatPegawai,
            keahlian: keahlihanPegawai,
            diklat: diklatPegawai));
    if (response.statusCode == 200) {
      print("Berhasil");
     
    } else {
      print("Gagal");
    }

    notifyListeners();
  }
}
