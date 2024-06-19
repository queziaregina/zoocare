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
        leading: IconButton(
          icon: Image.asset('assets/seta_icon.png'),
          onPressed: () {
            // Implement back button action
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAnimalButton(context, 'assets/panda.png', PandaScreen()),
              _buildAnimalButton(context, 'assets/raposa.png', RaposaScreen()),
              _buildAnimalButton(context, 'assets/tartaruga.png', TartarugaScreen()),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightGreen[100],
    );
  }

  Widget _buildAnimalButton(BuildContext context, String assetPath, Widget screen) {
    return IconButton(
      icon: Image.asset(assetPath),
      iconSize: 100,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class PandaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimalScreen(
      animalAsset: 'assets/panda.png',
      title: 'Panda',
    );
  }
}

class RaposaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimalScreen(
      animalAsset: 'assets/raposa.png',
      title: 'Raposa',
    );
  }
}

class TartarugaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimalScreen(
      animalAsset: 'assets/tartaruga.png',
      title: 'Tartaruga',
    );
  }
}

class FoodScreen extends StatelessWidget {
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusIcon('assets/moedas.png', '2,000'),
                  _buildStatusIcon('assets/nivel.png', 'Nível 1'),
                  _buildStatusIcon('assets/configuracoes.png', 'Configurações'),
                ],
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Tela de Alimentos',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomButton('assets/fridge.png', 'Fridge'), // Icone 'Fridge'
                  _buildBottomButton('assets/papaya.png', 'Papaya'), // Icone 'Papaya'
                  _buildBottomButton('assets/shop.png', 'Shop'), // Icone 'Shop'
                ],
              ),
            ],
          ),
        ),
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

  Widget _buildBottomButton(String assetPath, String label) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(assetPath),
          iconSize: 50,
          onPressed: () {
            // Implement button action
          },
        ),
        Text(label, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class AnimalScreen extends StatelessWidget {
  final String animalAsset;
  final String title;

  AnimalScreen({required this.animalAsset, required this.title});

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusIcon('assets/moedas.png', '2,000'),
                  _buildStatusIcon('assets/nivel.png', 'Nível 1'),
                  _buildStatusIcon('assets/configuracoes.png', 'Configurações'),
                ],
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    animalAsset,
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
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
