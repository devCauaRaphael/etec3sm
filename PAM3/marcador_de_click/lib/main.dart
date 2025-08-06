import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
   MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int numeroClicks = 0;

  void contar(){
    setState(() {
       numeroClicks++;
       if(numeroClicks == 30)
       {
        numeroClicks = 0;
       }
    });
    print("numero de clicks: $numeroClicks");
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('Número de clicks: $numeroClicks!'),
              ElevatedButton(onPressed: null, child: Text("exemplo"))
            ],
          ),
        ),
       appBar: AppBar(backgroundColor: Colors.blue, 
       title: Text("Meu contador de clicks"), 
        leading: Icon(Icons.ads_click),
       ),
       floatingActionButton: FloatingActionButton(onPressed:() => contar(), child:Image.network("https://tse1.mm.bing.net/th/id/OIP.pgz6bRyVrwv4flQlWPpZ-AHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3") ,) , 


       ),

      );
  }
}   
