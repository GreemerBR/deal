import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
        title: "Chat", home: ChatBox(), debugShowCheckedModeBanner: false),
  );
}

class ChatBox extends StatelessWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text("Chats",
              style: TextStyle(
                fontSize: 30,
              )),
        ),
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assets/images/chatzinho.png),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Você não tem chats ativos",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 196, 196, 196),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Que tal buscarmos novas oportunidades?",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 196, 196, 196),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
