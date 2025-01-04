import 'package:bee_2/core/custom_widgets.dart';
import 'package:bee_2/features/home/presentation/manager/home_cubit/cubit.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var textController = TextEditingController();
    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              TextButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        textController.text.isNotEmpty) {
                      Navigator.pop(context);
                      cubit.addNotes(
                          text: titleController.text,
                          text2: textController.text);
                    } else {
                      if (titleController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('write a title')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('The field is empty!')));
                      }
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.amber)),
                  child:
                      const Text('save', style: TextStyle(color: Colors.black)))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  CustomTextField(
                      controller: titleController, hintText: 'title'),
                  const SizedBox(height: 6),
                  CustomTextField(
                    controller: textController,
                    hintText: 'write your note...',
                    maxLines: 15,
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
