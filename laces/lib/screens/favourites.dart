import '../widgets/gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../controllers/controller.dart';

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
        
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FavGrid()
          ],
        ),
      ),
    );
  }
}
