import 'package:baja_besi/Model/PegawaiModel.dart';
import 'package:baja_besi/View/Widget/ListDiklatWidget.dart';
import 'package:baja_besi/View/Widget/ListSifatWidget.dart';
import 'package:flutter/material.dart';

import '../Widget/InformasiDetailWidgetCustom.dart';
import '../Widget/ListWidgetDetailCustom.dart';

class DetailPegawaiPage extends StatelessWidget {
  final String nama;
  final String pangkat;
  final String golongan;
  final String tanggalLahir;
  final String tempatLahir;
  final String tmtPNS;
  final String tmtGolongan;
  final List<SifatPegawai> sifat;
  final List<KeahlianPegawai> keahlihan;
  final List<DiklatPegawai> diklat;

  const DetailPegawaiPage(
      {required this.nama,
      required this.pangkat,
      required this.golongan,
      required this.tanggalLahir,
      required this.tempatLahir,
      required this.tmtPNS,
      required this.tmtGolongan,
      required this.sifat,
      required this.keahlihan,
      required this.diklat,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 55, 80, 1),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Detail Pegawai"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/iconprofile.png'),
                                  fit: BoxFit.fill),
                              color: Colors.white,
                              shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.57,
                child: ListView(
                  children: [
                    InformasiDetailWidgetCustom(
                      namaField: "Nama",
                      valueData: nama,
                    ),
                    InformasiDetailWidgetCustom(
                      namaField: "Pangkat",
                      valueData: pangkat,
                    ),
                    InformasiDetailWidgetCustom(
                      namaField: "Golongan",
                      valueData: golongan,
                    ),
                    InformasiDetailWidgetCustom(
                      namaField: "Tanggal Lahir",
                      valueData: tanggalLahir,
                    ),
                    InformasiDetailWidgetCustom(
                      namaField: "Tempat Lahir",
                      valueData: tempatLahir,
                    ),
                    InformasiDetailWidgetCustom(
                      namaField: "TMT-PNS",
                      valueData: tmtPNS,
                    ),
                    InformasiDetailWidgetCustom(
                      namaField: "TMT-Golongan",
                      valueData: tmtGolongan,
                    ),
                  ],
                ),
              ),
            ),
            ListWidgetDetailCustom(
              namaField: "Keahlihan Pegawai",
              keahlihan: keahlihan,
            ),
            ListSifatWidget(sifat: sifat, namaField: "Sifat Pegawai"),
            ListDiklatWidget(diklat: diklat, namaField: "Riwayat Diklat Pegawai"),
          ],
        ),
      ),
    );
  }
}

