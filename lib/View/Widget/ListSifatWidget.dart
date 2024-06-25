import 'package:baja_besi/Model/PegawaiModel.dart';
import 'package:flutter/material.dart';



class ListSifatWidget extends StatelessWidget {
  final String namaField;
  final List<SifatPegawai> sifat;
  const ListSifatWidget({
    required this.sifat,
    required this.namaField,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        color: Colors.black,
        child: Column(
          children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: Text(
                    namaField,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: sifat.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "${index + 1}. ${sifat[index].sifat}",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}