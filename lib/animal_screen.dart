import 'package:flutter/material.dart';

class AnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final animalAsset = args['animalAsset'];
    final animalName = args['animalName'];

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
                  _buildBottomButton(
                    context,
                    'assets/comida.png',
                    'Comida',
                    '/food',
                    {'animalAsset': animalAsset, 'animalName': animalName},
                  ),
                  _buildBottomButton(
                    context,
                    'assets/limpeza.png',
                    'Banho',
                    '/bath',
                    {'animalAsset': animalAsset, 'animalName': animalName},
                  ),
                  _buildBottomButton(
                    context,
                    'assets/home.png',
                    'Casa',
                    '/geladeira',
                    {'animalAsset': animalAsset, 'animalName': animalName},
                  ),
                  _buildBottomButton(
                    context,
                    'assets/minijogos.png',
                    'Brincar',
                    '/mini_games',
                    {'animalAsset': animalAsset, 'animalName': animalName},
                  ),
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

  Widget _buildBottomButton(BuildContext context, String assetPath, String label, String route, Map arguments) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(assetPath),
          iconSize: 50,
          onPressed: () {
            Navigator.pushNamed(context, route, arguments: arguments);
          },
        ),
        Text(label, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
