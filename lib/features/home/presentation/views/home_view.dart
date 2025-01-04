import 'package:bee_2/constants.dart';
import 'package:bee_2/core/components.dart';
import 'package:bee_2/features/home/presentation/manager/home_cubit/cubit.dart';
import 'package:bee_2/features/home/presentation/manager/mode_cubit/cubit.dart';
import 'package:bee_2/features/home/presentation/views/widgets/add_note.dart';
import 'package:bee_2/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.cubit});
  final ModeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cub = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              title: const Text('My Notes'),
              actions: [
                IconButton(
                    onPressed: () => cubit.changeMode(),
                    icon: const Icon(Icons.brightness_4))
              ],
            ),
            body: ListView.separated(
              itemBuilder: (context, index) => ListViewItem(index: index, homeCubit: cub),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: stories.length ~/ 3,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => navigateTo(context, AddNote(cubit: cub)),
              backgroundColor: primaryColor,
              child: const Icon(Icons.add, color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}
