import 'package:flutter/material.dart';
import 'package:gsg_api_1/data/shared_pref_helper.dart';
import 'package:gsg_api_1/providers/main_provider.dart';
import 'package:gsg_api_1/ui/screens/cart_screen.dart';
import 'package:gsg_api_1/ui/screens/custom_splash_screen.dart';
import 'package:gsg_api_1/ui/screens/favourites_products.dart';
import 'package:gsg_api_1/ui/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.sharedPrefHelper.initSharedPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (context) => MainProvider(),
      builder: (context, _) => MaterialApp(
        title: 'First Api App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CustomSplashScreen(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          FavouriteProducts.routeName: (context) => FavouriteProducts(),
          CartProducts.routeName: (context) => CartProducts(),
        },
      ),
    );
  }
}
