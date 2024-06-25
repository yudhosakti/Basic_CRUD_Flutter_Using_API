import 'package:baja_besi/Model/PegawaiModel.dart';
import 'package:baja_besi/Model/PegawaiModelPut.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'PegawaiModelPost.dart';

class PegawaiAPI {
  static Future getPegawai() async {
    List<PegawaiModel> listPegawai = [];
    Uri apiurl = Uri.parse("http://10.0.2.2:2000/karyawan");
    var apiresult = await http.get(apiurl);
    if (apiresult.statusCode == 200) {
      var jsonObject = jsonDecode(apiresult.body);
      List<dynamic> listTemp = (jsonObject as Map<String, dynamic>)['data'];
      for (var i = 0; i < listTemp.length; i++) {
        listPegawai.add(PegawaiModel.fromJSON(listTemp[i]));
      }
    }
    return listPegawai;
  }

  static Future tambahPegawaiAPI(PegawaiModelPost data) async {
    http.Response? response;
    try {
      response = await http.post(Uri.parse("http://10.0.2.2:2000/tambah"),
          body: json.encode({
            "nama_karyawan": data.nama,
            "pangkat_karyawan": data.pangkat,
            "golongan_karyawan": data.golongan,
            "tanggal_lahir_karyawan": data.tanggalLahir,
            "tempat_lahir_karyawan": data.tempatLahir,
            "ijazah_terakhir_karyawan": data.Ijazah,
            "tmt_pns_karyawan": data.tmtPNS,
            "tmt_golongan_karyawan": data.tmtGolongan,
            "sifatKaryawan": data.sifat,
            "keahlihanKaryawan": data.keahlian,
            "diklatKaryawan": data.diklat
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          });
      print(response);
    } catch (e) {
      print(e);
    }

    return response;
  }

  static Future hapusPegawaiAPI(int idKaryawan) async {
    http.Response? response;
    try {
      response = await http.delete(
        Uri.parse("http://10.0.2.2:2000/hapusKaryawan/${idKaryawan}"),
      );
    } catch (e) {
      print(e);
    }
    return response;
  }

  static Future updatePegawaiAPI(int idPegawai, int idSifat, int idKeahlihan,
      int idDiklat, PegawaiUpdate pegawai) async {
    http.Response? response;
    try {
      response = await http.put(
          Uri.parse(
              "http://10.0.2.2:2000/update/${idPegawai}?id_sifat=${idSifat}&id_keahlihan=${idKeahlihan}?&id_diklat=${idDiklat}"),
          body: json.encode({
            "nama_karyawan": pegawai.nama,
            "pangkat_karyawan": pegawai.pangkat,
            "tanggal_lahir_karyawan": pegawai.tanggalLahir,
            "tempat_lahir_karyawan": pegawai.tempatLahir,
            "golongan_karyawan": pegawai.golongan,
            "ijazah_terakhir_karyawan": pegawai.Ijazah,
            "tmt_pns_karyawan": pegawai.tmtPns,
            "tmt_golongan_karyawan": pegawai.tmtGolongan,
            "sifat_karyawan": pegawai.sifat,
            "keahlihan_karyawan": pegawai.keahlihan,
            "diklat": pegawai.diklat
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          });
    } catch (e) {
      print(e);
    }
    return response;
  }
}
