import 'package:go_router/go_router.dart';
import 'package:vendor/src/view/home/home.dart';
import 'package:vendor/src/view/login/login.dart';
import 'package:vendor/src/view/startup/startup.dart';

import '../view/order/order.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => StartUp()),
  GoRoute(path: '/login', builder: (context, state) => Login()),
  GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
  GoRoute(path: '/order', builder: (context, state) => const OrderScreen()),
]);
