import 'package:baja_besi/ViewModel/TambahPegawaiState.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DropdownTanggalCustom extends StatelessWidget {
  final String namaField;
  DateTime waktu;
  DropdownTanggalCustom({
    required this.waktu,
    required this.namaField,
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
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  namaField,
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
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Consumer<TambahPegawaState>(
                builder: (context, pegawai, child) => DateTimeFormField(
                  onSaved: (newValue) {
                    pegawai.setTanggal(waktu, newValue!);
                  },
                  use24hFormat: true,
                  onDateSelected: (value) {
                    pegawai.setTanggal(waktu, value);
                  },
                  dateTextStyle: TextStyle(fontSize: 16, color: Colors.black),
                  mode: DateTimeFieldPickerMode.date,
                  decoration: InputDecoration(),
                ), 
              ),
            ),
          ),
        )
      ],
    );
  }
}
