import 'package:go_router/go_router.dart';

import '../../features/navigation/presentation/navigation.dart';
import '../../features/order/presentation/order.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => Navigation()),
  GoRoute(path: '/order', builder: (context, state) => const OrderScreen()),
]);
