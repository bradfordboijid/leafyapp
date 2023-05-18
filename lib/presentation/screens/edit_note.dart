import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:leafy/core/services/http_service.dart';
import 'package:leafy/core/utils/string_helper.dart';
import 'package:leafy/domain/entity/auth_entity.dart';
import 'package:leafy/domain/entity/note_entity.dart';

class EditNote extends StatefulWidget {
  static const String routeName = "/editnote";

  final AuthData authData;
  final NoteEntity entity;

  const EditNote({super.key, required this.authData, required this.entity});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String title = "";
  String body = "";

  String? currentSelectedBox;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    title = widget.entity.title;
    body = widget.entity.body;

    bodyController.text = body;
    titleController.text = title;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
//
// Edit Note Header ------------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              padding: const EdgeInsets.only(left: 25),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0, // Underline thickness
                    ),
                  ),
                ),
                child: const Text(
                  "Edit Note",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
            ),
//
// Note Title ------------------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "Title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                style: const TextStyle(fontSize: 20),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                controller: titleController,
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
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xFFE8E8E8),
                ),
              ),
            ),
//
// Note Body -------------------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "Body",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                style: const TextStyle(fontSize: 20),
                onChanged: (value) {
                  setState(() {
                    body = value;
                  });
                },
                controller: bodyController,
                keyboardType: TextInputType.multiline,
                maxLines: 7,
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
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xFFE8E8E8),
                ),
              ),
            ),

//
// Color Header ----------------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "Color",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
//
// Color Boxes -----------------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
//
// Color 1 ---------------------------------------------------------------------
                  InkWell(
                    onTap: () => setState(
                      () {
                        currentSelectedBox = "0xFFFFFA76";
                      },
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.width / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFFFFFA76),
                        border: Border.all(
                          color: currentSelectedBox != null
                              ? currentSelectedBox == "0xFFFFFA76"
                                  ? Colors.green
                                  : Colors.transparent
                              : Colors.green,
                          width: 4,
                        ),
                      ),
                    ),
                  ),

//
// Color 2 ---------------------------------------------------------------------
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () => setState(
                        () {
                          currentSelectedBox = "0xFF72FDA1";
                        },
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF72FDA1),
                          border: Border.all(
                            color: currentSelectedBox != null
                                ? currentSelectedBox == "0xFF72FDA1"
                                    ? Colors.green
                                    : Colors.transparent
                                : Colors.transparent,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ),

//
// Color 3 ---------------------------------------------------------------------
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () => setState(
                        () {
                          currentSelectedBox = "0xFF74F8F8";
                        },
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF74F8F8),
                          border: Border.all(
                            color: currentSelectedBox != null
                                ? currentSelectedBox == "0xFF74F8F8"
                                    ? Colors.green
                                    : Colors.transparent
                                : Colors.transparent,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ),

//
// Color 4 ---------------------------------------------------------------------
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () => setState(
                        () {
                          currentSelectedBox = "0xFFFF7676";
                        },
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFFF7676),
                          border: Border.all(
                            color: currentSelectedBox != null
                                ? currentSelectedBox == "0xFFFF7676"
                                    ? Colors.green
                                    : Colors.transparent
                                : Colors.transparent,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

//
// Preview Header --------------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "Preview",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),

//
// Preview Container -----------------------------------------------------------
            PreviewContainer(
                currentSelectedBox: currentSelectedBox,
                title: title,
                body: body),

//
// Save Button -----------------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.width / 8,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onTap: () async {
                        Response? response = await HttpService().editNote(
                          noteid: widget.entity.id,
                          userid: widget.authData.id,
                          title: titleController.text,
                          body: bodyController.text,
                          color: currentSelectedBox != null
                              ? currentSelectedBox!
                              : "0xFFFFFA76",
                        );

                        if (response != null) {
                          if (response.statusCode == 200) {
                            final body = jsonDecode(response.body);
                            List<NoteEntity> note = (body['data']['notes'])
                                .map<NoteEntity>((e) => NoteEntity.fromJson(e))
                                .toList();

                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop(note);
                          }
                        }
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red),
                        child: const Center(
                          child: Text(
                            'Save',
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
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewContainer extends StatelessWidget {
  const PreviewContainer({
    super.key,
    required this.currentSelectedBox,
    required this.title,
    required this.body,
  });

  final String? currentSelectedBox;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: currentSelectedBox != null
                    ? StringHelper().getColorFromString(currentSelectedBox!)
                    : const Color(0xFFFFFA76),
              ),
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    title != "" ? title : "Title",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.width / 5,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Text(
                      body != ""
                          ? body
                          : "This is a sample note. This is a sample note.This is a sample note.This is a sample note.This is a sample ...",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
