import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:leafy/presentation/bloc/signup_bloc/bloc/sign_up_bloc.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "/signup";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String avatar = "assets/images/avatar1.png";
//
// TextControlllers & selectedBox ------------------------------------------
//
  String? currentSelectedAvatar;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter all fields"),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Image(
            image: AssetImage("assets/images/leafybw.png"),
          ),
          backgroundColor: const Color(0xFF232323),
        ),
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpError) {
              buildErrorLayout();
            }
          },
          builder: (context, state) {
            if (state is SignUpLoading) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //
                    // SignUp Text Header ----------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        "SIGN UP",
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
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      height: MediaQuery.of(context).size.height / 2.3,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.height / 10,
                        child: const CircularProgressIndicator(
                          color: Colors.green,
                          backgroundColor: Colors.grey,
                          strokeWidth: 5,
                        ),
                      ),
                    ),

                    //
                    // Confirm Button --------------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 100),
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.width / 7.5,
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
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //
                    // SignUp Text Header ----------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        "SIGN UP",
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

                    //
                    // TextBoxFields ---------------------------------------------------------------
                    FirstNameTextField(nameController: nameController),
                    EmailTextField(emailController: emailController),
                    PasswordTextField(passwordController: passwordController),

                    //
                    // Avatar ----------------------------------------------------------------------
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 3.5,
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: const Text(
                              "Avatar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              //
                              // Avatar 1 --------------------------------------------------------------------
                              InkWell(
                                onTap: () => setState(
                                  () {
                                    currentSelectedAvatar =
                                        "assets/images/avatar1.png";
                                  },
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: currentSelectedAvatar != null
                                          ? currentSelectedAvatar ==
                                                  "assets/images/avatar1.png"
                                              ? Colors.green
                                              : Colors.transparent
                                          : Colors.green,
                                      width: 4,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.width / 17,
                                    backgroundImage: const AssetImage(
                                        "assets/images/avatar1.png"),
                                  ),
                                ),
                              ),

                              //
                              // Avatar 2 --------------------------------------------------------------------
                              InkWell(
                                onTap: () => setState(
                                  () {
                                    currentSelectedAvatar =
                                        "assets/images/avatar2.png";
                                  },
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: currentSelectedAvatar != null
                                          ? currentSelectedAvatar ==
                                                  "assets/images/avatar2.png"
                                              ? Colors.green
                                              : Colors.transparent
                                          : Colors.transparent,
                                      width: 4,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.width / 17,
                                    backgroundImage: const AssetImage(
                                        "assets/images/avatar2.png"),
                                  ),
                                ),
                              ),

                              //
                              // Avatar 3 --------------------------------------------------------------------
                              InkWell(
                                onTap: () => setState(
                                  () {
                                    currentSelectedAvatar =
                                        "assets/images/avatar3.png";
                                  },
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: currentSelectedAvatar != null
                                          ? currentSelectedAvatar ==
                                                  "assets/images/avatar3.png"
                                              ? Colors.green
                                              : Colors.transparent
                                          : Colors.transparent,
                                      width: 4,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.width / 17,
                                    backgroundImage: const AssetImage(
                                        "assets/images/avatar3.png"),
                                  ),
                                ),
                              ),

                              //
                              // Avatar 4 --------------------------------------------------------------------
                              InkWell(
                                onTap: () => setState(
                                  () {
                                    currentSelectedAvatar =
                                        "assets/images/avatar4.png";
                                  },
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: currentSelectedAvatar != null
                                          ? currentSelectedAvatar ==
                                                  "assets/images/avatar4.png"
                                              ? Colors.green
                                              : Colors.transparent
                                          : Colors.transparent,
                                      width: 4,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.width / 17,
                                    backgroundImage: const AssetImage(
                                        "assets/images/avatar4.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //
                    // Confirm Button --------------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.width / 7.5,
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onTap: () async {
                          BlocProvider.of<SignUpBloc>(context).add(SignUpInput(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            currentSelectedAvatar!,
                            context,
                          ));
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red),
                          child: const Center(
                            child: Text(
                              'Confirm',
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
              );
            }
          },
        ),
      ),
    );
  }
}

class FirstNameTextField extends StatelessWidget {
  const FirstNameTextField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
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
              "First Name",
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
              controller: nameController,
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Enter your first name',
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

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
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
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 15,
            child: TextFormField(
              style: const TextStyle(fontSize: 20),
              controller: widget.passwordController,
              textInputAction: TextInputAction.done,
              obscureText: _obscureText,
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
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                      color: Colors.black,
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Enter your password',
                hintStyle: const TextStyle(
                    color: Color(0xFF939393),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
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
