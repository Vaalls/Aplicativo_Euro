import 'package:flutter/material.dart';
import 'package:projeto_sprint/menu/botaos.dart';
import 'package:projeto_sprint/menu/login_form.dart';
import 'package:projeto_sprint/menu/logo.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoWidget(),
                SizedBox(height: 40),
                LoginForm(),
                SizedBox(height: 20),
                SocialMediaButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
