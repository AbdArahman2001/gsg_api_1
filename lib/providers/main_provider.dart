import 'package:flutter/material.dart';
import 'package:gsg_api_1/data/api_helper.dart';
import 'package:gsg_api_1/models/product_response.dart';

class MainProvider extends ChangeNotifier {
  List<ProductResponse>? allProducts;
  ProductResponse? singleProduct;
  List<dynamic>? allCategories;
  List<ProductResponse>? categoryProducts;
  final apiHelper = ApiHelper.apiHelper;
  getAllProducts() async {
    List products = await apiHelper.getAllProducts();
    allProducts = products.map((map) => ProductResponse.fromJson(map)).toList();
    notifyListeners();
  }

  getSingleProduct(int id) async {
    singleProduct = null;
    Map product = await apiHelper.getSingleProduct(id);
    singleProduct = ProductResponse.fromJson(product);
    notifyListeners();
  }

  getAllCategories() async {
    allCategories = await apiHelper.getAllCategories();
    getCategoryProducts(allCategories![0]);
    notifyListeners();
  }

  getCategoryProducts(String categoryName) async {
    List products = await apiHelper.getCategoryProducts(categoryName);
    categoryProducts = products.map((product) {
      return ProductResponse.fromJson(product);
    }).toList();
    notifyListeners();
  }
}
