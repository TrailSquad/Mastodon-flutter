import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_app/data/models/message.dart';
import 'package:flutter_boilerplate_app/utils/theme_util.dart';
import 'package:flutter_boilerplate_app/widgets/message_tile.dart';
import 'package:get/get.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  List<Message> posts = MessageExtension.dummyMessages;

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
            _Constants.pageTitle,
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
            height: _Constants.itemHeight,
            child: MessageTile(message: posts[index],),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();  // This will add a line between each cell.
        },

      ),
    );
  }
}

class _Constants {
  static const String pageTitle = "Timeline";
  static const double itemHeight = 200;
}