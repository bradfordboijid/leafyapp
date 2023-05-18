import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'package:leafy/core/services/http_service.dart';
import 'package:leafy/domain/entity/auth_entity.dart';
import 'package:leafy/domain/entity/note_entity.dart';
import 'package:leafy/presentation/screens/add_note.dart';
import 'package:leafy/presentation/screens/edit_note.dart';
import 'package:leafy/presentation/screens/landing_screen.dart';
import 'package:leafy/presentation/widgets/note_widget.dart';

class HomePage extends StatefulWidget {
  final AuthData authData;

  static const String routeName = "/homepage";
  const HomePage({
    Key? key,
    required this.authData,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//
// Sample Text for Pinned Note -------------------------------------------------
  Color sampleColor = const Color(0xFF74F8F8);
  String sampleTitle = "Title";
  String sampleBody =
      "This is a sample note. This is a sample note.This is a sample note.This is a sample note.This is a sample ...";

// User pinned note attributes -------------------------------------------------
  String title = "";
  Color? color;
  String body = "";

  List<NoteEntity> notes = [];

  @override
  void initState() {
    notes = widget.authData.notes;
    if (widget.authData.pinnedNoteId != null) {
      NoteEntity pinNote = notes
          .firstWhere((element) => element.id == widget.authData.pinnedNoteId);
      title = pinNote.title;
      body = pinNote.body;
      color = pinNote.color;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232323),
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.authData.avatar),
        ),
        automaticallyImplyLeading: false,
        actions: const [
          LogOutBtn(),
        ],
        centerTitle: true,
        title: const Image(
          image: AssetImage("assets/images/leafybw.png"),
        ),
        backgroundColor: const Color(0xFF232323),
      ),

//
// BODY ------------------------------------------------------------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      HelloText(widget: widget),

//
// New Note Button -------------------------------------------------------------
                      InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onTap: () async {
                          var returnNote = await Navigator.pushNamed(
                            context,
                            AddNote.routeName,
                            arguments: widget.authData,
                          );

                          if (returnNote != null) {
                            setState(() {
                              notes.add(returnNote as NoteEntity);
                            });
                          }
                        },
                        child: const NewNoteButton(),
                      ),
                    ],
                  ),

//
// Pinned Note -----------------------------------------------------------------
                  Container(
                    width: MediaQuery.of(context).size.width / 2.99,
                    height: MediaQuery.of(context).size.width / 2.64,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 18),
                          width: MediaQuery.of(context).size.width / 2.99,
                          height: MediaQuery.of(context).size.width / 2.99,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: color ?? const Color(0xFF74F8F8),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 20,
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 3.5,
                              margin: const EdgeInsets.only(top: 25),
                              child: SingleChildScrollView(
                                child: Text(
                                  title != "" ? title : sampleTitle,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.99,
                              height: MediaQuery.of(context).size.width / 50,
                              child: const Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              height: MediaQuery.of(context).size.width / 5.5,
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: SingleChildScrollView(
                                child: Text(
                                  body != "" ? body : sampleBody,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width / 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                title = sampleTitle;
                                body = sampleBody;
                                color = sampleColor;
                              });
                            },
                            child: const Icon(
                              Icons.remove_circle,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

//
// ListView of notes -----------------------------------------------------------
            notes.isEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/ghost.png",
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 265),
                                  child: const Center(
                                    child: Text(
                                      "Nothing here",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 300),
                                  child: const Center(
                                    child: Text(
                                      "Click \"New Note\" to add some.",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: notes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NoteWidget(
                          navigationCallBack: () async {
                            var returnupdate = await Navigator.pushNamed(
                                context, EditNote.routeName, arguments: {
                              "authData": widget.authData,
                              "entity": notes[index]
                            });

                            if (returnupdate != null) {
                              setState(() {
                                notes = returnupdate as List<NoteEntity>;
                              });
                            }
                          },
                          authData: widget.authData,
                          itemPin: (id) async {
                            Response? response = await HttpService().pinNote(
                              noteid: id,
                              userid: widget.authData.id,
                            );
                            if (response != null) {
                              if (response.statusCode == 200) {
                                setState(() {
                                  title = notes[index].title;
                                  color = notes[index].color;
                                  body = notes[index].body;
                                });
                              } else {
                                debugPrint("Something went wrong");
                              }
                            } else {
                              debugPrint("Error");
                            }
                          },
                          noteEntity: notes[index],
                          callBack: (id) async {
                            Response? response = await HttpService().deleteNote(
                              noteid: id,
                              userid: widget.authData.id,
                            );

                            if (response != null) {
                              if (response.statusCode == 200) {
                                setState(() {
                                  notes.removeWhere(
                                      (element) => element.id == id);
                                });
                              } else {
                                debugPrint("Something went wrong");
                              }
                            } else {
                              debugPrint("Error");
                            }
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 15,
      ),
      child: InkWell(
        onTap: () {
          showDialog(
            useRootNavigator: false,
            context: context,
            builder: (ctx) => AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              title: const Text(
                "Log Out",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              content: const Text(
                "Are you sure you want to log out ?",
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(ctx).size.width / 4,
                      height: MediaQuery.of(ctx).size.width / 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text(
                          "No",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(ctx).size.width / 4,
                      height: MediaQuery.of(ctx).size.width / 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop();

                          Navigator.pushNamed(context, LandingScreen.routeName);
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        child: Row(
          children: const [
            Icon(
              Icons.logout,
              color: Colors.red,
            ),
            Text(
              "Log Out",
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width / 2.05,
      height: MediaQuery.of(context).size.width / 4.5,
      child: SingleChildScrollView(
        child: Text(
          "Hello, \n${widget.authData.firstName} !",
          style: const TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class NewNoteButton extends StatelessWidget {
  const NewNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.width / 9.5,
      width: MediaQuery.of(context).size.width / 2.05,
      child: Ink(
        decoration: BoxDecoration(
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.white, //New
          //     blurRadius: 8.0,
          //     offset: Offset(0, 5),
          //   )
          // ],
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFB6ED42),
        ),
        child: const Center(
          child: Text(
            "New Note",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
