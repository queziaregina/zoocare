import 'package:flutter/material.dart';

class MiniGames extends StatelessWidget {
  final String petName;

  const MiniGames({super.key, required this.petName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minijogos - $petName'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/seta 3.png'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text('ZOOWCARE', style: TextStyle(color: Colors.yellow, fontSize: 24)),
                  Row(
                    children: <Widget>[
                      Text('\$ 1000', style: TextStyle(color: Colors.yellow, fontSize: 18)),
                      const SizedBox(width: 10),
                      Text('NÍVEL 1', style: TextStyle(color: Colors.yellow, fontSize: 18)),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: Image.asset('assets/configurações.png'),
                        onPressed: () {
                          // Ação do botão de configurações
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildGameButton(context, 'assets/car.png', 'Jogo do Carro'),
              const SizedBox(height: 10),
              _buildGameButton(context, 'assets/raspberry.png', 'Jogo da Fruta'),
              const SizedBox(height: 10),
              _buildGameButton(context, 'assets/ABC.png', 'Jogo ABC'),
              const SizedBox(height: 10),
              _buildGameButton(context, 'assets/color mode.png', 'Jogo de Cores'),
              const SizedBox(height: 10),
              _buildGameButton(context, 'assets/flashcards.png', 'Jogo de Flashcards'),
              const SizedBox(height: 10),
              _buildGameButton(context, 'assets/puzzle.png', 'Jogo de Puzzle'),
              const SizedBox(height: 10),
              _buildGameButton(context, 'assets/knight.png', 'Jogo de Cavaleiro'),
              const SizedBox(height: 10),
              _buildGameButton(context, 'assets/dice six.png', 'Jogo de Dados'),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.purple[100],
    );
  }

  Widget _buildGameButton(BuildContext context, String imagePath, String gameName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameScreen(gameName: gameName),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(20),
        minimumSize: const Size(150, 150),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            height: 80,
          ),
          const SizedBox(height: 5),
          Text(
            gameName,
            style: const TextStyle(
              fontFamily: 'Super Bubble',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  final String gameName;

  const GameScreen({super.key, required this.gameName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameName),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Conteúdo do $gameName',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
