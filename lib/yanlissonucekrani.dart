import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/oyunekrani.dart';

class YanlisSonucEkrani extends StatefulWidget {
  int randomSayi;

  YanlisSonucEkrani({required this.randomSayi});

  @override
  State<YanlisSonucEkrani> createState() => _YanlisSonucEkraniState();
}

class _YanlisSonucEkraniState extends State<YanlisSonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sonuç Ekranı"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 25,
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Image.asset("resimler/emogy.png",width: 150,height: 150,),
              ),
            ),
            Expanded(flex:25,child: Text("Kaybettiniz",style: TextStyle(color: Colors.grey,fontSize: 40),)),
            Expanded(flex:25,child: Text("Doğru cevap: ${widget.randomSayi}")),
            Padding(
              padding: EdgeInsets.only(bottom: 100.0),
              child: ElevatedButton(
                child: Text("TEKRAR DENE"),
                onPressed: (){
                  Navigator.of(context).popUntil((route) => route.isFirst);

                },
              ),
            ),
            



          ],
        ),
      ),
    );
  }
}
