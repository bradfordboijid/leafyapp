// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/presentation/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:leafy/presentation/bloc/signup_bloc/bloc/sign_up_bloc.dart';
import 'package:leafy/presentation/screens/splashscreen.dart';

import 'package:leafy/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (_) => SignUpBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Leafy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Splash(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
