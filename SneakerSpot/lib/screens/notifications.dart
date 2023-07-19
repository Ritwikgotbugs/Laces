import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../controllers/controller.dart';
import 'checkout.dart';

class NotifsPage extends StatefulWidget {
  const NotifsPage({super.key});
  @override
  State<NotifsPage> createState() => _NotifsPageState();
}

class _NotifsPageState extends State<NotifsPage> {
  final NotifsPageController = Get.find<MyObjectsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const MyTitle(title: "Notifications"),
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
                  '${NotifsPageController.cart.length}',
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
    );
  }
}
