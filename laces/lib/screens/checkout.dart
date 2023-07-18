import 'package:flutter/cupertino.dart';
import '../screens/nav.dart';
import '../widgets/cart.dart';
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

  // ignore: prefer_typing_uninitialized_variables
  var code;
  final String coupon = "Sneaker100";

  var discount = 0;
  int delivery = 15;
  bool isCode = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final items = cartController.cart.length;
        int mrp = cartController.calculateTotalPrice();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const MyTitle(
              title: "Checkout",
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Get.to(() => const MyNavBar());
                },
                icon: const Icon(CupertinoIcons.arrow_left)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CartGrid(),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text("Total items in cart: $items"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.4,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.sizeOf(context).width,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
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
                        padding:
                            const EdgeInsets.only(top: 3, left: 10, right: 20),
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
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: const Icon(
                                  CupertinoIcons.arrow_right_circle_fill,
                                  size: 30,
                                )),
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
                          onChanged: (value) {
                            code = value;
                            if (code == coupon && mrp > 100) {
                              isCode = true;
                            } else {
                              isCode = false;
                            }
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Use code \"Sneaker100\" to get \$100 Off",
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 230,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            "Billing Details",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        const Divider(
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
                              const Text("Total MRP: "),
                              Text("\$$mrp")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 10, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Coupon Discount: "),
                              Text(isCode ? "\$100" : "\$0")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 10, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Delivery Charges: "),
                              Text(items > 0 ? "\$$delivery" : "\$${0}")
                            ],
                          ),
                        ),
                        const Divider(
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
                              const Text(
                                "Total Amount: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    if (isCode)
                                      Row(
                                        children: [
                                          Text(
                                            '\$${mrp + delivery - 100}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                              width:
                                                  8), // Add space between the texts
                                          Text(
                                            '\$${mrp + delivery}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Colors.black,
                                              decorationThickness: 3,
                                            ),
                                          ),
                                        ],
                                      )
                                    else
                                      Text(items>0?
                                        '\$${mrp + delivery}': "\$${0}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      color: Colors.black,
                      height: 40,
                      width: MediaQuery.sizeOf(context).width,
                      child: const Center(
                        child: Text(
                          "Place Order",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
