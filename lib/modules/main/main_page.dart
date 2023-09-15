import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_app/modules/timeline/timeline_page.dart';
import 'package:get/get.dart';

import 'main_controller.dart';
import '../../utils/theme_util.dart';
import 'widgets/bottom_navbar.dart';
import '../discover/discover_page.dart';
import '../profile/profile_page.dart';
import '../notifications/notifications_page.dart';
import '../explore/explore_page.dart';
import '../messages/messages_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  _buildCurrentPage() {
    List<Widget> pages = [
      const TimelinePage(),
      const NotificationsPage(),
      const ExplorePage(),
      const MessagesPage(),
      const ProfilePage(),
    ];
    return pages[controller.tabIndex.value];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: GMTheme.cBandBlack.withOpacity(.8),
        bottomNavigationBar: MyBottomNavBar(
          tabIndex: controller.tabIndex.value,
          onTap: (index) {
            controller.tabIndex.value = index;
          },
        ),
        body: _buildCurrentPage(),
      ),
    );
  }
}
