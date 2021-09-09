import 'package:flutter/material.dart';
import 'package:gsg_api_1/home_page.dart';
import 'package:gsg_api_1/providers/main_provider.dart';
import 'package:provider/provider.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MainProvider>(context, listen: false).getAllProducts();
    Provider.of<MainProvider>(context, listen: false).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 300)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())));
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
