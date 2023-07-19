import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  final String image;
  final String label;

  const Filters({
    Key? key,
    required this.label,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 4,
                    left: 4,
                    child: Container(
                      height: MediaQuery.of(context).size.width / 5.9,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                        color: Colors.pink[200],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: InkWell(
                      onTap: (){},
                      child: ClipOval(
                        child: Container(
                          height: MediaQuery.of(context).size.width / 5,
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
