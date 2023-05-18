// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// ignore: unnecessary_import, depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:leafy/core/services/http_service.dart';
import 'package:leafy/presentation/screens/login_page.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpInput) {
        if (event.email.isEmpty ||
            event.password.isEmpty ||
            event.firstName.isEmpty) {
          emit(SignUpError());
        } else {
          emit(SignUpLoading());
          {
            Response? response = await HttpService().registerUse(
              firstName: event.firstName,
              email: event.email,
              password: event.password,
              avatar: event.avatar != ""
                  ? event.avatar
                  : "assets/images/avatar1.png",
            );

            if (response != null) {
              if (response.statusCode == 200) {
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
                          "Success",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                    content: const Text(
                      "Congratulations, you have successfully signed up. \nClick to login.",
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
                            Navigator.of(event.context).pop();
                            Navigator.pushNamed(event.context, Login.routeName);
                          },
                          child: const Center(
                            child: Text(
                              "Login",
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
                debugPrint(response.body.toString());
              } else {
                {
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
                }
                debugPrint("Something went wrong");
              }
            } else {
              debugPrint("Error");
            }
          }
          emit(SignUpInitial());
        }
      }
    });
  }
}
