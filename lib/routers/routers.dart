import 'package:get/get_navigation/src/routes/get_route.dart';
import '../login_signup/email_verification_screen.dart';
import '../login_signup/login_screen.dart';
import '../login_signup/onborading_screen.dart';
import '../login_signup/otpScreen.dart';
import '../login_signup/signupScreen.dart';
import '../login_signup/splash_screen.dart';
import '../screen/assigned_order.dart';
import '../screen/bank_details.dart';
import '../screen/delivery_partner_apply.dart';
import '../screen/deshborad_screen.dart';
import '../screen/order_details.dart';
import '../screen/thank_you.dart';
import '../screen/withdraw_money.dart';



class MyRouters {
  static var splashScreen = "/splashScreen";
  static var onBoardingScreen = "/onBoardingScreen";
  static var loginScreen = "/loginScreen";
  static var signupScreen = "/signupScreen";
  static var otpScreen = "/otpScreen";
  static var emailVerificationScreen = "/emailVerificationScreen";
  static var thankYouVendorScreen = "/thankYouVendorScreen";
  static var deliveryPartnerApplyScreen = "/deliveryPartnerApplyScreen";
  static var dashbordScreen = "/dashbordScreen";
  static var assignedOrderScreen = "/assignedOrderScreen";
  static var bankDetailsScreen = "/bankDetailsScreen";
  static var driverWithdrawMoney = "/driverWithdrawMoney";
  static var driverDeliveryOrderDetails = "/driverDeliveryOrderDetails";

  static var route = [
    GetPage(name: '/', page: () =>  const SplashScreen()),
    GetPage(name: '/onBoardingScreen', page: () =>  const OnBoardingScreen()),
    GetPage(name: '/loginScreen', page: () => const LoginScreen()),
    GetPage(name: '/signupScreen', page: () => const SignupScreen()),
    GetPage(name: '/otpScreen', page: () => const OtpScreen()),
    GetPage(name: '/otpScreen', page: () => const OtpScreen()),
    GetPage(name: '/emailVerificationScreen', page: () => const EmailVerificationScreen()),
    GetPage(name: '/thankYouVendorScreen', page: () => const ThankYouVendorScreen()),
    GetPage(name: '/deliveryPartnerApplyScreen', page: () => const DeliveryPartnerApplyScreen()),
    GetPage(name: '/dashbordScreen', page: () => const DashbordScreen()),
    GetPage(name: '/assignedOrderScreen', page: () => const AssignedOrderScreen()),
    GetPage(name: '/bankDetailsScreen', page: () => const BankDetailsScreen()),
    GetPage(name: '/driverWithdrawMoney', page: () => const DriverWithdrawMoney()),
    GetPage(name: '/driverDeliveryOrderDetails', page: () => const DriverDeliveryOrderDetails()),



  ];
}