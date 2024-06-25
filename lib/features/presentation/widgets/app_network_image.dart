import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:renting_bd/core/utils/constant.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final ImageShape imageShape;
  final Size? size;
  final BoxFit? fit;
  final Widget? errorWidget;
  const AppNetworkImage(
      {super.key,
      this.size,
      this.fit = BoxFit.cover,
      this.imageShape = ImageShape.circular,
      required this.imageUrl,
      this.errorWidget});

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              width: size?.width ?? 80.0,
              height: size?.height ?? 80.0,
              decoration: BoxDecoration(
                shape: imageShape == ImageShape.circular ? BoxShape.circle : BoxShape.rectangle,
                image: DecorationImage(image: imageProvider, fit: fit),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: SizedBox(height: 20.0, width: 20.0, child: CircularProgressIndicator())),
            errorWidget: (context, url, error) =>
                errorWidget ??
                ErrorImage(
                  imageShape: imageShape,
                  size: Size(size?.width ?? 80.0, size?.height ?? 80.0),
                ),
          )
        : ErrorImage(
            imageShape: imageShape,
            size: Size(size?.width ?? 80.0, size?.height ?? 80.0),
          );
  }
}

class ErrorImage extends StatelessWidget {
  final ImageShape imageShape;
  final Size? size;
  const ErrorImage({
    Key? key,
    required this.imageShape,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width ?? 80.0,
      height: size?.height ?? 80.0,
      decoration: BoxDecoration(
        shape: imageShape == ImageShape.circular ? BoxShape.circle : BoxShape.rectangle,
        image: const DecorationImage(image: AssetImage(Constant.noImageIcon), fit: BoxFit.fill),
      ),
    );
  }
}

enum ImageShape { circular, square }
