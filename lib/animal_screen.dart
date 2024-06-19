import 'package:flutter/material.dart';

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
                  _buildStatusIcon('assets/configuracoes.png', ''),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomButton('assets/comida.png', 'Comida'),
                  _buildBottomButton('assets/limpeza.png', 'Banho'),
                  _buildBottomButton('assets/home.png', 'Casa'),
                  _buildBottomButton('assets/minijogos.png', 'Brincar'),
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
