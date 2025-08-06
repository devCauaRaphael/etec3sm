import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int pontosTotais = 0;
  int pontosTotaisEles = 0;
  int partidas = 0;
  int partidasEles = 0;

  void contarUm() {
    setState(() {
      pontosTotais++;
      if (pontosTotais == 12) {
        pontosTotais = 0;
        partidas++;
      }
    });
  }

  void menosUm() {
    setState(() {
      pontosTotais--;
      if (pontosTotais <= 0) {
        pontosTotais = 0;
      }
    });
  }

  void contarTres() {
    setState(() {
      pontosTotais += 3;
      if (pontosTotais >= 12) {
        pontosTotais = 0;
        partidas++;
      }
    });
  }

  void menosTres() {
    setState(() {
      pontosTotais -= 3;
      if (pontosTotais <= 0) {
        pontosTotais = 0;
      }
    });
  }

  void contarUmEles() {
    setState(() {
      pontosTotaisEles++;
      if (pontosTotaisEles >= 12) {
        pontosTotaisEles = 0;
        partidasEles++;
      }
    });
  }

  void menosUmEles() {
    setState(() {
      pontosTotaisEles--;
      if (pontosTotaisEles <= 0) {
        pontosTotaisEles = 0;
      }
    });
  }

  void contarTresEles() {
    setState(() {
      pontosTotaisEles += 3;
      if (pontosTotaisEles >= 12) {
        pontosTotaisEles = 0;
        partidasEles++;
      }
    });
  }

  void menosTresEles() {
    setState(() {
      pontosTotaisEles -= 3;
      if (pontosTotaisEles <= 0) {
        pontosTotaisEles = 0;
      }
    });
  }

  void zerar() {
    setState(() {
      pontosTotais = 0;
      pontosTotaisEles = 0;
    });
  }

  Widget buildTimeCard({
    required String time,
    required int pontos,
    required int partidas,
    required VoidCallback contar1,
    required VoidCallback contar3,
    required VoidCallback menos1,
    required VoidCallback menos3,
  }) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Pontos: $pontos',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              'Partidas vencidas: $partidas',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(onPressed: contar3, child: Text("+3")),
                ElevatedButton(onPressed: contar1, child: Text("+1")),
                ElevatedButton(
                  onPressed: menos1,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("-1"),
                ),
                ElevatedButton(
                  onPressed: menos3,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("-3"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Contador de Pontos"),
          leading: Icon(Icons.sports_score),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              buildTimeCard(
                time: "Nós",
                pontos: pontosTotais,
                partidas: partidas,
                contar1: contarUm,
                contar3: contarTres,
                menos1: menosUm,
                menos3: menosTres,
              ),
              Divider(thickness: 1.5),
              buildTimeCard(
                time: "Eles",
                pontos: pontosTotaisEles,
                partidas: partidasEles,
                contar1: contarUmEles,
                contar3: contarTresEles,
                menos1: menosUmEles,
                menos3: menosTresEles,
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: zerar,
                icon: Icon(Icons.refresh),
                label: Text("Zerar Pontuação"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
