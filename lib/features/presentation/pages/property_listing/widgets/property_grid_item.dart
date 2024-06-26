import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renting_bd/core/utils/ui_helper.dart';
import 'package:renting_bd/features/presentation/widgets/app_network_image.dart';

class PropertyGridItem extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final double price;
  final bool availability;

  const PropertyGridItem({
    super.key,
    this.imageUrl,
    required this.title,
    required this.price,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiHelper.defaultBorderRadius),
        ),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(UiHelper.defaultBorderRadius)),
                child: AppNetworkImage(
                  imageUrl: imageUrl,
                  imageShape: ImageShape.square,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '\$${price.toString()}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(color: availability ? Colors.green : Colors.red),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    availability ? "Available" : "Unavailable",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
