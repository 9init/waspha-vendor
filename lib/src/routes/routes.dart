import 'package:go_router/go_router.dart';
import 'package:vendor/src/view/navigation/navigation.dart';

import '../view/order/order.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => Navigation()),
  GoRoute(path: '/order', builder: (context, state) => const OrderScreen()),
]);
