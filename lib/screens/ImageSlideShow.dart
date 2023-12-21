import 'package:flutter/material.dart';
import 'package:scaled_list/scaled_list.dart';

class ImageSlideShow extends StatefulWidget {
  const ImageSlideShow({super.key});

  @override
  State<ImageSlideShow> createState() => _ImageSlideShowState();
}

class _ImageSlideShowState extends State<ImageSlideShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaledList(
          itemCount: categories.length,
          itemColor: (index) {
            return kMixedColors[index % kMixedColors.length];
          },
          itemBuilder: (index, selectedIndex) {
            final category = categories[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: selectedIndex == index ? 140 : 110,
                  child: Image.asset(category.image),
                ),
                SizedBox(height: 15,),
                Text(
                  category.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: selectedIndex == index ? 25 : 20
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  // create mixed color class
  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];
  // create list category image
final List<Category> categories = [
    Category(image: "images/beef.png", name: "Beef"),
    Category(image: "images/chicken.png", name: "Chicken"),
    Category(image: "images/dessert.png", name: "Dessert"),
    Category(image: "images/lamb.png", name: "Lamb"),
    Category(image: "images/pasta.png", name: "Pasta"),
    Category(image: "images/pork.png", name: "Pork")
  ];
}

// Create category class
class Category {
  final String image;
  final String name;

  Category({required this.image, required this.name});
}
