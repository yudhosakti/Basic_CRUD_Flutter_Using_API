import 'package:flutter/material.dart';

class InformasiDetailWidgetCustom extends StatelessWidget {
  final String namaField;
  final String valueData;
  const InformasiDetailWidgetCustom({
    required this.namaField,
    required this.valueData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.37,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        namaField,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.53,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        valueData,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
