//import 'dart:developer';
// import 'dart:html';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import '../const_model/app_colors.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  String url = "https://api-x-robot.future-developers.cloud/api";
  bool loge = false;
  void login(String email, password) async {
    try {
      Response response = await post(Uri.parse('$url/auth/login'),
          body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        setState(() {
          loge = true;
          log("Acc corect Now");
          Navigator.of(context).pushNamed("Home");
          print(response.body);
        });
      } else {
        setState(() {
          loge = false;
          Navigator.of(context).pushNamed("video");
        });
      }
    } catch (e) {
      print(e);
    }
  }

  final amar = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: amar,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // image
                  // Image.asset(
                  //     "images/logo.png",
                  //     height: 150,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  //title
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
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
                          controller: _emailController,
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
                          controller: _passwordController,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: loge == true
                        ? const CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                if (!amar.currentState!.validate()) {
                                  return;
                                } else {
                                  amar.currentState!.save();
                                  loge = false;
                                  login(_emailController.text.toString(),
                                      _passwordController.text.toString());
                                }
                              });
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
                                "Login",
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
                      const Text("Dont Have An Acc..? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("signup");
                        },
                        child: const Text(
                          "SignUp",
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
      ),
    );
  }
}
