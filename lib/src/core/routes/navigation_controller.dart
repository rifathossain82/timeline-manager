import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  NavigatorState? get _currentState => navigatorKeys[currentIndex.value].currentState;

  Future<void> push(Widget page) async {
    await _currentState?.push(_createRoute(page));
  }

  Future<void> pushReplacement(Widget page) async {
    await _currentState?.pushReplacement(_createRoute(page));
  }

  Future<void> pushNamed(String routeName, {Object? arguments}) async {
    await _currentState?.pushNamed(routeName, arguments: arguments);
  }

  Future<void> pushNamedAndRemoveUntil(String newRouteName, bool Function(Route<dynamic>) predicate, {Object? arguments}) async {
    await _currentState?.pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  bool canPop() {
    return _currentState?.canPop() ?? false;
  }

  void pop() {
    if (canPop()) {
      _currentState?.pop();
    }
  }

  void popUntil(RoutePredicate predicate) {
    _currentState?.popUntil(predicate);
  }

  Route<dynamic> _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
