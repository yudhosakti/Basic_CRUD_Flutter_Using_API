import 'package:baja_besi/View/Widget/InputWidgetCustom.dart';
import 'package:baja_besi/ViewModel/TambahPegawaiState.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TambahPegawaiWidget extends StatelessWidget {
  const TambahPegawaiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        Consumer<TambahPegawaState>(
          builder: (context, value, child) => InputWidgetCustom(
              controller: value.namaPegawai,
              hintfield: "Masukkan Nama Pegawai",
              iconField: Icon(Icons.person),
              judulField: "Nama",
              terlihat: false),
        ),
        Consumer<TambahPegawaState>(
          builder: (context, value, child) => InputWidgetCustom(
              controller: value.pangkatPegawai,
              hintfield: "Masukkan Pangkat Pegawai",
              iconField: Icon(Icons.work),
              judulField: "Pangkat",
              terlihat: false),
        ),
        Consumer<TambahPegawaState>(
          builder: (context, value, child) => InputWidgetCustom(
              controller: value.tempatLahirPegawai,
              hintfield: "Masukkan Tempat Lahir Pegawai",
              iconField: Icon(Icons.place),
              judulField: "Tempat Lahir",
              terlihat: false),
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
                      "Golongan Pegawai",
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                child: Consumer<TambahPegawaState>(
                  builder: (context, pegawai, child) {
                    return Center(
                      child: DropdownButton<String>(
                          menuMaxHeight:
                              MediaQuery.of(context).size.height * 0.2,
                          value: pegawai.selectedGolongan,
                          onChanged: (value) {
                            pegawai.setDropDownPegawai(value);
                          },
                          items: pegawai.listGolonganKaryawan
                              .map<DropdownMenuItem<String>>((String value) {
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
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                child: Consumer<TambahPegawaState>(
                  builder: (context, pegawai, child) {
                    return Center(
                      child: DropdownButton<String>(
                          menuMaxHeight:
                              MediaQuery.of(context).size.height * 0.2,
                          value: pegawai.selectedIjazah,
                          onChanged: (value) {
                            pegawai.setDropDownIjazah(value);
                          },
                          items: pegawai.ijazahTerakhir
                              .map<DropdownMenuItem<String>>((String value) {
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
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                    builder: (context, pegawai, child) => DateTimeFormField(
                      onSaved: (newValue) {
                        pegawai.setTanggal(
                            pegawai.tanggalLahir = newValue!, newValue);
                      },
                      use24hFormat: true,
                      onDateSelected: (value) {
                        pegawai.setTanggal(pegawai.tanggalLahir = value, value);
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
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                    builder: (context, pegawai, child) => DateTimeFormField(
                      onSaved: (newValue) {
                        pegawai.setTanggal(
                            pegawai.tmtPns = newValue!, newValue);
                      },
                      use24hFormat: true,
                      onDateSelected: (value) {
                        pegawai.setTanggal(pegawai.tmtPns = value, value);
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
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                    builder: (context, pegawai, child) => DateTimeFormField(
                      onSaved: (newValue) {
                        pegawai.setTanggal(
                            pegawai.tmGolongan = newValue!, newValue);
                      },
                      use24hFormat: true,
                      onDateSelected: (value) {
                        pegawai.setTanggal(pegawai.tmGolongan = value, value);
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
        Consumer<TambahPegawaState>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    onPressed: () {
                                      value.decrementJumlahKeahliahan(
                                          value.listKeahlian);
                                    },
                                    child: Text("Kurangi")),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Center(
                                  child: Text(
                                    "Keahlian Pegawai",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    onPressed: () {
                                      value.incrementJumlahKeahlihan(
                                          value.listKeahlian);
                                    },
                                    child: Text("Tambah")),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: value.listKeahlian.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedContainer(
                                  curve: Curves.bounceIn,
                                  duration: Duration(seconds: 1),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: TextField(
                                    controller: value.listKeahlian[index],
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "Masukkan Keahlihan anda",
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Consumer<TambahPegawaState>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    onPressed: () {
                                      value.decrementJumlahKeahliahan(
                                          value.listSifatPegawai);
                                    },
                                    child: Text("Kurangi")),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Center(
                                  child: Text(
                                    "Sifat Pegawai",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    onPressed: () {
                                      value.incrementJumlahKeahlihan(
                                          value.listSifatPegawai);
                                    },
                                    child: Text("Tambah")),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: value.listSifatPegawai.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedContainer(
                                  curve: Curves.bounceIn,
                                  duration: Duration(seconds: 1),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: TextField(
                                    controller: value.listSifatPegawai[index],
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "Masukkan Sifat anda",
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Consumer<TambahPegawaState>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    onPressed: () {
                                      value.decrementJumlahKeahliahan(
                                          value.listDiklatPegawai);
                                    },
                                    child: Text("Kurangi")),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Center(
                                  child: Text(
                                    "Diklat Pegawai",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    onPressed: () {
                                      value.incrementJumlahKeahlihan(
                                          value.listDiklatPegawai);
                                    },
                                    child: Text("Tambah")),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: value.listDiklatPegawai.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedContainer(
                                  curve: Curves.bounceIn,
                                  duration: Duration(seconds: 1),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: TextField(
                                    controller: value.listDiklatPegawai[index],
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "Masukkan Diklat Anda",
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<TambahPegawaState>(
              builder: (context, value, child) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF288AC1))),
                      onPressed: () {
                        value.tambahPegawai();
                      },
                      child: Text(
                        "Tambah Pegawai",
                        style: TextStyle(fontSize: 18),
                      )),
                );
              },
            )
          ],
        )
      ]),
    );
  }
}

class NestedListCustomWidget extends StatelessWidget {
  const NestedListCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TambahPegawaState>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                children: [
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                                onPressed: () {
                                  value.decrementJumlahKeahliahan(
                                      value.listDiklatPegawai);
                                },
                                child: Text("Kurangi")),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                              child: Text(
                                "Keahlian Karyawan",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                                onPressed: () {
                                  value.incrementJumlahKeahlihan(
                                      value.listDiklatPegawai);
                                },
                                child: Text("Tambah")),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: value.listDiklatPegawai.length,
                        itemBuilder: (context, index) {
                          for (var i = 0;
                              i < value.listDiklatPegawai.length;
                              i++) {
                            value.tambahEnable();
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onDoubleTap: () {
                                print("terklik");
                                value.ubahEnable(index);
                              },
                              child: AnimatedContainer(
                                curve: Curves.bounceIn,
                                duration: Duration(seconds: 1),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: TextField(
                                  readOnly: value.enable[index],
                                  controller: value.listDiklatPegawai[index],
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      hintText: "Masukkan Keahlihan anda",
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
