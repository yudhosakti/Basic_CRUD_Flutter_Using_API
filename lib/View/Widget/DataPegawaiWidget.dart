import 'package:baja_besi/View/Page/DetailPegawaiPage.dart';
import 'package:baja_besi/View/Page/EditPegawaiPage.dart';
import 'package:baja_besi/ViewModel/GetPegawaiState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ButtonElevateCustomWidget.dart';

class DataPegawaiWidget extends StatefulWidget {
  const DataPegawaiWidget({super.key});

  @override
  State<DataPegawaiWidget> createState() => _DataPegawaiWidgetState();
}

class _DataPegawaiWidgetState extends State<DataPegawaiWidget> {
  @override
  void initState() {
    super.initState();
    var pegawai = Provider.of<GetPegawaiFromAPI>(context, listen: false);
    pegawai.tampilKanPegawai();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetPegawaiFromAPI>(
      builder: (context, value, child) {
        return value.isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Container(child: CircularProgressIndicator())],
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder(
                    stream: value.tampilKanPegawai().asStream(),
                    builder: (context, snapshot) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.builder(
                          addAutomaticKeepAlives: false,
                          primary: false,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(6),
                          itemCount: value.list_pegawai.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                borderOnForeground: true,
                                elevation: 5,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return DetailPegawaiPage(
                                                nama: value
                                                    .list_pegawai[index].nama,
                                                diklat: value
                                                    .list_pegawai[index].diklat,
                                                golongan: value
                                                    .list_pegawai[index]
                                                    .golongan,
                                                keahlihan: value
                                                    .list_pegawai[index]
                                                    .keahlian,
                                                pangkat: value
                                                    .list_pegawai[index]
                                                    .pangkat,
                                                sifat: value
                                                    .list_pegawai[index].sifat,
                                                tanggalLahir: value
                                                    .list_pegawai[index]
                                                    .tanggalLahir,
                                                tempatLahir: value
                                                    .list_pegawai[index]
                                                    .tempatLahir,
                                                tmtGolongan: value
                                                    .list_pegawai[index]
                                                    .tmtGolongan,
                                                tmtPNS: value
                                                    .list_pegawai[index].tmtPNS,
                                              );
                                            },
                                          ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/iconprofile.png'),
                                                  fit: BoxFit.fill),
                                              color: Colors.grey,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.255,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    child:
                                                        SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Center(
                                                                child: Text(
                                                              value
                                                                  .list_pegawai[
                                                                      index]
                                                                  .nama,
                                                              style: TextStyle(
                                                                  fontSize: 16),
                                                            ))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.255,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    child:
                                                        SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Center(
                                                                child: Text(
                                                              value
                                                                  .list_pegawai[
                                                                      index]
                                                                  .pangkat,
                                                              style: TextStyle(
                                                                  fontSize: 16),
                                                            ))),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.39,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        child: Row(
                                          children: [
                                            ButtonElevateCustomWidget(
                                              widgetMove: EditPegawaiPage(
                                                id: value.list_pegawai[index].id,
                                                ijazah: value
                                                    .list_pegawai[index].Ijazah,
                                                nama: value
                                                    .list_pegawai[index].nama,
                                                diklat: value
                                                    .list_pegawai[index].diklat,
                                                golongan: value
                                                    .list_pegawai[index]
                                                    .golongan,
                                                keahlihan: value
                                                    .list_pegawai[index]
                                                    .keahlian,
                                                pangkat: value
                                                    .list_pegawai[index]
                                                    .pangkat,
                                                sifat: value
                                                    .list_pegawai[index].sifat,
                                                tanggalLahir: value
                                                    .list_pegawai[index]
                                                    .tanggalLahir,
                                                tempatLahir: value
                                                    .list_pegawai[index]
                                                    .tempatLahir,
                                                tmtGolongan: value
                                                    .list_pegawai[index]
                                                    .tmtGolongan,
                                                tmtPNS: value
                                                    .list_pegawai[index].tmtPNS,
                                              ),
                                              warna: Colors.blue,
                                              iconButton: Icon(Icons.edit),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.13,
                                              child: Center(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.13,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.08,
                                                  child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Colors.red),
                                                          shape: MaterialStatePropertyAll(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)))),
                                                      onPressed: () {
                                                        value.hapusPegawai(value
                                                            .list_pegawai[index]
                                                            .id);
                                                      },
                                                      child:
                                                          Icon(Icons.delete)),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              );
      },
    );
  }
}
