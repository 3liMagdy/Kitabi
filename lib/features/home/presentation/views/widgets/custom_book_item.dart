import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomBookImage extends StatelessWidget {
  const CustomBookImage(this.imageUrl, {super.key});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child:CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}
