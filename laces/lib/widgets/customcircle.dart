import 'package:flutter/material.dart';

class MyCircle extends StatefulWidget {
  final Color color;
  const MyCircle({
    super.key,
    required this.color,
  });

  @override
  State<MyCircle> createState() => _MyCircleState();
}

class _MyCircleState extends State<MyCircle> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: InkWell(
        onTap: () {
          isSelected = !isSelected;
          setState(() {});
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.grey, width: 1),
            color: widget.color,
          ),
          child: Icon(Icons.check,color: isSelected? Colors.white:Colors.transparent,),
        ),
      ),
    );
  }
}

class Sizes extends StatefulWidget {
  final String size;

  const Sizes({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<Sizes> createState() => _SizesState();
}

class _SizesState extends State<Sizes> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: ClipOval(
        child: InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(100),
              color: isSelected ? Colors.black : Colors.white,
            ),
            child: Center(
              child: Text(
                widget.size,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
