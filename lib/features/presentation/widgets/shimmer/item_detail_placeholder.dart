import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:renting_bd/features/presentation/widgets/shimmer/placeholders.dart';

class ItemDetailPlaceholder extends StatelessWidget {
  const ItemDetailPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            BannerPlaceholder(),
            SizedBox(height: 40),
            TitlePlaceholder(width: 100.0),
            SizedBox(height: 20),
            TitlePlaceholder(width: 200.0),
            SizedBox(height: 20),
            TitlePlaceholder(width: 200.0)
          ],
        ),
      ),
    );
  }
}
