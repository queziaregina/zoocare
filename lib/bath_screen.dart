import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZooGame',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PetSelectionScreen(),
    );
  }
}

class PetSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo_zoocare.png', height: 60),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimalButton(
                animalAsset: 'assets/panda.png',
                animalName: 'Panda',
              ),
              SizedBox(height: 20),
              AnimalButton(
                animalAsset: 'assets/raposa.png',
                animalName: 'Raposa',
              ),
              SizedBox(height: 20),
              AnimalButton(
                animalAsset: 'assets/tartaruga.png',
                animalName: 'Tartaruga',
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightGreen[100],
    );
  }
}

class AnimalButton extends StatelessWidget {
  final String animalAsset;
  final String animalName;

  AnimalButton({required this.animalAsset, required this.animalName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BathScreen(
              animalAsset: animalAsset,
              title: animalName,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(animalAsset),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(75),
        ),
      ),
    );
  }
}

class BathScreen extends StatelessWidget {
  final String animalAsset;
  final String title;

  BathScreen({required this.animalAsset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo_zoocare.png', height: 60),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/seta_icon.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fundo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusIcon('assets/moedas.png', '2,000'),
                    _buildStatusIcon('assets/nivel.png', 'Nível 1'),
                    _buildStatusIcon('assets/configuracoes.png', ''),
                  ],
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        animalAsset,
                        height: 200,
                      ),
                      Positioned(
                        top: 20,
                        child: Image.asset(
                          'assets/shower.png',
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.lightGreen[100],
    );
  }

  Widget _buildStatusIcon(String assetPath, String text) {
    return Row(
      children: [
        Image.asset(assetPath, height: 24),
        SizedBox(width: 5),
        Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
