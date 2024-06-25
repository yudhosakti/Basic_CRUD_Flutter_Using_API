import 'package:baja_besi/View/Widget/NestedListKeahlihanWidget.dart';
import 'package:baja_besi/View/Widget/NestedListSifatWidget.dart';
import 'package:baja_besi/ViewModel/EditPegawaiState.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Model/PegawaiModel.dart';
import '../../ViewModel/TambahPegawaiState.dart';
import '../Widget/InputWidgetCustom.dart';
import '../Widget/NestedLIstDiklatWidget.dart';
import '../Widget/TambahKaryawanWidget.dart';

class EditPegawaiPage extends StatefulWidget {
  final int id;
  final String nama;
  final String pangkat;
  final String golongan;
  final String ijazah;
  final String tanggalLahir;
  final String tempatLahir;
  final String tmtPNS;
  final String tmtGolongan;
  final List<SifatPegawai> sifat;
  final List<KeahlianPegawai> keahlihan;
  final List<DiklatPegawai> diklat;
  const EditPegawaiPage(
      {super.key,
      required this.id,
      required this.ijazah,
      required this.nama,
      required this.pangkat,
      required this.golongan,
      required this.tanggalLahir,
      required this.tempatLahir,
      required this.tmtPNS,
      required this.tmtGolongan,
      required this.sifat,
      required this.keahlihan,
      required this.diklat});

  @override
  State<EditPegawaiPage> createState() => _EditPegawaiPageState();
}

class _EditPegawaiPageState extends State<EditPegawaiPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var a = Provider.of<EditPegawaiState>(context, listen: false);
      a.resetall();
      a.setID(PegawaiModel(
          id: widget.id,
          nama: widget.nama,
          pangkat: widget.pangkat,
          golongan: widget.golongan,
          tanggalLahir: widget.tanggalLahir,
          tempatLahir: widget.tempatLahir,
          tmtPNS: widget.tmtPNS,
          Ijazah: widget.ijazah,
          tmtGolongan: widget.tmtGolongan,
          sifat: widget.sifat,
          keahlian: widget.keahlihan,
          diklat: widget.diklat));

      print(a.idKeahlihan);
      print(a.idDiklat);
      print(a.idSifat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Edit Pegawai",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Consumer<EditPegawaiState>(
          builder: (context, pegawai, child) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(41, 55, 80, 1),
              child: ListView(children: [
                InputWidgetCustom(
                    controller: pegawai.namaPegawai..text = widget.nama,
                    hintfield: "Masukkan Nama Pegawai",
                    iconField: Icon(Icons.person),
                    judulField: "Nama",
                    terlihat: false),
                InputWidgetCustom(
                    controller: pegawai.pangkatPegawai..text = widget.pangkat,
                    hintfield: "Masukkan Pangkat Pegawai",
                    iconField: Icon(Icons.work),
                    judulField: "Pangkat",
                    terlihat: false),
                InputWidgetCustom(
                    controller: pegawai.tempatLahirPegawai
                      ..text = widget.tempatLahir,
                    hintfield: "Masukkan Tempat Lahir Pegawai",
                    iconField: Icon(Icons.place),
                    judulField: "Tempat Lahir",
                    terlihat: false),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Golongan Pegawai",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Consumer<EditPegawaiState>(
                          builder: (context, pegawai, child) {
                            return Center(
                              child: DropdownButton<String>(
                                  menuMaxHeight:
                                      MediaQuery.of(context).size.height * 0.2,
                                  value: pegawai.selectedGolongan =
                                      widget.golongan,
                                  onChanged: (value) {
                                    pegawai.setDropDownPegawai(value);
                                  },
                                  items: pegawai.listGolonganKaryawan
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList()),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Ijazah Terakhir",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Consumer<EditPegawaiState>(
                          builder: (context, pegawai, child) {
                            return Center(
                              child: DropdownButton<String>(
                                  menuMaxHeight:
                                      MediaQuery.of(context).size.height * 0.2,
                                  value: pegawai.selectedIjazah = widget.ijazah,
                                  onChanged: (value) {
                                    pegawai.setDropDownIjazah(value);
                                  },
                                  items: pegawai.ijazahTerakhir
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList()),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              "Tanggal Lahir",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Consumer<EditPegawaiState>(
                            builder: (context, pegawai, child) =>
                                DateTimeFormField(
                              initialDate: DateTime.parse(widget.tanggalLahir),
                              dateFormat: DateFormat('yyyy-MM-dd'),
                              onSaved: (newValue) {
                                pegawai.setTanggal(
                                  pegawai.tmGolongan = newValue!, newValue);
                              },
                              use24hFormat: true,
                              onDateSelected: (value) {
                                pegawai.setTanggal(
                                    pegawai.tanggalLahir = value, value);
                              },
                              dateTextStyle:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              mode: DateTimeFieldPickerMode.date,
                              decoration: InputDecoration(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              "TMT-PNS",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Consumer<TambahPegawaState>(
                            builder: (context, pegawai, child) =>
                                DateTimeFormField(
                              initialDate: DateTime.parse(widget.tmtPNS),
                              dateFormat: DateFormat('yyyy-MM-dd'),
                              use24hFormat: true,
                              onSaved: (newValue) {
                                pegawai.setTanggal(
                                pegawai.tmtPns = newValue!, newValue);
                              },
                              onDateSelected: (value) {
                                pegawai.setTanggal(
                                    pegawai.tmtPns = value, value);
                              },
                              dateTextStyle:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              mode: DateTimeFieldPickerMode.date,
                              decoration: InputDecoration(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              "TMT-Golongan",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Consumer<TambahPegawaState>(
                            builder: (context, pegawai, child) =>
                                DateTimeFormField(
                              initialDate: DateTime.parse(widget.tmtGolongan),
                              dateFormat: DateFormat('yyyy-MM-dd'),
                              use24hFormat: true,
                              onSaved: (newValue) {
                                pegawai.setTanggal(
                                 pegawai.tmGolongan = newValue!, newValue);
                              },
                              onDateSelected: (value) {
                                pegawai.setTanggal(
                                    pegawai.tmGolongan = value, value);
                              },
                              dateTextStyle:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              mode: DateTimeFieldPickerMode.date,
                              decoration: InputDecoration(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                NestedListKeahlihanWidget(keahlihan: widget.keahlihan),
                NestedListSifatWidget(sifat: widget.sifat),
                NestedListDiklatWidget(diklat: widget.diklat),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.amber,
                      child: ElevatedButton(
                          onPressed: () {
                            pegawai
                                .updatePegawai(widget.id, widget.sifat,
                                    widget.keahlihan, widget.diklat)
                                .then((value) {
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Update Data")),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}
