import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_app/utils/theme_util.dart';
import 'package:get/get.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  List<String> posts = [
    "Post 1",
    "Post 2",
    "Post 3",
    // Add more dummy posts here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GMTheme.cMainPageBackground,
        leading: IconButton(
          icon: const Icon(Icons.menu), // This represents the left button.
          onPressed: () {
            // Handle left button press.
          },
        ),
        title: TextButton(
          child: const Text(
            "Timeline",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // Handle center text button press.
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit), // This represents the edit button.
            onPressed: () {
              // Handle edit button press.
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            height: 200,
            child: ListTile(
              title: Text(posts[index]),
            ),
            
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();  // This will add a line between each cell.
        },

      ),
    );
  }
}
