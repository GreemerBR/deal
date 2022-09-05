import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_button/sign_button.dart';

import '../../core/app_assets.dart';
import '../register/register_page.dart';
import 'widgets/default_title.dart';
import 'widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 66, 191),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 35),
              DefaultTitle(
                title: 'Já possui conta?',
                subtitle: 'Entre agora mesmo',
                colortitle: Colors.white,
                colorSubtitle: Colors.white,
              ),
              // ProfileAvatar(),
              SizedBox(height: 10),
              Lottie.asset(
                loginAnimation,
                repeat: false,
                width: 120,
                height: 120,
                fit: BoxFit.fill,
              ),
              LoginWidget(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.white,
                      thickness: 3,
                    )),
                    Text(
                      "  ou  ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SignInButton.mini(
                      buttonType: ButtonType.mail,
                      btnColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Register();
                            },
                          ),
                        );
                      },
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.google,
                      btnColor: Colors.white,
                      onPressed: () {},
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.apple,
                      btnColor: Colors.white,
                      onPressed: () {},
                    ),
                    SignInButton.mini(
                      buttonType: ButtonType.facebook,
                      btnColor: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              )

              // GoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
