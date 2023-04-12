import 'package:flutter/material.dart';
import 'package:newquizaip/majeure.dart';
import 'package:newquizaip/Multijoueurs.dart';

class SelectionMenu extends StatelessWidget {
  const SelectionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sélection de mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 200),
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )
              ),
              onPressed: () {
                // TODO: mettre en place la logique de transition vers la page du mode solo

                Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuPrincipal()),
                );
              },
              child: const Text(
                'Mode Solo',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 200),
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )
              ),
              onPressed: () {
                // TODO: mettre en place la logique de transition vers la page du mode solo

                Navigator.push(context, MaterialPageRoute(builder: (context) => const MultijoueursPage()),
                );
              },
              child: const Text(
                'Mode Multijoueur',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}