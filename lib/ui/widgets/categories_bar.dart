import 'package:flutter/material.dart';
import 'package:gsg_api_1/providers/main_provider.dart';
import 'package:provider/provider.dart';

class CategoriesBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<MainProvider, List<dynamic>?>(
        selector: (context, mainProvider) => mainProvider.allCategories,
        builder: (context, categories, _) {
          return categories != null
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...categories.map((e) {
                        return InkWell(
                          onTap: () {
                            Provider.of<MainProvider>(context, listen: false)
                                .getCategoryProducts(e);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Text(e),
                          ),
                        );
                      }),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
