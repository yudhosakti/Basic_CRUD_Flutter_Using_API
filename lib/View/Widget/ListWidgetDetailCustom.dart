import 'package:flutter/material.dart';

import '../../Model/PegawaiModel.dart';

class ListWidgetDetailCustom extends StatelessWidget {
  final String namaField;
  final List<KeahlianPegawai> keahlihan;
  const ListWidgetDetailCustom({
    required this.keahlihan,
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
              itemCount: keahlihan.length,
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
                            "${index + 1}. ${keahlihan[index].keahlian}",
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
