import 'package:flutter/material.dart';
import 'package:flutter_for_tiktok/screens/MenuNavigationBarAnimation/NavigatorBottomBarMenu.dart';

class MenuAnimation extends StatefulWidget {
  const MenuAnimation({Key? key}) : super(key: key);

  @override
  State<MenuAnimation> createState() => _MenuAnimationState();
}

class _MenuAnimationState extends State<MenuAnimation> with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _animationController;

  // This is used to animate the icon of th man FAB
  late Animation<double> _buttonAnimatedIcon;
  // This is used to animate the child FABs
  late Animation<double> _translateButton;
  // This variable determine whether the child FABs are visible or not
  bool _isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600)
    )..addListener(() {setState(() { });});
    _buttonAnimatedIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _translateButton = Tween<double>(begin: 100, end: -20).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  // This function is used to expand/collapse the children floating buttons
  // It will be called when the primary FAB (with menu icon) is pressed
  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text("Menu Navigator Animimation", style:  TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
      bottomNavigationBar: NavigatorBottomMenuBar(),
      floatingActionButton: Stack(
        children: [
          Transform(
            transform: Matrix4.translationValues(0.0, _translateButton.value * 9, 0.0),
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: (){},
              child: const Icon(Icons.email),
            ),
          ),
          Transform(
            transformHitTests: false,
            transform: Matrix4.translationValues(0.0, _translateButton.value * 6, 0.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: (){},
              child: const Icon(Icons.call),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(0.0, _translateButton.value * 3, 0.0),
            child: FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: (){},
              child: const Icon(Icons.message),
            ),
          ),
          // This is the primary FAB
          FloatingActionButton(
            backgroundColor: Colors.red,
            foregroundColor: Colors.orange,
            onPressed: _toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.view_list,
              color: Colors.white,
              progress: _buttonAnimatedIcon,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
