import 'package:baja_besi/View/Page/HomePage.dart';
import 'package:flutter/material.dart';

import '../Widget/InputWidgetCustom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 55, 80, 1),
        appBar: null,
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Text(
                  "Selamat Datang",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('assets/bps.png'))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    InputWidgetCustom(
                      controller: TextEditingController(),
                      hintfield: "Masukkan Email yang sudah terdaftar",
                      iconField: Icon(Icons.email),
                      judulField: "Email",
                      terlihat: false,
                    ),
                    InputWidgetCustom(
                      controller: TextEditingController(),
                      hintfield: "Masukkan Password",
                      iconField: Icon(Icons.password),
                      judulField: "Password",
                      terlihat: true,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(120, 150, 186, 1))),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 25),
                          ));
                    }
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
