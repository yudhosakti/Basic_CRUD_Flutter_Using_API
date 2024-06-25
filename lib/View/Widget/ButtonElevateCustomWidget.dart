import 'package:flutter/material.dart';

class ButtonElevateCustomWidget extends StatelessWidget {
  final Icon iconButton;
  final Color warna;
  final Widget widgetMove;
  const ButtonElevateCustomWidget({
    required this.widgetMove,
    required this.iconButton,
    required this.warna,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.19,
      height: MediaQuery.of(context).size.height * 0.13,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.13,
          height: MediaQuery.of(context).size.height * 0.08,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(warna),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return widgetMove;
                      },
                    ));
              },
              child: iconButton),
        ),
      ),
    );
  }
}
