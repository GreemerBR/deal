import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Deal",
      home: FilterPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Filtro",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        "Localização",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Santa Catarina",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            "Localização",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Santa Catarina",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
