import 'package:go_router/go_router.dart';
import 'package:vendor/src/view/forgetPassword/forget_password.dart';
import 'package:vendor/src/view/home/home.dart';
import 'package:vendor/src/view/login/login.dart';
import 'package:vendor/src/view/navigation/navigation.dart';
import 'package:vendor/src/view/receipt/receipt.dart';
import 'package:vendor/src/view/register/register.dart';
import 'package:vendor/src/view/resetPass/reset_pass.dart';
import 'package:vendor/src/view/settlement/settlement.dart';
import 'package:vendor/src/view/startup/startup.dart';
import 'package:vendor/src/view/verification/verification.dart';
import 'package:vendor/src/view/verification/verification_suspended.dart';
import 'package:vendor/src/view/verification/verification_waiting.dart';

import '../view/order/order.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const StartUp()),
  GoRoute(path: '/main', builder: (context, state) => const Navigation()),
  GoRoute(path: '/login', builder: (context, state) => Login()),
  GoRoute(path: '/register', builder: (context, state) => Register()),
  GoRoute(path: '/forget_pass', builder: (context, state) => ForgetPassword()),
  GoRoute(path: '/reset_pass', builder: (context, state) => ResetPassword()),
  GoRoute(path: '/verification', builder: (context, state) => Verification()),
  GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  GoRoute(path: '/order', builder: (context, state) => const OrderScreen()),
  GoRoute(path: '/settlement', builder: (context, state) => const Settlement()),
  GoRoute(path: '/receipt', builder: (context, state) => const Receipt()),
  GoRoute(
      path: '/verification_waiting',
      builder: (context, state) => const VerificationSuspended()),
]);
