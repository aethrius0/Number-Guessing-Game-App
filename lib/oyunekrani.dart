import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/sonucekrani.dart';
import 'package:sayi_tahmin_uygulamasi/yanlissonucekrani.dart';


class OyunEkrani extends StatefulWidget {
  int randomSayi;

  OyunEkrani({required this.randomSayi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {

  int kalanHak = 5;
  var tfController = TextEditingController();

  int? tahminEdilenDeger;
  String yazi ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 75.0),
                child: Text("Kalan Hak: $kalanHak",style: TextStyle(color: Colors.pinkAccent,fontSize: 30),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text("0 ile 20 arasında bir sayı tahmin etmeye çalış..",style: TextStyle(color: Colors.grey,fontSize: 15)),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Yardım: ",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("$yazi",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            
            
            
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),
                child: TextField(
                  controller: tfController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Yazınız...",
                    labelText: "Tahmin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    )
              
                  ),
              
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 150.0),
              child: ElevatedButton(
                child: Text("TAHMİN ET",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),

                onPressed: (){
                  setState(() {

                    tahminEdilenDeger = int.parse(tfController.text);
                    if (tahminEdilenDeger != null) {
                      if (widget.randomSayi < tahminEdilenDeger!) {
                        yazi = "Tahmini Azalt";
                        kalanHak-=1;
                        print("Hakkınız 1 azaldı");
                      }
                      else if (widget.randomSayi > tahminEdilenDeger!) {
                        yazi = "Tahmini Arttır";
                        kalanHak-=1;
                        print("Hakkınız 1 azaldı");
                      }
                      else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SonucEkrani()));
                        print("Doğru cevap: ${widget.randomSayi}");


                      }
                    }


                    if(kalanHak==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => YanlisSonucEkrani(randomSayi: widget.randomSayi)));
                      print("Doğru cevap: ${widget.randomSayi}");
                    }


                  });


                },
              ),
            ),


          ],
        ),
      ),

    );
  }
}
