import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laces/model/model.dart';

import '../controllers/controller.dart';

class AddToCart extends StatefulWidget {
  final MyObjects myObject;
  final double mywidth;
  const AddToCart({super.key, required this.myObject,required this.mywidth});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    final savedController = Get.find<MyObjectsController>();

    return Padding(
      padding: const EdgeInsets.only(right: 6, top: 6,bottom: 6),
      child: InkWell(
        onTap: () {
          savedController.toggleCart(widget.myObject);
          setState(() {});
        },
        child: FittedBox(
          child: Container(
            width: widget.mywidth,
            height: 40,
            decoration: BoxDecoration(
                color: savedController.isAdded(widget.myObject)
                    ? Colors.black
                    : Colors.transparent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(7),),
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
      ),
    );
  }
}
