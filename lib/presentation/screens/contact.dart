import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  static const String routeName = "/contact";

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232323),
      appBar: AppBar(
        centerTitle: true,
        title: const Image(
          image: AssetImage("assets/images/leafybw.png"),
        ),
        backgroundColor: const Color(0xFF232323),
      ),

//
// BODY ------------------------------------------------------------------------
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              // TextFields Containers -------------------------------------------------------
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        "CONTACT US",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),

                    //
                    // Name TextField --------------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 15,
                        child: TextField(
                          style: const TextStyle(fontSize: 20),
                          controller: nameController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Color(0xFF939393),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFEC1B3E), width: 2),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //
                    // Email TextField -------------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Material(
                        elevation: 15,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color(0xFF939393),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFEC1B3E), width: 2),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //
                    // Message TextField -----------------------------------------------------------
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Material(
                        elevation: 15,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          decoration: InputDecoration(
                            hintText: "Your Message",
                            hintStyle: TextStyle(
                              color: Color(0xFF939393),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFEC1B3E), width: 2),
                            ),
                            prefixIcon: Icon(
                              Icons.chat,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //
              // Submit Button ---------------------------------------------------------------
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                width: MediaQuery.of(context).size.width / 1.07,
                height: MediaQuery.of(context).size.width / 7.9,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onTap: () {
                    FocusManager.instance.primaryFocus!.unfocus();
                    // Navigator.of(context).pop();
                    showDialog(
                      useRootNavigator: false,
                      context: context,
                      builder: (ctx) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 4),
                              child: const Icon(
                                Icons.info_outline,
                                size: 25,
                              ),
                            ),
                            const Text(
                              "Error",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        ),
                        content: const Text(
                          "Something went wrong. Try again please.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        actions: [
                          SizedBox(
                            width: MediaQuery.of(ctx).size.width / 1.2,
                            height: MediaQuery.of(ctx).size.width / 10,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  nameController.clear();
                                });
                              },
                              child: const Center(
                                child: Text(
                                  "Okay",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEC1B3E),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        'Send Message',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
