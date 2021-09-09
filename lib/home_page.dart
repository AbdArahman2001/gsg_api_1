import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gsg_api_1/providers/main_provider.dart';
import 'package:gsg_api_1/ui/screens/favourites_products.dart';
import 'package:gsg_api_1/ui/widgets/categories_bar.dart';
import 'package:gsg_api_1/ui/widgets/category_products_card.dart';
import 'package:gsg_api_1/ui/widgets/custom_carousel_slider.dart';
import 'package:gsg_api_1/ui/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'homePageRoute';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Consumer<MainProvider>(
        builder: (context, mainProvider, _) => Scaffold(
              appBar: AppBar(
                elevation: 0,
              ),
              drawer: CustomDrawer(),
              backgroundColor: Colors.white,
              body: mainProvider.allProducts != null
                  ? Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCarousalSlider(
                              mainProvider.allProducts!, screenHeight),
                          CategoriesBar(),
                          if (mainProvider.categoryProducts != null)
                            Container(
                              child: CategoryProductsCard(
                                  mainProvider.categoryProducts!),
                            ),
                        ],
                      ),
                    )
                  : Center(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ));
  }
}
