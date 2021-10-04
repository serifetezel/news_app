import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xd_news_page/controllers/authController.dart';
import 'package:xd_news_page/screens/login_page.dart';

class Create_Account extends StatelessWidget {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Account.',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: _name,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  obscureText: false,
                ),
              ),
              SizedBox(
                height: 20,
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
                      hintText: "Create Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                  obscureText: false,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  child: Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () async {
                    if (_name.text.isNotEmpty &&
                        _email.text.isNotEmpty &&
                        _password.text.isNotEmpty) {
                      var user = await createAccount(
                          _name.text, _email.text, _password.text);
                      Get.to(Login());
                    } else {
                      print("Please enter Fields");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue[300],
                      padding:
                          EdgeInsets.symmetric(horizontal: 135, vertical: 20)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    child:
                        Text('Sign In', style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      Get.to(Login());
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
