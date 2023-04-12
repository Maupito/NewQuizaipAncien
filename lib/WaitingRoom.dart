import 'package:flutter/material.dart';

class WaitingRoom extends StatefulWidget {
  final bool host;
  final String code;
  final int numberOfParticipants;
  const WaitingRoom({Key? key, required this.host, required this.code, required this.numberOfParticipants}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaitingRoomState createState() => _WaitingRoomState();
}
/*
class _WaitingRoomState extends State<WaitingRoom> {
  SocketIO? socketIO;

  @override
  void initState() {
    super.initState();

    if (widget.host) {
      // Si le créateur de la partie est l'hôte
      startServer();
    } else {
      // Si le créateur de la partie n'est pas l'hôte
      connectToServer();
    }
  }

  void startServer() {
    // Créer un serveur socket.io
    socketIO = SocketIOManager().createServerSocket('http://localhost', 3000);
    socketIO?.init();

    // Écouter les événements
    socketIO?.subscribe('quiz', (data) {
      // Traiter les données du quiz
    });
  }

  void connectToServer() {
    // Se connecter au serveur socket.io
    socketIO = SocketIOManager().createSocketIO('http://localhost', 3000);
    socketIO?.init();

    // Écouter les événements
    socketIO?.subscribe('quiz', (data) {
      // Traiter les données du quiz
    });

    // Joindre la salle d'attente
    socketIO?.sendMessage('join_waiting_room', {
      'code': widget.code,
    });
  }

  @override
  void dispose() {
    super.dispose();

    // Fermer la connexion socket.io
    socketIO?.disconnect();
    SocketIOManager().destroySocket(socketIO!);
  }
*/
class _WaitingRoomState extends State<WaitingRoom> {
  String selectedOption1 = "Choisissez la spécialité";
  String selectedOption2 = "Choisissez la majeure";

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Salle d\'attente'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Code de la salle : ${widget.code}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            'Nombre de participants : 1',
            style: const TextStyle(fontSize: 20),
          ),
          GestureDetector(
            onTap: () {
              _showOptionsDialog(context, "Choisissez la majeure", [
                "Cybersécurité",
                "BigData",
                "IoT",
                "Intelligence Artificielle",
                "Transition Numérique",
              ]);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(selectedOption1),
              ),
            ),
          ),
          GestureDetector(
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
              ),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(selectedOption2),
              ),
            ),
          ),
        ],
      ),
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
                    if (menu == "Choisissez la majeure") {
                      selectedOption1 = options[i];
                    } else if (menu == "Choisissez le niveau de difficulté") {
                      selectedOption2 = options[i];
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
}
