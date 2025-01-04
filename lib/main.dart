import 'package:bee_2/constants.dart';
import 'package:bee_2/core/components.dart';
import 'package:bee_2/core/shared_preference.dart';
import 'package:bee_2/features/home/presentation/manager/mode_cubit/cubit.dart';
import 'package:bee_2/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  stories = await CacheHelper.getList(key: 'stories') ?? [];
  isDark = await CacheHelper.getBool(key: 'isDark') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ModeCubit(),
      child: BlocBuilder<ModeCubit, ModeState>(
        builder: (context, state) {
          ModeCubit cubit = BlocProvider.of(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: darkMode(),
            theme: lightMode(),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeView(cubit: cubit),
          );
        },
      ),
    );
  }
}
