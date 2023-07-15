//import 'package:cleats/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../model/model.dart';
import '../screens/infopage.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 1.5, right: 1.5, bottom: 2),
      child: InkWell(
        onTap: () {
          Get.to(() => Info(name: widget.name,description: widget.description,price: widget.price,rating: widget.rating,myObject: widget.myObject,image: widget.image,));
        },
        borderRadius: BorderRadius.circular(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: SizedBox(
                    height: 220,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                      icon: savedController.isFavorite(widget.myObject)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                      onPressed: () {
                        savedController.toggleFav(widget.myObject);
                        setState(() {});
                      }),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF191B26),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      widget.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[700], fontSize: 11),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Row(
                      children: [
                        RatingBar.builder(
                          initialRating: double.parse(widget.rating),
                          minRating: 0.0,
                          maxRating: 5.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 10,
                          ),
                          onRatingUpdate: (rating) {
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            widget.rating,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      '\$${widget.price}',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6, top: 6),
                    child: InkWell(
                      onTap: () {
                        savedController.toggleCart(widget.myObject);
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: savedController.isAdded(widget.myObject)
                                ? Colors.amber
                                : Colors.transparent,
                            border: Border.all(color: Colors.amber)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.cart,
                                color: savedController.isAdded(widget.myObject)
                                    ? Colors.black
                                    : Colors.amber,
                                size: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(
                                  savedController.isAdded(widget.myObject)
                                      ? "Added"
                                      : "Add to Bag",
                                  style: TextStyle(
                                    color:
                                        savedController.isAdded(widget.myObject)
                                            ? Colors.black
                                            : Colors.amber,
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final MyObjectsController savedController = Get.put(MyObjectsController());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 0.5,
      ),
      itemCount: savedController.myObjects.length,
      itemBuilder: ((context, index) {
        final myObject = savedController.myObjects[index];
        return GridCard(
            name: myObject.name,
            rating: myObject.rating,
            price: myObject.price,
            image: myObject.image,
            description: myObject.descripton,
            myObject: myObject);
      }),
    );
  }
}

class FavGrid extends StatelessWidget {
  const FavGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final MyObjectsController savedController = Get.put(MyObjectsController());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 0.5,
      ),
      itemCount: savedController.saved.length,
      itemBuilder: ((context, index) {
        final myObject = savedController.saved[index];
        return GridCard(
            name: myObject.name,
            rating: myObject.rating,
            price: myObject.price,
            image: myObject.image,
            description: myObject.descripton,
            myObject: myObject);
      }),
    );
  }
}
