import 'package:flutter/material.dart';
import 'package:leafy/domain/entity/auth_entity.dart';
import 'package:leafy/domain/entity/note_entity.dart';

import 'package:leafy/presentation/screens/add_note.dart';
import 'package:leafy/presentation/screens/contact.dart';
import 'package:leafy/presentation/screens/edit_note.dart';
import 'package:leafy/presentation/screens/home_page.dart';
import 'package:leafy/presentation/screens/landing_screen.dart';
import 'package:leafy/presentation/screens/login_page.dart';
import 'package:leafy/presentation/screens/sign_up_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //
      // LandingScreen -----------------
      case LandingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      // SignUp -----------------------------
      case SignUp.routeName:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );

      // Login -------------------------------------
      case Login.routeName:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );

      // HomePage ----------------------------------------
      case HomePage.routeName:
        AuthData data = settings.arguments as AuthData;
        return MaterialPageRoute(
          builder: (_) => HomePage(authData: data),
        );

      // EditNote ----------------------------------------------
      case EditNote.routeName:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        AuthData data = args["authData"] as AuthData;
        NoteEntity entity = args["entity"] as NoteEntity;
        return MaterialPageRoute(
          builder: (_) => EditNote(authData: data, entity: entity),
        );

      // AddNote ----------------------------------------------------
      case AddNote.routeName:
        AuthData data = settings.arguments as AuthData;
        return MaterialPageRoute(
          builder: (_) => AddNote(authData: data),
        );

      // Contact ---------------------------------------------------------
      case Contact.routeName:
        return MaterialPageRoute(
          builder: (_) => const Contact(),
        );

      // Default ---------------------------------------------------------------
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("No route defined"),
          ),
        );
    }
  }
}
