import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting_bd/features/data/models/rental_property_model.dart';
import 'package:renting_bd/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:renting_bd/features/presentation/widgets/app_network_image.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'widgets/property_grid_item.dart';

class LandlordPropertyListPage extends StatelessWidget {
  const LandlordPropertyListPage({super.key});

  //@TODO proper structure
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    return FirestorePagination(
      query: FirebaseFirestore.instance
          .collection("properties")
          .where('ownerId', isEqualTo: user?.uid.toString())
          .orderBy('createdAt'),
      viewType: ViewType.grid,
      isLive: false,
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
    );
  }
}
