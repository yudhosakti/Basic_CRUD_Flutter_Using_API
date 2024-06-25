import 'package:flutter/material.dart';


class SplashScrennPage extends StatelessWidget {
  const SplashScrennPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(41, 55, 80, 1) ,
        appBar: null,
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Center(
                          child: Text("Badan Pusat Statistik",style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                          ),),
                        ),
                      ),
                      Expanded(child: Container(
                        child: Text("Kabupaten Pacitan",style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                        ),),
                      ))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/bps.png'))
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: Center(
                          child: Text("Sistem Informasi",style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                          ),),
                        ),
                      ),
                      Expanded(child: Container(
                        child: Center(
                          child: Text("Pegawai",style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                          ),),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}