import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  final Color color;
  const MyCircle({super.key, required this.color,});

  @override
  Widget build(BuildContext context) {
    const int selectedIndex = 0;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: InkWell(
        onTap: () => selectedIndex,
        child: ClipOval(
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey, width: 1),
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}



class Sizes extends StatelessWidget {
  final String size;
  const Sizes({super.key, required this.size,});

  @override
  Widget build(BuildContext context) {
    const int selectedIndex = 0;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: InkWell(
        onTap: () => selectedIndex,
        child: ClipOval(
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,),
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Center(child: Text(size,style: TextStyle(color: Colors.black,fontSize: 11),)),
          ),
        ),
      ),
    );
  }
}
