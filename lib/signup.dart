import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../const_model/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  // var url = "https://api-x-robot.future-developers.cloud/api/auth/regester";
  // bool loge = false;
  Future<void> regesterwithemail() async {
    try {
      var url = Uri.parse(
          "https://api-x-robot.future-developers.cloud/api/auth/regester");
      var headers = {"content-type": "appliction/json"};
      // http.Response response = await http.post(
      //   Uri.parse(url),
      // );
      Map body = {
        "name": _nameController.text,
        "email": _emailController.text.trim(),
        "password": _passwordController.text,
        "phone": _phoneController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json["code"] == 0) {
          var token = json["date"]["token"];
          log(token);
          final SharedPreferences prefs = await _pref;
          await prefs.setString('token', token);
          _nameController.clear();
          _emailController.clear();
          _passwordController.clear();
          _phoneController.clear();
          // Get.off( Homescreen());
          Navigator.of(context).pushNamed("Home");
        } else {
          throw jsonDecode(response.body)["massage"] ?? "unknown error occured";
        }
      } else {
        throw jsonDecode(response.body)["massage"] ?? "unknown error occured";
      }
    } catch (e) {}
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// final amar = GlobalKey<FormState>();
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              //title
              const Text(
                "SignUp",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
          
              const SizedBox(
                height: 50,
              ),
          
              // First Name Text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _SignUpPageState()._nameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Name"),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
          
              const SizedBox(
                height: 10,
              ),
              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _SignUpPageState()._emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Email"),
                      ),
                    ),
                  ),
                ),
              ),
          
              const SizedBox(
                height: 10,
              ),
              //PassWord
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _SignUpPageState()._passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Password"),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //Confirm Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _SignUpPageState()._phoneController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("phone number"),
                      ),
                    ),
                  ),
                ),
              ),
          
              const SizedBox(
                height: 25,
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed("CarControl");
                    _SignUpPageState().regesterwithemail();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.color2,
                            AppColors.color1,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                        child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                  ),
                ),
              ),
          
              const SizedBox(
                height: 25,
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have An Acc..? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("LogIn");
                    },
                    child: const Text(
                      "LogIn",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
