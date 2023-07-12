import '../constants/constants.dart';
import '../widgets/banners.dart';
import '../widgets/gridview.dart';
import '../widgets/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key ?key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final MyObjectsController savedController = Get.put(MyObjectsController());

  final List<Filters> FiltersList = [
    Filters(label: "Men", image: "assets/category/man.png"),
    Filters(label: "Woman", image: "assets/category/woman.png"),
    Filters(label: "Kids", image: "assets/category/kids.png"),
    Filters(label: "Accessories", image: "assets/category/shoe.png"),
    Filters(label: "Female", image: "assets/category/woman.png"),
  ];

  @override
  void initState() {
    super.initState();
    savedController.parseJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cleats"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MySearchBar(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.square_grid_2x2,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: BannerWidget(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: FiltersList.length,
                      itemBuilder: (context, index) {
                        return Material(
                          child: Filters(
                            label: FiltersList[index].label,
                            image: FiltersList[index].image,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const CustomGrid()
              ],
            ),
          ),
        ],
      ),
     bottomNavigationBar: const MyBottomNav(),
    );
  }
}
