import 'package:baja_besi/Model/PegawaiAPI.dart';
import 'package:baja_besi/Model/PegawaiModelPut.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../Model/PegawaiModel.dart';

class EditPegawaiState extends ChangeNotifier {
  TextEditingController namaPegawai = TextEditingController();
  TextEditingController keahlihanedit = TextEditingController();
  TextEditingController sifatEdit = TextEditingController();
  TextEditingController diklatEdit = TextEditingController();
  TextEditingController pangkatPegawai = TextEditingController();
  TextEditingController tempatLahirPegawai = TextEditingController();
  List<TextEditingController> listKeahlian = [TextEditingController()];
  List<TextEditingController> listSifatPegawai = [TextEditingController()];

  List<TextEditingController> listDiklatPegawai = [TextEditingController()];
  late DateTime tanggalLahir;
  late DateTime tmtPns;
  late DateTime tmGolongan;
  int indexKeahlihan = 0;
  int indexSifat = 0;
  int indexDiklat = 0;
  int idKeahlihan = 0;
  int idSifat = 0;
  int idDiklat = 0;
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

  void IncrementIndexList(List<dynamic> selectedList, int index) {
    if (indexKeahlihan < selectedList.length - 1) {
      indexKeahlihan += 1;
      notifyListeners();
    } else {
      indexKeahlihan = selectedList.length - 1;
      notifyListeners();
    }
  }

  void decrementIndexList(int index) {
    if (indexKeahlihan < 1) {
      notifyListeners();
    } else {
      indexKeahlihan -= 1;
      notifyListeners();
    }
  }

  void IncrementIndexListSifat(List<dynamic> selectedList, int index) {
    if (indexSifat < selectedList.length - 1) {
      indexSifat += 1;
      notifyListeners();
    } else {
      indexSifat = selectedList.length - 1;
      notifyListeners();
    }
  }

  void decrementIndexListSifat(int index) {
    if (indexSifat < 1) {
      notifyListeners();
    } else {
      indexSifat -= 1;
      notifyListeners();
    }
  }

  void IncrementIndexListDiklat(List<dynamic> selectedList, int index) {
    if (indexDiklat < selectedList.length - 1) {
      indexDiklat += 1;
      notifyListeners();
    } else {
      indexDiklat = selectedList.length - 1;
      notifyListeners();
    }
  }

  void decrementIndexListDiklat(int index) {
    if (indexDiklat < 1) {
      notifyListeners();
    } else {
      indexDiklat -= 1;
      notifyListeners();
    }
  }

  void resetall() {
    indexKeahlihan = 0;
    indexSifat = 0;
    indexDiklat = 0;
    notifyListeners();
  }

  void setTanggal(DateTime tanggal, DateTime tanggalBaru) {
    tanggal = tanggalBaru;
    notifyListeners();
  }

  void setKeahlihan(List<KeahlianPegawai> listku) {
    idKeahlihan = listku[indexKeahlihan].id_keahlian;
    notifyListeners();
  }

  void setSifat(List<SifatPegawai> listku) {
    idSifat = listku[indexKeahlihan].id_sifat;
    notifyListeners();
  }

  void setDiklat(List<DiklatPegawai> listku) {
    idDiklat = listku[indexKeahlihan].id_diklat;
    notifyListeners();
  }

  void setID(PegawaiModel pegawai) {
    idKeahlihan = pegawai.keahlian[indexKeahlihan].id_keahlian;
    idDiklat = pegawai.diklat[indexDiklat].id_diklat;
    idSifat = pegawai.sifat[indexSifat].id_sifat;
    tanggalLahir = DateFormat('yyyy-MM-dd').parse(pegawai.tanggalLahir);
    tmtPns = DateFormat('yyyy-MM-dd').parse(pegawai.tmtPNS);
    tmGolongan = DateFormat('yyyy-MM-dd').parse(pegawai.tmtGolongan);
    notifyListeners();
  }

  void tambahPegawai() {
    keahlihanPegawai.clear();
    sifatPegawai.clear();
    diklatPegawai.clear();
    for (var i = 0; i < listKeahlian.length; i++) {
      keahlihanPegawai.add(listKeahlian[i].text);
    }

    for (var i = 0; i < listDiklatPegawai.length; i++) {
      sifatPegawai.add(listSifatPegawai[i].text);
    }

    for (var i = 0; i < listSifatPegawai.length; i++) {
      diklatPegawai.add(listSifatPegawai[i].text);
    }

    Map<String, dynamic> testMapping = {
      "nama": namaPegawai.text,
      "pangkat": pangkatPegawai.text,
      "Tempat Lahir": tempatLahirPegawai.text,
      "Tanggal Lahir": tanggalLahir,
      "TMT-PNS": tmtPns,
      "TMT-Golongan": tmGolongan,
      "Keahlihan": keahlihanPegawai,
      "Sifat": sifatPegawai,
      "Diklat": diklatPegawai
    };

    notifyListeners();

    print(testMapping);
  }

  Future<void> updatePegawai(int idPegawai, List<SifatPegawai> sifat,
      List<KeahlianPegawai> keahlihan, List<DiklatPegawai> diklat) async {
    http.Response response = await PegawaiAPI.updatePegawaiAPI(
        idPegawai,
        sifat[indexSifat].id_sifat,
        keahlihan[indexKeahlihan].id_keahlian,
        diklat[indexDiklat].id_diklat,
        PegawaiUpdate(
            nama: namaPegawai.text,
            pangkat: pangkatPegawai.text,
            tempatLahir: tempatLahirPegawai.text,
            golongan: selectedGolongan,
            Ijazah: selectedIjazah,
            tanggalLahir: tanggalLahir.toString(),
            tmtPns: tmtPns.toString(),
            tmtGolongan: tmGolongan.toString(),
            keahlihan: keahlihanedit.text,
            sifat: sifatEdit.text,
            diklat: diklatEdit.text));

    if (response.statusCode == 200) {
      print("Berhasil");
    } else {
      print("Gagal");
    }

    notifyListeners();
  }
}
