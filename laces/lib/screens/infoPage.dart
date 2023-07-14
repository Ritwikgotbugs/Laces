import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:laces/controllers/controller.dart';
import 'package:laces/widgets/customcircle.dart';
import 'package:laces/widgets/infobanner.dart';

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
    final savedController = Get.find<MyObjectsController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoBanner(),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${widget.price}",
                    style: TextStyle(
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
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
              child: Text(
                widget.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 11),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Colors",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              children: [
                MyCircle(color: Colors.black),
                MyCircle(color: Colors.red),
                MyCircle(color: Colors.blue),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Sizes (UK)",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
              padding: const EdgeInsets.only(left:20,right: 20,top: 5,bottom: 20),
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
                        ? Colors.amber
                        : Colors.transparent,
                        border: Border.all(color: Colors.black)
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.cart,
                          color: Colors.black,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            savedController.isAdded(widget.myObject)
                                ? "Added"
                                : "Add to Bag",
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
