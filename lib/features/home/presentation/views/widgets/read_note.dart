import 'package:bee_2/constants.dart';
import 'package:flutter/material.dart';


class ReadStory extends StatelessWidget {
  const ReadStory({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_circle_right))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          stories[index * 3 + 1],
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
