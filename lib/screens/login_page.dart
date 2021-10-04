import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xd_news_page/controllers/authController.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:xd_news_page/screens/create_account_page.dart';
import 'package:xd_news_page/screens/home_page.dart';
import 'home_page.dart';

class Login extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  'Welcome',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Back.',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Sign in with Twitter'),
                  icon: Icon(EvaIcons.twitter),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 115, vertical: 15),
                    primary: Colors.blue[300],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Sign in with Facebook'),
                  icon: Icon(EvaIcons.facebook),
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 105, vertical: 15),
                      primary: Colors.blue[900]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: _email,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                  obscureText: false,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: _password,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                  obscureText: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(Create_Account());
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () async {
                    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                      var user = await logIn(_email.text, _password.text);
                      Get.to(Home_Page());
                    } else {
                      print("Please enter Fields");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue[300],
                      padding:
                          EdgeInsets.symmetric(horizontal: 165, vertical: 20)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    child:
                        Text('Sign Up', style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      Get.to(Create_Account());
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
