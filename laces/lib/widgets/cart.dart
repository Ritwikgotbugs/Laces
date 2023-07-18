//import 'package:cleats/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../model/model.dart';

class GridCard extends StatefulWidget {
  final String name;
  final String rating;
  final String price;
  final String image;
  final String description;
  final MyObjects myObject;

  const GridCard({
    super.key,
    required this.name,
    required this.rating,
    required this.price,
    required this.image,
    required this.description,
    required this.myObject,
  });

  @override
  State<GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  final savedController = Get.find<MyObjectsController>();
  @override
  Widget build(BuildContext context) {
    var num = 1;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[150],
          borderRadius: BorderRadius.circular(0),
        ),
        child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 150,
                              child: AspectRatio(
                                aspectRatio: 0.8,
                                child: Image.asset(
                                  widget.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF191B26),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text("Color: Red",style: TextStyle(fontSize: 16),),
                              const Text("Size: 8",style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  top: 130,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            --num;
                            setState(() {
                              
                            });
                          },
                          icon: const Icon(
                            CupertinoIcons.minus,
                            size: 16,
                          ),
                        ),
                        Text(
                          "$num",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ++num;
                            setState(() {
                              
                            });
                          },
                          icon: const Icon(
                            CupertinoIcons.plus,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 140,
                  top: 130,
                  child: Text(
                    '\$${widget.price}',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      savedController.toggleCart(widget.myObject);
                      setState(() {});
                    },
                    icon: const Icon(
                      CupertinoIcons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CartGrid extends StatelessWidget {
  const CartGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final MyObjectsController savedController = Get.put(MyObjectsController());
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: savedController.cart.length,
        itemBuilder: ((context, index) {
          final myObject = savedController.cart[index];
          return GridCard(
            name: myObject.name,
            rating: myObject.rating,
            price: myObject.price,
            image: myObject.image,
            description: myObject.description,
            myObject: myObject,
          );
        }),
      ),
    );
  }
}
