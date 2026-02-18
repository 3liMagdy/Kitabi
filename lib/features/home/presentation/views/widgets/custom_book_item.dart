import 'package:flutter/material.dart';
import 'package:kitabi/core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(AssetsData.test_image),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
