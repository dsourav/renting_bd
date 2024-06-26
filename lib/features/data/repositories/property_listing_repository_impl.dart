import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/features/data/data_sources/property_listing_remote_data_source.dart';
import 'package:renting_bd/features/data/models/rental_property_model.dart';
import 'package:renting_bd/features/domain/repositories/property_listing_repository.dart';

@Injectable(as: PropertyListingRepository)
class PropertyListingRepositoryImpl implements PropertyListingRepository {
  final PropertyListingRemoteDataSource propertyListingRemoteDataSource;

  PropertyListingRepositoryImpl(this.propertyListingRemoteDataSource);

  @override
  Future<Either<Failure, void>> addNewProperties(RentalPropertyModel propertyModel) async {
    try {
      await propertyListingRemoteDataSource.addNewProperties(propertyModel);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
