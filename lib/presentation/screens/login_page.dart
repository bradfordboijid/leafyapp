import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:leafy/presentation/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:leafy/presentation/screens/contact.dart';

import 'package:leafy/presentation/screens/sign_up_page.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
//
// SNACKBAR FOR EMPTY TEXTFIELDS -----------------------------------------------
//
  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter both email/password"),
        ),
      );

//
// TextControllers ------------------------------------------------------------
//
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Image(
            image: AssetImage("assets/images/leafybw.png"),
          ),
          backgroundColor: const Color(0xFF232323),
        ),

//
// BODY ------------------------------------------------------------------------
// BlockBuilder ----------------------------------------------------------------
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              buildErrorLayout();
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return buildLoadingScreen(context);
            } else {
              return buildInitialScreen(context);
            }
          },
        ),
      ),
    );
  }

  SingleChildScrollView buildInitialScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//
// Login -----------------------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 18,
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(10, 10),
                          blurRadius: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),

//
// User Inputs -----------------------------------------------------------------
          buildEmailInput(),
          buildPasswordInput(),

//
// Forgot Password Text Header -------------------------------------------------
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30, top: 4, right: 30),
            child: Row(
              children: [
                const Text(
                  "Forgot your password ?",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Contact.routeName,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue),
                      ),
                    ),
                    child: const Text(
                      "Contact",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Text(
                  " Admin",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),

//
// Login, SignUp Buttons -------------------------------------------------------
          buildButtons(context),
        ],
      ),
    );
  }

  SingleChildScrollView buildLoadingScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//
// Login Header Text------------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 18,
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(10, 10),
                          blurRadius: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(top: 50),
            height: 300,
            width: double.infinity,
            alignment: Alignment.center,
            child: const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.grey,
                strokeWidth: 5,
              ),
            ),
          ),

//
// Buttons ---------------------------------------------------------------------
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 50,
                    ),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 12,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onTap: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 20,
                    ),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                    ),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onTap: () {},
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Column buildButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 110,
              ),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 12,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  BlocProvider.of<LoginBloc>(context).add(LoginInput(
                      emailController.text, passwordController.text, context));
                  if (emailController.text != "" &&
                      passwordController.text != "") {
                    setState(() {
                      emailController.clear();
                      passwordController.clear();
                    });
                  }
                },
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red),
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
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
              ),
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onTap: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                  Navigator.pushNamed(context, SignUp.routeName);
                },
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding buildPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: const Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 15,
                child: TextFormField(
                  style: const TextStyle(fontSize: 20),
                  controller: passwordController,
                  obscureText: _obscureText,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 3),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                          color: Colors.black,
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(
                      color: Color(0xFF939393),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFE8E8E8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildEmailInput() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: const Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 15,
            child: TextFormField(
              style: const TextStyle(fontSize: 20),
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black, width: 3),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Enter your email',
                hintStyle: const TextStyle(
                  color: Color(0xFF939393),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                filled: true,
                fillColor: const Color(0xFFE8E8E8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
