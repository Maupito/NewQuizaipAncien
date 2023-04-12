import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:newquizaip/JoinRoom.dart';
import 'package:newquizaip/WaitingRoom.dart';

class MultijoueursPage extends StatelessWidget {
  const MultijoueursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                String code = randomAlphaNumeric(6);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WaitingRoom(host: true, code: code, numberOfParticipants: 1,)),
                );
              },
              child: const Text('Créer une salle'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JoinRoom()),
                );
              },
              child: const Text('Rejoindre une salle'),
            ),
          ],
        ),
      ),
    );
  }
}