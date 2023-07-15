import '../constants/constants.dart';
import '/widgets/banners.dart';
import '/widgets/gridview.dart';
import '../widgets/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/controller.dart';

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
    const Filters(label: "Accessories", image: "assets/category/shoe.png"),
    const Filters(label: "Female", image: "assets/category/woman.png"),
  ];

  @override
  void initState() {
    super.initState();
    savedController.parseJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer,
      appBar: AppBar(
        title: const Text("Laces"),
        centerTitle: true,
        actions: [
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MySearchBar(),
            BannerWidget(),
            Flexible(
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
            const MyGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNav(),
    );
  }
}
