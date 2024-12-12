import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  const SonucEkrani({super.key});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
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
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Image.asset("resimler/emogy.png",width: 150,height: 150,),
              ),
            ),
            Expanded(child: Text("Kazandınız",style: TextStyle(color: Colors.grey,fontSize: 40),)),
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
