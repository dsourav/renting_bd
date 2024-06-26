import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/core/utils/usecase.dart';
import 'package:renting_bd/features/data/models/rental_property_model.dart';
import 'package:renting_bd/features/domain/repositories/property_listing_repository.dart';

@Injectable()
class AddPropertyUseCase implements UseCase<void, AddPropertyParams> {
  final PropertyListingRepository propertyListingRepository;
  AddPropertyUseCase(this.propertyListingRepository);

  @override
  Future<Either<Failure, void>> call(AddPropertyParams params) {
    return propertyListingRepository.addNewProperties(RentalPropertyModel(
      availability: params.availability,
      description: params.description,
      location: params.location,
      ownerId: params.ownerId,
      pictureUrls: params.pictureUrls,
      price: params.price,
      propertyType: params.propertyType,
      title: params.title,
    ));
  }
}

class AddPropertyParams extends Equatable {
  final String ownerId;
  final String title;
  final String description;
  final List<String> pictureUrls;
  final double price;
  final bool availability;
  final String location;
  final String propertyType;

  const AddPropertyParams({
    required this.ownerId,
    required this.title,
    required this.description,
    required this.pictureUrls,
    required this.price,
    required this.availability,
    required this.location,
    required this.propertyType,
  });

  @override
  List<Object?> get props => [
        ownerId,
        title,
        description,
        pictureUrls,
        price,
        availability,
        location,
        propertyType,
      ];
}
