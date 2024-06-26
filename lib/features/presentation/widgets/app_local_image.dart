import 'dart:io';

import 'package:flutter/material.dart';
import 'package:renting_bd/features/presentation/widgets/app_network_image.dart';

class AppLocalImage extends StatelessWidget {
  final String imageUrl;
  final ImageShape imageShape;
  final Size? size;
  final BoxFit? fit;
  final double? radius;

  const AppLocalImage({
    super.key,
    required this.imageUrl,
    required this.imageShape,
    this.size,
    this.fit,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final imageFile = FileImage(File(imageUrl));

    if (imageShape == ImageShape.circular) {
      return CircleAvatar(backgroundImage: imageFile, radius: radius ?? 25.0);
    } else {
      return Container(
        height: size?.height,
        width: size?.width,
        decoration: BoxDecoration(image: DecorationImage(image: imageFile, fit: fit)),
      );
    }
  }
}
