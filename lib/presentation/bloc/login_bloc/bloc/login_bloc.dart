import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';

import 'package:leafy/core/services/http_service.dart';
import 'package:leafy/domain/entity/auth_entity.dart';
import 'package:leafy/presentation/screens/home_page.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginInput) {
        if (event.email.isEmpty || event.password.isEmpty) {
          emit(LoginError());
        } else {
          emit(LoginLoading());
          {
            Response? response = await HttpService().signIn(
              email: event.email,
              password: event.password,
            );

            if (response != null) {
              if (response.statusCode == 200) {
                Map<String, dynamic> decodeJsonBody = jsonDecode(response.body);

                // ignore: use_build_context_synchronously
                Navigator.pushNamed(
                  event.context,
                  HomePage.routeName,
                  arguments: AuthData.fromJson(decodeJsonBody["data"]),
                );
              } else {
                showDialog(
                  useRootNavigator: false,
                  context: event.context,
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                            Navigator.of(event.context).pop();
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
                debugPrint("Something went wrong");
              }
            } else {
              debugPrint("Error");
            }
          }
          emit(LoginInitial());
        }
      }
    });
  }
}
