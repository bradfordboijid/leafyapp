import 'package:leafy/domain/entity/note_entity.dart';

class AuthData {
  final String id;
  final String firstName;
  final String email;
  final String password;
  final String avatar;
  final List<NoteEntity> notes;
  final String? pinnedNoteId;

  AuthData(
      {required this.id,
      required this.notes,
      required this.firstName,
      required this.email,
      required this.password,
      required this.avatar,
      this.pinnedNoteId});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonX = json['notes'];
    List<NoteEntity> entities = jsonX.map((e) {
      Map<String, dynamic> ll = e as Map<String, dynamic>;
      return NoteEntity.fromJson(ll);
    }).toList();
    return AuthData(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      avatar: json['avatar'] as String,
      notes: entities,
      pinnedNoteId: json['pinnedNoteId'],
    );
  }
}
