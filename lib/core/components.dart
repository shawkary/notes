import 'package:bee_2/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

darkMode() => ThemeData(
      brightness: Brightness.dark,
      cardColor: primaryColor,
      shadowColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
    );

lightMode() => ThemeData(
      brightness: Brightness.light,
      cardColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      shadowColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
    );
