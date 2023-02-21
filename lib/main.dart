import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veflat/general/general_controllers/cart_page_controller.dart';
import 'package:veflat/general/general_controllers/checkout_page_controller.dart';
import 'package:veflat/general/general_controllers/home_controller_page.dart';
import 'package:veflat/general/general_pages/cart_page.dart';
import 'package:veflat/general/general_pages/checkout_page.dart';
import 'package:veflat/general/general_pages/home_page.dart';

void main() {
  runApp( const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>HomeController()),
        ChangeNotifierProvider(create: (_)=>CartController()),
        ChangeNotifierProvider(create: (_)=>CheckoutController()),
      ],
      child:  const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_)=> const HomePage(),
        'checkout': (_)=> const CheckoutPage(),
        'cart': (_)=> const CartPage(),
      },
    );
  }
}
