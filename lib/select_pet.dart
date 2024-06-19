import 'package:flutter/material.dart';
import 'mini_games.dart';

class PetSelection extends StatelessWidget {
  const PetSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fundo.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(height: 20),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Image.asset('assets/seta 3.png'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: const Text(
                  'Escolha seu Pet',
                  style: TextStyle(
                    color: Color(0xFF004303),
                    fontFamily: 'Super Bubble',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              PetButton(
                imagePath: 'assets/raposa.png',
                petName: 'RAPOSA',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MiniGames(petName: 'Raposa'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              PetButton(
                imagePath: 'assets/panda.png',
                petName: 'PANDA',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MiniGames(petName: 'Panda'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              PetButton(
                imagePath: 'assets/tartaruga.png',
                petName: 'TARTARUGA',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MiniGames(petName: 'Tartaruga'),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PetButton extends StatelessWidget {
  final String imagePath;
  final String petName;
  final VoidCallback onPressed;

  const PetButton({
    super.key,
    required this.imagePath,
    required this.petName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
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
              petName,
              style: const TextStyle(
                fontFamily: 'Super Bubble',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
