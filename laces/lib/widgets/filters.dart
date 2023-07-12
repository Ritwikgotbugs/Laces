/*import 'package:cleats/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
    required this.label,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 30,
        child: TextButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              selected ? Colors.amber[300] : Colors.grey[300],
            ),
            foregroundColor: MaterialStateProperty.all(
              Colors.black,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyFilter extends StatelessWidget {
  const MyFilter({super.key});

  @override
  Widget build(BuildContext context) {
    List categories = [
      "All",
      "Jordans",
      "Sliders",
      "Special Editions",
      "High Sneakers",
      "Low Sneaker",
      "Mid Sneakers"
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Obx(
        () => Filter(
          label: categories[index],
          onTap: () {
            selectedIndex.value = index;
            SelectedController.to.selectedCategory = categories[index];
          },
          selected: selected,
        ),
      ),
    );
  }
}
*/