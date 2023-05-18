import 'package:flutter/material.dart';
import 'package:leafy/domain/entity/auth_entity.dart';
import 'package:leafy/domain/entity/note_entity.dart';

class NoteWidget extends StatefulWidget {
  final AuthData authData;
  final NoteEntity noteEntity;
  final Function(String) callBack;
  final Function(String) itemPin;
  final Function navigationCallBack;
  const NoteWidget({
    super.key,
    required this.noteEntity,
    required this.callBack,
    required this.itemPin,
    required this.authData,
    required this.navigationCallBack,
  });

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  Map<String, dynamic> map = {};
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22, right: 22, top: 20),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () {
          widget.navigationCallBack();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.noteEntity.color,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 20, right: 60),
                      child: Text(
                        widget.noteEntity.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 40),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Text(
                          widget.noteEntity.body,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, bottom: 8),
                      alignment: Alignment.bottomRight,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () {
                          widget.itemPin(widget.noteEntity.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Note Pinned"),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.push_pin_outlined,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15, top: 5),
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    child: const Icon(
                      Icons.cancel,
                      size: 30,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          title: const Text(
                            "Delete Note ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          content: const Text(
                            "Are you sure you want to delete this note ?",
                            style: TextStyle(fontSize: 18),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(ctx).size.width / 3,
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
                                  width: MediaQuery.of(ctx).size.width / 3,
                                  height: MediaQuery.of(ctx).size.width / 10,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {
                                      widget.callBack(widget.noteEntity.id);
                                      Navigator.of(ctx).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text("Note has been deleted"),
                                        ),
                                      );
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
