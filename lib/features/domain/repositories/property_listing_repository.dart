import 'package:dartz/dartz.dart';
import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/features/data/models/rental_property_model.dart';

abstract class PropertyListingRepository {
  Future<Either<Failure, void>> addNewProperties(RentalPropertyModel propertyModel);
}
