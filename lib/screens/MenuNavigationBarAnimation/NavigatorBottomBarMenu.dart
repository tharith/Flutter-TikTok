import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:flutter/material.dart';

class NavigatorBottomMenuBar extends StatefulWidget {
  const NavigatorBottomMenuBar({Key? key}) : super(key: key);

  @override
  State<NavigatorBottomMenuBar> createState() => _NavigatorBottomMenuBarState();
}

class _NavigatorBottomMenuBarState extends State<NavigatorBottomMenuBar> {
  PageController controller = PageController(initialPage: 0);
  var menuSelected = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      option: BubbleBarOptions(
        barStyle: BubbleBarStyle.horizotnal,
        bubbleFillStyle: BubbleFillStyle.fill,
        opacity: 0.3
      ),
      items: [
        BottomBarItem(
          icon: const Icon(Icons.home_max),
          title: const Text("Home"),
          backgroundColor: Colors.red,
          selectedIcon: const Icon(Icons.read_more)
        ),
        BottomBarItem(
            icon: const Icon(Icons.message_outlined),
            title: const Text("Message"),
            backgroundColor: Colors.orange,
        ),
        BottomBarItem(
          icon: const Icon(Icons.newspaper_outlined),
          title: const Text("News"),
          backgroundColor: Colors.purple,
        )
      ],
      fabLocation: StylishBarFabLocation.end,
      hasNotch: true,
      currentIndex: menuSelected,
      onTap: (index) {
        setState(() {
          menuSelected = index;
        });
      },
    );
  }
}
