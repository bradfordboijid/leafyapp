import 'package:flutter/material.dart';
import 'package:leafy/core/utils/string_helper.dart';

class NoteEntity {
  final String id;
  final String title;
  final String body;
  final Color color;

  NoteEntity(
      {required this.title,
      required this.body,
      required this.color,
      required this.id});

  factory NoteEntity.fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      id: json['_id'] ?? '',
      title: json['title'] as String,
      body: json['body'] as String,
      color: StringHelper().getColorFromString(
        json['color'],
      ),
    );
  }
}
