import 'package:flutter/material.dart';
import 'package:renting_bd/features/data/models/rental_property_model.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'widgets/property_grid_item.dart';

class TenantAvailablePropertyListPage extends StatelessWidget {
  const TenantAvailablePropertyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FirestorePagination(
        query: FirebaseFirestore.instance.collection("properties").orderBy('createdAt'),
        viewType: ViewType.grid,
        itemBuilder: (context, docs, index) {
          final data = docs.data() as Map<String, dynamic>;
          final property = RentalPropertyModel.fromJson(data);
          final picture = property.pictureUrls ?? [];

          return PropertyGridItem(
            availability: property.availability,
            title: property.title,
            price: property.price,
            imageUrl: picture.isEmpty ? null : picture.first,
          );
        },
      ),
    );
  }
}
