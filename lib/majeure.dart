import 'package:flutter/material.dart';
import 'package:newquizaip/Quizz.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  String selectedOption1 = "Choisissez la spécialité";
  String selectedOption2 = "Choisissez la majeure";
  String selectedOption3 = "Choisissez le niveau de difficulté";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menus"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  _showOptionsDialog(context, "Choisissez la spécialité", [
                    "Informatique et Réseaux",
                  ]);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  height: 100,
                  width: 200,
                  child: Center(
                    child: Text(
                      selectedOption1,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  _showOptionsDialog(context, "Choisissez la majeure", [
                    "Cybersécurité",
                    "BigData",
                  ]);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  height: 100,
                  width: 200,
                  child: Center(
                    child: Text(
                      selectedOption2,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  _showOptionsDialog(context, "Choisissez le niveau de difficulté", [
                    "Débutant",
                    "Intermédiaire",
                    "Expérimenté",
                  ]);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  height: 100,
                  width: 200,
                  child: Center(
                    child: Text(
                      selectedOption3,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Ajout du bouton "Jouer !"
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  _navigateToQuizPage(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  height: 100,
                  width: 200,
                  child: const Center(
                    child: Text(
                      "Jouer !",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, String menu, List<String> options) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(menu),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < options.length; i++)
                ListTile(
                  title: Text(options[i]),
                  onTap: () {
                    setState(() {
                      if (menu == "Choisissez la spécialité") {
                        selectedOption1 = options[i];
                      } else if (menu == "Choisissez la majeure") {
                        selectedOption2 = options[i];
                      } else if (menu == "Choisissez le niveau de difficulté") {
                        selectedOption3 = options[i];
                      }
                    });
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  // Ajout de la méthode _navigateToQuizzPage(context)
  void _navigateToQuizPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Quiz()),
    );
  }
}