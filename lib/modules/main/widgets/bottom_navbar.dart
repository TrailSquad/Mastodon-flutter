import 'package:flutter/material.dart';

import '../../../utils/asset_util.dart';
import '../../../utils/theme_util.dart';

@immutable
class MyBottomNavBar extends StatelessWidget {
  /// Tab index
  final int tabIndex;

  /// On tab click
  final Function(int)? onTap;

  const MyBottomNavBar({Key? key, required this.tabIndex, this.onTap}) : super(key: key);

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String name,
    String iconPath, {
    double? iconSize,
    bool active = false,
  }) {
    final Color activeColor = active ? GMTheme.cFunctionalHighlight : GMTheme.cFillTertiary;
    final tsLabel = TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: activeColor, height: 10 / 10);

    final item = Container(
      padding: const EdgeInsets.only(top: 16, bottom: 21),
      child: Column(
        children: [
          ImageIcon(AssetImage(iconPath), size: iconSize, color: activeColor),
          const SizedBox(height: 6),
          Text(name, style: tsLabel),
        ],
      ),
    );

    return BottomNavigationBarItem(icon: item, label: "");
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      _buildBottomNavigationBarItem("Timeline", GMAsset.navHome, active: tabIndex == 0),
      _buildBottomNavigationBarItem("Notifications", GMAsset.navCar, active: tabIndex == 1),
      _buildBottomNavigationBarItem("Explore", GMAsset.navUser, active: tabIndex == 2),
      _buildBottomNavigationBarItem("Messages", GMAsset.navUser, active: tabIndex == 3),
      _buildBottomNavigationBarItem("Profile", GMAsset.navUser, active: tabIndex == 4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: GMTheme.cMonchromeBlackGrey,
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: GMTheme.cNavBarBackground,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabIndex,
            onTap: onTap,
            items: _buildBottomNavigationBarItems(),
          ),
        ),
      ),
    );
  }
}
