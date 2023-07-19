import 'package:flutter/material.dart';

class MyCategory extends StatelessWidget {
  final String image;
  final bool isSelected;
  final bool ontap;
  const MyCategory(
      {Key? key,
      required this.image,
      required this.isSelected,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          ontap;
        },
        child: Container(
          height: MediaQuery.of(context).size.width / 7,
          width: MediaQuery.of(context).size.width / 6,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: isSelected ? Colors.amber : Colors.black),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: 80,
            height: MediaQuery.of(context).size.width / 8,
            child: ClipRRect(
              child: AspectRatio(
                aspectRatio: 1,
                child: Center(child: Image.asset(image)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
