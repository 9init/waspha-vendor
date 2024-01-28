import 'package:go_router/go_router.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/routes/routes_names.dart';
import 'package:vendor/src/view/application_form/application_form.dart';
import 'package:vendor/src/view/carrier/carrier.dart';
import 'package:vendor/src/view/carriers_management/carriers_management.dart';
import 'package:vendor/src/view/driver/driver_details_screen/driver_details_screen.dart';
import 'package:vendor/src/view/forget_password/forget_password.dart';
import 'package:vendor/src/view/forget_password/viewmodel.dart';
import 'package:vendor/src/view/forget_password_otp/forget_password_otp.dart';
import 'package:vendor/src/view/login/login.dart';
import 'package:vendor/src/view/navigation/navigation.dart';
import 'package:vendor/src/view/notification/notification.dart';
import 'package:vendor/src/view/offer_invoice/offer_invoice.dart';
import 'package:vendor/src/view/order/order.dart';
import 'package:vendor/src/view/pass_reset/pass_reset.dart';
import 'package:vendor/src/view/payouts/payouts.dart';
import 'package:vendor/src/view/receipt/receipt.dart';
import 'package:vendor/src/view/register/register.dart';
import 'package:vendor/src/view/requests/requests.dart';
import 'package:vendor/src/view/settlement/settlement.dart';
import 'package:vendor/src/view/startup/startup.dart';
import 'package:vendor/src/view/payment_methods/payment_methods.dart';
import 'package:vendor/src/view/commissions/commissions.dart';
import 'package:vendor/src/view/store_profile/store_profile.dart';
import 'package:vendor/src/view/store_reviews/store_reviews.dart';
import 'package:vendor/src/view/transactions-listing/screens/transactions-listing_screen/transactions-listing_screen.dart';
import 'package:vendor/src/view/update_driver_data/screens/add_new_driver_screen/add_new_driver_screen.dart';
import 'package:vendor/src/view/update_driver_data/screens/contact_list_screen/contact_list_screen.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/update_driver_data_screen.dart';
import 'package:vendor/src/view/vendor_profile/screens/vendor_profile_deltails_screen/vendor_profile_details_screen.dart';
import 'package:vendor/src/view/vendor_profile/screens/vendor_profile_screen/vendor_profile_screen.dart';
import 'package:vendor/src/view/verification/verification.dart';
import 'package:vendor/src/view/verification/verification_waiting.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => StartUp(),
    ),
    GoRoute(path: '/main', builder: (context, state) => const Navigation()),
    GoRoute(path: '/login', builder: (context, state) => Login()),
    GoRoute(path: '/register', builder: (context, state) => Register()),
    GoRoute(
        path: '/forget_pass', builder: (context, state) => ForgetPassword()),
    GoRoute(
      path: '/forget_pass_otp',
      builder: (context, state) => ForgetPasswordOtp(
        resetModel: state.extra as PasswordResetModel,
      ),
    ),
    GoRoute(
      path: '/reset_pass',
      builder: (context, state) =>
          ResetPassword(followUpCode: state.extra as String),
    ),
    GoRoute(
      path: '/verification',
      builder: (context, state) => Verification(),
    ),
    GoRoute(
      path: '/payouts',
      builder: (context, state) => const Payouts(),
    ),
    GoRoute(
      path: '/settlement',
      builder: (context, state) => const Settlement(),
    ),
    GoRoute(
      path: '/receipt',
      builder: (context, state) => const Receipt(),
    ),
    GoRoute(
      path: '/order',
      builder: (context, state) => const Order(),
    ),
    GoRoute(
      path: '/requests',
      builder: (context, state) => const Requests(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const Notifications(),
    ),
    GoRoute(
      path: '/application_form',
      builder: (context, state) => const ApplicationForm(),
    ),
    GoRoute(
      path: '/verification_waiting',
      builder: (context, state) => VerificationWaiting(),
    ),
    GoRoute(
      path: '/store_profile',
      builder: (context, state) => StoreProfile(),
    ),
    GoRoute(
      path: '/commissions',
      builder: (context, state) => Commissions(),
    ),
    GoRoute(
      path: "/payment_methods",
      builder: (context, state) => PaymentMethods(),
    ),
    GoRoute(
      path: "/store_reviews",
      builder: (context, state) => StoreReviewsScreen(),
    ),
    GoRoute(
      path: "/carriers_management",
      builder: (context, state) => CarrierManagement(),
    ),
    GoRoute(
      path: "/carrier",
      builder: (context, state) =>
          Carrier(driverType: state.extra as DriverType),
    ),
    GoRoute(
        name: RoutesNames.updateDriverDataScreen,
        path: '${RoutesNames.updateDriverDataScreen}/:driver_id',
        builder: (context, state) {
          return UpdateDriverDataScreen(
            driverId: state.pathParameters['driver_id']!,
          );
        }),
    GoRoute(
      path: RoutesNames.contactListScreen,
      builder: (context, state) => const ContactListScreen(),
    ),
    GoRoute(
      path: RoutesNames.addNewDriver,
      builder: (context, state) => AddNewDriverScreen(
        driverType: state.extra as DriverType,
      ),
    ),
    GoRoute(
      path: RoutesNames.profileScreen,
      builder: (context, state) => VendorProfileScreen(),
    ),
    GoRoute(
      path: RoutesNames.profileDetailScreen,
      builder: (context, state) => VendorProfileDetailsScreen(),
    ),
    GoRoute(
      path: '${RoutesNames.driverDetailsScreen}/:driver_id',
      name: RoutesNames.driverDetailsScreen,
      builder: (context, state) => DriverDetailsScreen(
        driverId: state.pathParameters['driver_id']!,
      ),
    ),
    GoRoute(
      path: RoutesNames.transactionsListingScreen,
      builder: (context, state) => TransactionsListingScreen(),
    ),
    GoRoute(
      path: RoutesNames.offerInvoiceScreen,
      builder: (context, state) => OfferInvoiceScreen(
        invoiceModelId: state.extra as int,
      ),
    ),
  ],
);
