import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/features/data/models/rental_property_model.dart';

abstract class PropertyListingRemoteDataSource {
  Future<void> addNewProperties(RentalPropertyModel propertyModel);
}

@Injectable(as: PropertyListingRemoteDataSource)
class PropertyListingRemoteDataSourceImpl implements PropertyListingRemoteDataSource {
  final FirebaseFirestore firestore;
  PropertyListingRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> addNewProperties(RentalPropertyModel propertyModel) {
    return firestore.collection('properties').add(propertyModel.toJson());
  }
}
