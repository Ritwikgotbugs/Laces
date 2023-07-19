import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import '../widgets/gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../controllers/controller.dart';
import 'checkout.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});
  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  final savedController = Get.find<MyObjectsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const MyTitle(title: "Favorites"),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Obx(
            ()=>
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
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [FavGrid()],
        ),
      ),
    );
  }
}
