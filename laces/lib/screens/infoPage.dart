import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../screens/checkout.dart';
import '../widgets/customcircle.dart';
import '../widgets/infobanner.dart';
import 'package:badges/badges.dart' as badges;
import '../model/model.dart';

class Info extends StatefulWidget {
  final String name;
  final String rating;
  final String price;
  final String image;
  final String description;
  final MyObjects myObject;

  const Info(
      {super.key,
      required this.name,
      required this.rating,
      required this.price,
      required this.image,
      required this.description,
      required this.myObject});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final savedController = Get.find<MyObjectsController>();
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: badges.Badge(
                  badgeAnimation: const badges.BadgeAnimation.scale(
                    animationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                  ),
                  badgeStyle: const badges.BadgeStyle(badgeColor: Colors.black),
                  position: badges.BadgePosition.topEnd(top: -10, end: -8),
                  badgeContent: Text(
                    '${savedController.cart.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => const Cart());
                    },
                    icon: const Icon(CupertinoIcons.cart),
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoBanner(),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${widget.price}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7, top: 5),
                      child: RatingBar.builder(
                        initialRating: double.parse(widget.rating),
                        minRating: 0.0,
                        maxRating: 5.0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, top: 3),
                      child: Text(
                        widget.rating,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
                  child: ExpandableText(
                    expandText: 'Read more',
                    collapseText: 'Read less',
                    widget.description,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.black, fontSize: 11),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    "Colors",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Row(
                  children: [
                    MyCircle(color: Colors.black),
                    MyCircle(color: Colors.red),
                    MyCircle(color: Colors.blue),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Sizes (UK)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Sizes(size: "7"),
                      Sizes(size: "8"),
                      Sizes(size: "10"),
                      Sizes(size: "12"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 20),
                  child: InkWell(
                    onTap: () {
                      savedController.toggleCart(widget.myObject);
                      setState(() {});
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: savedController.isAdded(widget.myObject)
                            ? Colors.black
                            : Colors.transparent,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.cart,
                            color: savedController.isAdded(widget.myObject)
                                ? Colors.white
                                : Colors.black,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              savedController.isAdded(widget.myObject)
                                  ? "Added"
                                  : "Add to Cart",
                              style: TextStyle(
                                color: savedController.isAdded(widget.myObject)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              maxLines: 1,
                            ),
                          )
                        ],
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
