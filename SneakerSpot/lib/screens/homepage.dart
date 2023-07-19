import 'package:flutter/cupertino.dart';
import 'checkout.dart';
import '../constants/constants.dart';
import '/widgets/banners.dart';
import '/widgets/gridview.dart';
import '../widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/controller.dart';
import 'package:badges/badges.dart' as badges;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final MyObjectsController savedController = Get.put(MyObjectsController());

  final List<Filters> filtersList = [
    const Filters(label: "Men", image: "assets/category/man.png"),
    const Filters(label: "Woman", image: "assets/category/woman.png"),
    const Filters(label: "Kids", image: "assets/category/kids.png"),
    const Filters(label: "Sports", image: "assets/category/sports.png"),
    const Filters(label: "Accessories", image: "assets/category/acs.png"),
  ];

  @override
  void initState() {
    super.initState();
    savedController.parseJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          drawer: myDrawer,
          appBar: AppBar(
            title: const Text("SneakerSpot"),
            centerTitle: true,
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
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MySearchBar(),
                BannerWidget(),
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 3.3,
                    child: SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filtersList.length,
                        itemBuilder: (context, index) {
                          return Filters(
                            label: filtersList[index].label,
                            image: filtersList[index].image,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const MyGrid(),
              ],
            ),
          ),
        );
      },
    );
  }
}
