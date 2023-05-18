import 'package:flutter/material.dart';
import 'package:leafy/presentation/screens/login_page.dart';
import 'package:leafy/presentation/screens/sign_up_page.dart';

class LandingScreen extends StatelessWidget {
  static const String routeName = "/";
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232323),
      body: SingleChildScrollView(
        child: Column(
          children: [
//
// Image Header (Leafy Fantastic Story) ----------------------------------------
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 1.22,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Vector.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 125),
                      height: MediaQuery.of(context).size.width / 3.5,
                      width: MediaQuery.of(context).size.width / 1.6,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/leafy.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 25,
                      width: MediaQuery.of(context).size.width / 2.5,
                      margin: const EdgeInsets.only(top: 40),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/fantastic_story.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

//
// Text Header & Buttons Column ------------------------------------------------
            Column(
              children: [
//
// Header 1 --------------------------------------------------------------------
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: const Text(
                    "The best place to store your notes",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),

//
// Header 2 --------------------------------------------------------------------
//
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: const Text(
                    "Your notes will be saved to your personal cloud. You can save, delete and update your notes on the go !",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),

//
// Header 3 --------------------------------------------------------------------
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Start by",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        " Signing Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                      Text(
                        " or",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        " Logging In.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),

//
// Buttons ---------------------------------------------------------------------
                const LoginBtn(),
                const SignUpBtn(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 1.15,
      height: MediaQuery.of(context).size.width / 8,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onTap: () {
          Navigator.pushNamed(context, SignUp.routeName);
        },
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(50),
            color: Colors.red,
          ),
          child: const Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      width: MediaQuery.of(context).size.width / 1.15,
      height: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onTap: () {
          Navigator.pushNamed(context, Login.routeName);
        },
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
