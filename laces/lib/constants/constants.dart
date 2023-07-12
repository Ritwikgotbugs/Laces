import '../screens/favourites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/controller.dart';
import '../widgets/bottomsheet.dart';
import 'package:get/get.dart';

final searchcontroller = TextEditingController();

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width -
              65, // Set the maximum width for larger screens
        ),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(70), 
            boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 0),
            blurRadius: 5,
          )
        ]),
        child: const MySearch(),
      ),
    );
  }
}

class MySearch extends StatelessWidget {
  const MySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchcontroller,
      keyboardType: TextInputType.name,
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Search",
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        hintStyle: const TextStyle(color: Colors.black, fontSize: 17),
        suffixIcon: IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: false,
              context: context,
              builder: (BuildContext context) {
                return const MyBottomSheet();
              },
            );
          },
          icon: const Icon(
            CupertinoIcons.slider_horizontal_3,
            size: 25,
            color: Colors.black,
          ),
        ),
        prefixIcon: const Icon(
          CupertinoIcons.search,
          color: Colors.black,
          size: 25,
        ),
        hoverColor: null,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 0,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(70),
          borderSide: const BorderSide(
            width: 0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({Key? key}) : super(key: key);

  @override
  _MyBottomNavState createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  final MyObjectsController savedController = Get.put(MyObjectsController());

  /*final Map<String, Widget> _screens = {
    "Home": const Homepage(),
    "Search": const Search(),
    "Saved": const Saved(),
    "Cart": const Checkout(),
  };*/

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        destinations: [
          NavigationDestination(
            icon: const Icon(CupertinoIcons.house),
            selectedIcon: Icon(
              CupertinoIcons.house_fill,
              color: savedController.selectedNavIndex == 0
                  ? const Color.fromARGB(255, 255, 115, 0)
                  : Colors.black,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: const Icon(CupertinoIcons.search),
            selectedIcon: Icon(
              CupertinoIcons.search,
              color: savedController.selectedNavIndex == 1
                  ? const Color.fromARGB(255, 255, 115, 0)
                  : Colors.black,
            ),
            label: "Search",
          ),
          NavigationDestination(
            icon: IconButton(
                onPressed: () {
                  Get.to(const Saved());
                },
                icon: const Icon(CupertinoIcons.heart)),
            selectedIcon: Icon(
              CupertinoIcons.heart_fill,
              color: savedController.selectedNavIndex == 2
                  ? const Color.fromARGB(255, 255, 115, 0)
                  : Colors.black,
            ),
            label: "Saved",
          ),
          NavigationDestination(
            icon: const Icon(CupertinoIcons.cart),
            selectedIcon: Icon(
              CupertinoIcons.cart_fill,
              color: savedController.selectedNavIndex == 3
                  ? const Color.fromARGB(255, 255, 115, 0)
                  : Colors.black,
            ),
            label: "Profile",
          ),
        ],
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        shadowColor: Colors.transparent,
        elevation: 2,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        selectedIndex: savedController.selectedNavIndex,
        onDestinationSelected: (index) =>
            savedController.selectedNavIndex = index,
      ),
    );
  }
}

var myDrawer = const Drawer(
    child: Column(
  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    DrawerHeader(child: Text("PREACH")),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text("S E T T I N G S"),
    ),
    ListTile(
      leading: Icon(Icons.account_circle),
      title: Text("A C C O U N T"),
    ),
    ListTile(
      leading: Icon(Icons.home),
      title: Text("D A S H B O A R D"),
    ),
    ListTile(
      leading: Icon(Icons.logout),
      title: Text("L O G O U T"),
    ),
    Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "v1.0.0",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    ),
  ],
));

class MyTitle extends StatelessWidget {
  final String title;
  const MyTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
  }
}

class MyCircles extends StatelessWidget {
  final Color fill;
  const MyCircles({super.key, required this.fill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: ClipOval(
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color.fromARGB(136, 110, 110, 110), width: 1),
              color: fill),
        ),
      ),
    );
  }
}


class MyColors extends StatelessWidget {
  final Color color;

  MyColors({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5),
      child: Container(
        height: MediaQuery.of(context).size.width / 13,
        width: MediaQuery.of(context).size.width / 13,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
