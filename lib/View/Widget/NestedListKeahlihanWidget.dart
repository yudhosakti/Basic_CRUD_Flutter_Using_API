import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/PegawaiModel.dart';
import '../../ViewModel/EditPegawaiState.dart';
class NestedListKeahlihanWidget extends StatelessWidget {
  const NestedListKeahlihanWidget({
    super.key,
    required this.keahlihan,
  });

  final List<KeahlianPegawai> keahlihan;

  @override
  Widget build(BuildContext context) {
    return Consumer<EditPegawaiState>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: [
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height:
                          MediaQuery.of(context).size.height * 0.05,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:
                                MediaQuery.of(context).size.width *
                                    0.22,
                            height:
                                MediaQuery.of(context).size.height *
                                    0.05,
                            child: ElevatedButton(
                                onPressed: () {
                                  value.decrementIndexList(value.indexKeahlihan);
                                },
                                child: Text("Previous")),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width *
                                    0.35,
                            height:
                                MediaQuery.of(context).size.height *
                                    0.05,
                            child: Center(
                              child: Text(
                                "Keahlihan Pegawai",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width *
                                    0.22,
                            height:
                                MediaQuery.of(context).size.height *
                                    0.05,
                            child: ElevatedButton(
                                onPressed: () {
                                  value.IncrementIndexList(
                                      keahlihan,value.indexKeahlihan);
                                },
                                child: Text("Next")),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:
                        MediaQuery.of(context).size.height * 0.12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        curve: Curves.bounceIn,
                        duration: Duration(seconds: 1),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height *
                            0.1,
                        child: TextField(
                          controller: value.keahlihanedit
                            ..text =
                                keahlihan[value.indexKeahlihan].keahlian,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Masukkan Sifat anda",
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(12))),
                        ),
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
