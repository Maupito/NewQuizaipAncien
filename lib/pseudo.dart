import 'package:flutter/material.dart';
import 'package:newquizaip/mode.dart';

void main() {
  runApp(const quizaiptest());
}

// ignore: camel_case_types
class quizaiptest extends StatelessWidget {
  const quizaiptest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Pseudo(),
    );
  }
}

class Pseudo extends StatefulWidget {
  const Pseudo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PseudoState createState() => _PseudoState();
}

class _PseudoState extends State<Pseudo> {
  final TextEditingController _pseudoController = TextEditingController();

  bool _validatePseudo(String pseudo) {
    if (pseudo.length < 3) {
      return false;
    }
    RegExp regExp = RegExp(r'^[a-zA-Z\d]+$');
    return regExp.hasMatch(pseudo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue !'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Positioned(
              top: 10,
              right: 0,
              child: Image.asset(
                'assets/images/Logo_ESAIP.png',
                width: 358,
                height: 170,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _pseudoController,
                decoration: const InputDecoration(
                  labelText: 'Entrez votre pseudo',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String pseudo = _pseudoController.text;
                if (_validatePseudo(pseudo)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectionMenu(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Pseudo invalide'),
                        content: const Text(
                            'Le pseudo doit contenir au moins 3 caractères et ne doit contenir que des lettres et des chiffres.'),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(180, 80),
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
