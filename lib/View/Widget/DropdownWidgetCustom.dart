import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/TambahPegawaiState.dart';

class DropdownWidgetCustom extends StatelessWidget {
  const DropdownWidgetCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Consumer<TambahPegawaState>(
              builder: (context, pegawai, child) {
                return Center(
                  child: DropdownButton<String>(
                      menuMaxHeight: MediaQuery.of(context).size.height * 0.2,
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
    );
  }
}
