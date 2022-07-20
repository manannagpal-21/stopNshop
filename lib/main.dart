import 'package:flutter/material.dart';
import 'package:stop_n_shop/auth/customer_login.dart';
import 'package:stop_n_shop/auth/customer_signup.dart';
import 'package:stop_n_shop/auth/supplier_login.dart';
import 'package:stop_n_shop/auth/supplier_signup.dart';
import 'package:stop_n_shop/main_screens/supplier_home.dart';
import 'package:stop_n_shop/main_screens/welcome_screen.dart';
import 'package:stop_n_shop/providers/cart_provider.dart';
import 'package:stop_n_shop/providers/stripe_id.dart';
import 'package:stop_n_shop/providers/wish_provider.dart';
import 'main_screens/customer_home.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripeSecretKey;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
   runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Cart()),
    ChangeNotifierProvider(create: (_) => Wish()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen' : (context) => const WelcomeScreen(),
        '/customer_home' : (context) => const CustomerHomeScreen(),
        '/supplier_home' : (context) => const SupplierHomeScreen(),
        '/customer_signup' : (context) => const CustomerRegister(),
        '/customer_login' : (context) => const CustomerLogin(),
        '/supplier_signup' : (context) => const SupplierRegister(),
        '/supplier_login' : (context) => const SupplierLogin(),
      },
    );
  }
}
