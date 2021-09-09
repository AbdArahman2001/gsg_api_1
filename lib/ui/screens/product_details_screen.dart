import 'package:flutter/material.dart';
import 'package:gsg_api_1/models/product_response.dart';
import 'package:gsg_api_1/providers/main_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static final routeName = 'productDetailsRoute';
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Selector<MainProvider, ProductResponse?>(
        selector: (context, mainProvider) => mainProvider.singleProduct,
        builder: (context, product, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(actions: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ]),
            body: product != null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                margin: EdgeInsets.only(bottom: 12),
                                alignment: Alignment.center,
                                height: screenHeight * 0.25,
                                child: Image.network(product.image),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        product.description,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        product.category,
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 20),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '\$${product.price}',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Add to cart',
                              style: TextStyle(fontSize: 18),
                            ),
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.resolveWith(
                                    (states) => Size(
                                        MediaQuery.of(context).size.width *
                                            0.75,
                                        30)),
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                          ),
                        ),
                      ],
                    ))
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }
}
