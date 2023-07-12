//import 'package:cleats/controllers/controller.dart';
import 'category.dart';
import 'slider.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //final MyObjectsController controller = Get.put(MyObjectsController());
    bool isSelected = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
              child: Text(
            "F I L T E R S ",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10,top: 10),
          child: Text("Select a price range"),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: PriceRangeSliderWidget(),
        ),
        Row(
          children: [
            MyCategory(image: "assets/male.png",isSelected: false,ontap: isSelected = !isSelected),
            MyCategory(image: "assets/female.png",isSelected: false,ontap: isSelected),
          ],
        ),
         const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text("Sizes"),
        ),
         
        /*Row(
          children: [
            Sizes(label: "1",),
            Sizes(label: "2",),
            Sizes(label: "3",),
            Sizes(label: "4",),
          ],
        )*/
      ],
    );
  }
}
