import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/image_constants.dart';
import 'package:music_player/view/authentication/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void passwordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final kHeight10 = SizedBox(height: 10);
    final kHeight5 = SizedBox(height: 5);
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ConstantImage.mainLogoPng,
                  height: 200,
                  width: 200,
                ),
                Text(
                  "LogIn",
                  style: TextStyle(
                      color: ConstantColors.themeWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                kHeight10,
                SizedBox(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: TextFormField(
                      style: TextStyle(color: ConstantColors.themeWhiteColor),
                      controller: emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Enter Email",
                          suffixIcon: Icon(
                            Icons.email,
                            color: ConstantColors.themeWhiteColor,
                          ),
                          hintStyle:
                              TextStyle(color: ConstantColors.themeWhiteColor),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                kHeight10,
                SizedBox(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: TextFormField(
                      obscureText: _obscureText,
                      style: TextStyle(color: ConstantColors.themeWhiteColor),
                      controller: passwordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Enter Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              passwordVisibility();
                            },
                            child: _obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(
                                    Icons.visibility,
                                    color: ConstantColors.themeWhiteColor,
                                  ),
                          ),
                          hintStyle:
                              TextStyle(color: ConstantColors.themeWhiteColor),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: ConstantColors.themeWhiteColor,
                              decoration: TextDecoration.underline,
                              decorationColor: ConstantColors.themeWhiteColor),
                        ))
                  ],
                ),
                kHeight10,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          ConstantColors.containerGradient1,
                          ConstantColors.containerGradient2,
                          ConstantColors.containerGradient13
                        ])),
                    child: Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: ConstantColors.themeWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                  ),
                ),
                kHeight10,
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ));
                    },
                    child: Text(
                      "Don't have an Account? Click here to register",
                      style: TextStyle(color: ConstantColors.themeWhiteColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
