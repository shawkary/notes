import 'package:bee_2/constants.dart';
import 'package:bee_2/core/components.dart';
import 'package:bee_2/features/home/presentation/manager/home_cubit/cubit.dart';
import 'package:bee_2/features/home/presentation/views/widgets/dialog_content.dart';
import 'package:bee_2/features/home/presentation/views/widgets/read_note.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.index, required this.homeCubit});
  final int index;
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, ReadStory(index: index));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Card(
              elevation: 10,
              color: Theme.of(context).cardColor,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Theme.of(context).shadowColor),
              ),
              shadowColor: Theme.of(context).shadowColor,
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 6, bottom: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(stories.isNotEmpty ? stories[index * 3] : '',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    IconButton(
                      onPressed: () {
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) => DialogContent(index: index, cubit: homeCubit),
                        );
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Text(stories[index * 3 + 2],
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
