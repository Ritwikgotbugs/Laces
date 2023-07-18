import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          maxWidth: MediaQuery.of(context).size.width  
        ),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(70), 
            boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 0),
            blurRadius: 5,
          ),
        ]),
        child: const MySearch(),
      ),
    );
  }
}

class MySearch extends StatefulWidget {
  const MySearch({super.key});

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
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
          setState(() {});
          },
          icon: const Icon(
            CupertinoIcons.arrow_right_circle_fill,
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



var myDrawer = const Drawer(
    child: Column(
  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    DrawerHeader(child: Text("SneakerSpot")),
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
          fontSize: 20,
        ),
      ),
    );
  }
}




