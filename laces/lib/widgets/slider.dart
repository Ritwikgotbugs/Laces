import 'package:flutter/material.dart';

class PriceRangeSliderWidget extends StatefulWidget {
  const PriceRangeSliderWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PriceRangeSliderWidgetState createState() => _PriceRangeSliderWidgetState();
}

class _PriceRangeSliderWidgetState extends State<PriceRangeSliderWidget> {
  double _minPrice = 0.0;
  double _maxPrice = 1000.0;
  

  @override
  Widget build(BuildContext context) {
    int min = _minPrice.toInt();
    int max = _maxPrice.toInt();
    return Column(
      children: [
        RangeSlider(
          values: RangeValues(_minPrice, _maxPrice),
          min: 0,
          max: 1000,
          divisions: 100,
          activeColor: Colors.amber,
          onChanged: (RangeValues values) {
            setState(() {
              _minPrice = values.start;
              _maxPrice = values.end;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Min Price: \$$min',
                  style: const TextStyle(
                    color: Colors.black,
                  )),
              Text('Max Price: \$$max',
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
