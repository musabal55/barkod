import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import './barcode.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Barcode(),
  ));
}


class Barcode extends StatefulWidget {
  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  String? qrKod;

  Future<void> fetchQR()async {
    var kod = await scanQR();
    setState(() {
      qrKod = kod;
    });
  }

  @override

  void initState(){
    fetchQR();
    super.initState();
  }

  Widget build(BuildContext context) {
    return
      MaterialApp(
        home :Scaffold(
        appBar: AppBar(
          title: Text("BARKOD UYGULAMASI"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(           // barkod okuma kodları buraya
                onPressed:(){
                  scanQR();

                },
                child: Text("Barkod okut"),
                color: Colors.grey[400],
              ),
              //scanQR() != "" ? print("dolu") : print("boş");
              Text(qrKod==null?"bekle":qrKod.toString()),            // barkoddan dönen değer buraya

            ],
          ),
        ),
    ),
      );
  }
}

// kaynak
// https://zahidtekbas.com.tr/2021/01/03/flutter-future-nedir-nasil-kullanilir/