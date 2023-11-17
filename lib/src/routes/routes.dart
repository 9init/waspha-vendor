import 'package:go_router/go_router.dart';
import 'package:vendor/src/view/login/login.dart';

import '../view/order/order.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => Login()),
  GoRoute(path: '/order', builder: (context, state) => const OrderScreen()),
]);
