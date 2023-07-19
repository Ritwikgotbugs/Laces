import 'package:get/get.dart';
import '../model/model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MyObjectsController extends GetxController {
  static MyObjectsController get to => Get.find();

  final _selectedNavIndex = 0.obs;

  int get selectedNavIndex => _selectedNavIndex.value;
  set selectedNavIndex(int index) {
    _selectedNavIndex.value = index;
  }

  final _myObjects = <MyObjects>[].obs;
  // ignore: invalid_use_of_protected_member
  List<MyObjects> get myObjects => _myObjects.value;



  //Parse the JSON File
  Future<void> parseJSONData() async {
    try {
      String jsonData = await rootBundle.loadString('assets/data.json');
      List<dynamic> data = json.decode(jsonData);
      _myObjects.value = data
          .map(
            (item) => MyObjects(
              name: item['name'],
              price: item['price'],
              description: item['description'],
              rating: item['rating'],
              image: item['image'],
            ),
          )
          .toList();
    } catch (error) {
      ('Error: $error');
    }
  }


  RxList<MyObjects> saved = <MyObjects>[].obs;
  RxList<MyObjects> cart = <MyObjects>[].obs;


 //Add to Favourties
  void toggleFav(MyObjects card) {
    if (saved.contains(card)) {
      saved.remove(card);
    } else {
      saved.add(card);
    }
    update();
  }

  //Favourite checker
  bool isFavorite(MyObjects card) {
    return saved.contains(card);
  }

 //Add to Cart
  void toggleCart(MyObjects card) {
    if (cart.contains(card)) {
      cart.remove(card);
    } else {
      cart.add(card);
    }
    update();
  }

  bool isAdded(MyObjects bag) {
    return cart.contains(bag);
  }

  RxInt selectedIndex = 0.obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
    update();
  }

 //Get Price from Cart List
  List<int> getCartPrices() {
    return cart.map((item) => int.tryParse(item.price) ?? 0).toList();
  }


 //Calculate total price
  int calculateTotalPrice() {
    final List<int> cartTotal = getCartPrices();
    return cartTotal.fold(0, (sum, price) => sum + price);
  }
}
