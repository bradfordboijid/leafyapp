import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpService {
  //
  // BASE URL ------------------------------------------------------
  //
  final String baseUrl = "http://192.168.1.78:4000/";

  //
  // REGISTER -------------------------------------------------------
  //
  Future<Response?> registerUse({
    required String firstName,
    required String email,
    required String password,
    required String avatar,
  }) async {
    try {
      Uri uri = Uri.parse("${baseUrl}user/register");
      Response? response = await http.post(uri, body: {
        "firstName": firstName,
        "email": email,
        "password": password,
        "avatar": avatar,
      });

      return response;
    } catch (e) {
      return null;
    }
  }

  //
  // SIGN IN -------------------------------------------------------
  //
  Future<Response?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Uri uri = Uri.parse("${baseUrl}user/login");
      Response? response = await http.post(uri, body: {
        "email": email,
        "password": password,
      });

      return response;
    } catch (e) {
      return null;
    }
  }

  //
  // ADD NOTE -------------------------------------------------------
  //
  Future<Response?> addNoteToServer({
    required String id,
    required String title,
    required String body,
    required String color,
  }) async {
    try {
      Uri uri = Uri.parse("${baseUrl}note/add");
      Response? response = await http.post(uri, body: {
        "userId": id,
        "title": title,
        "body": body,
        "color": color,
      });

      return response;
    } catch (e) {
      return null;
    }
  }

  //
  // DELETE NOTE -------------------------------------------------------
  //
  Future<Response?> deleteNote({
    required String userid,
    required String noteid,
  }) async {
    try {
      Uri uri = Uri.parse("${baseUrl}note/delete");
      Response? response = await http.post(uri, body: {
        "userId": userid,
        "noteId": noteid,
      });

      return response;
    } catch (e) {
      return null;
    }
  }

  //
  // PIN NOTE -------------------------------------------------------
  //
  Future<Response?> pinNote({
    required String userid,
    required String noteid,
  }) async {
    try {
      Uri uri = Uri.parse("${baseUrl}user/pinNote");
      Response? response = await http.post(uri, body: {
        "userId": userid,
        "notePinId": noteid,
      });

      return response;
    } catch (e) {
      return null;
    }
  }

  //
  // EDIT NOTE -------------------------------------------------------
  //
  Future<Response?> editNote({
    required String userid,
    required String noteid,
    required String title,
    required String body,
    required String color,
  }) async {
    try {
      Uri uri = Uri.parse("${baseUrl}note/update");
      Response? response = await http.post(uri, body: {
        "userId": userid,
        "noteId": noteid,
        "title": title,
        "body": body,
        "color": color,
      });

      return response;
    } catch (e) {
      return null;
    }
  }
}
