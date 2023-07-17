//import 'package:cleats/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laces/constants/addtocart.dart';
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
      padding: const EdgeInsets.only(top: 10,),
      child: InkWell(
        onTap: () {
          Get.to(() => Info(
                name: widget.name,
                description: widget.description,
                price: widget.price,
                rating: widget.rating,
                myObject: widget.myObject,
                image: widget.image,
              ));
        },
        borderRadius: BorderRadius.circular(0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[150], borderRadius: BorderRadius.circular(0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                            fontSize: 16,
                            color: Color(0xFF191B26),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '\$${widget.price}',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Color: Red"),
                        const Text("Size: 8"),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: AddToCart(
                            myObject: widget.myObject,
                            mywidth: MediaQuery.of(context).size.width/4,
                          ),
                        )
                      ],
                    ),
                  ),
                  
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
          ),
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
      ()=>
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: savedController.cart.length,
        itemBuilder: ((context, index) {
          final myObject = savedController.cart[index];
          return GridCard(
              name: myObject.name,
              rating: myObject.rating,
              price: myObject.price,
              image: myObject.image,
              description: myObject.description,
              myObject: myObject);
        }),
      ),
    );
  }
}
