import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/logger.dart';

class CookBookCategoriesListWidget extends StatelessWidget {
  final double squareHeight;
  final double squareWidth;
  final List<String> imageAssets = [
    'images/categories/pancakes.svg',
    'images/categories/sandwich.svg',
    'images/categories/noodle-bowl.svg',
    'images/categories/cake.svg',
    'images/categories/sushi.svg',
  ];
  CookBookCategoriesListWidget(
      {super.key, this.squareHeight = 65, this.squareWidth = 75});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Breakfast',
      'Lunch',
      'Dinner',
      'Dessert',
      'Snacks'
    ];

    return SizedBox(
      height: squareHeight * 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: PaddingSizes.sm),
            child: Text('Categories', style: AppTextStyles().lThick),
          ),
          SizedBox(
            height: squareHeight + 15, // Adding 10 to add some spacing

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < categories.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: PaddingSizes.xs),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        elevation: 4.0,
                        shadowColor: Colors.grey.withOpacity(0.8),
                        child: InkWell(
                          onTap: () {
                            logger.d('Clicked on ${categories[i]}');
                          },
                          splashColor: Colors.green,
                          borderRadius: BorderRadius.circular(4.0),
                          child: SizedBox(
                            height: squareHeight,
                            width: squareWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  imageAssets[i],
                                  height: squareHeight / 2,
                                  width: squareWidth / 2,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  categories[i],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
