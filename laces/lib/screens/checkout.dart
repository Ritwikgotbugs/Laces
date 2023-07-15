import 'package:flutter/cupertino.dart';
import 'package:laces/widgets/cart.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../controllers/controller.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  
  final codecontroller = TextEditingController();
  final cartController = Get.find<MyObjectsController>();
  @override
  Widget build(BuildContext context) {
    final items=cartController.cart.length;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const MyTitle(
          title: "Checkout",
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartGrid(),
            Padding(
              padding: const EdgeInsets.only(left: 5,top: 5),
              child: Text("Total items in cart: $items"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.sizeOf(context).width,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Apply Coupon",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(CupertinoIcons.tag)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, left: 10, right: 20),
                    child: TextField(
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: "Enter Code",
                        isDense: true,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 61, 61, 61),
                            fontSize: 15),
                        hoverColor: null,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 0,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      controller: codecontroller,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 300,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        "Billing Details",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.4,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Total MRP: "), Text("\$${widget}")],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Coupon Discount: "),
                          Text("\$${widget}")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Delivery Charges: "), Text("\$15")],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.4,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount: ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$${widget}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.black,
                height: 40,
                width: MediaQuery.sizeOf(context).width,
                child: Center(child: Text("Place Order",style: TextStyle(fontSize: 16,color: Colors.white),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
