import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/oyunekrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tahmin Uygulaması'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text("Tahmin Oyunu",style: TextStyle(color: Colors.grey,fontSize: 30,fontWeight: FontWeight.bold),),
            ),

            Expanded(child: Image.asset("resimler/zar.png",width: 150,height: 150,)),
            
            Padding(
              padding:  EdgeInsets.only(bottom:100.0),
              child: ElevatedButton(
                child: Text("OYUNA BAŞLA"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OyunEkrani(randomSayi: Random().nextInt(20))));
                },
              ),
            ),





          ],
        ),
      ),

    );
  }
}
