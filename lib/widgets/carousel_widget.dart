import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key, required this.items}) : super(key: key);

  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: CarouselSlider(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          viewportFraction: 0.5,
          enlargeCenterPage: true,
          pageSnapping: false,
        ),
        items: items
            .map(
              (item) => Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    item.userImg,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
