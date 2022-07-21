import 'package:flutter/material.dart';

import '../../core/app_assets.dart';

class AboutDealPage extends StatelessWidget {
  const AboutDealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(imgBackgroundAbout, fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 250,
                  child: Image.asset(
                    imgLogoApp,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                'Deal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width - 75,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 66, 191),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'A Deal foi fundada em 2022',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
