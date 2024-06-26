part of 'add_new_properties_cubit.dart';

class AddNewPropertiesState extends Equatable {
  final bool isAvailable;
  final String propertyType;
  final String location;
  final XFile? xFile;

  const AddNewPropertiesState({
    this.isAvailable = true,
    this.propertyType = PropertyType.apartment,
    this.location = LocationType.dhaka,
    this.xFile,
  });

  AddNewPropertiesState copyWith({
    bool? isAvailable,
    String? propertyType,
    String? location,
    XFile? xFile,
  }) {
    return AddNewPropertiesState(
      isAvailable: isAvailable ?? this.isAvailable,
      propertyType: propertyType ?? this.propertyType,
      location: location ?? this.location,
      xFile: xFile ?? this.xFile,
    );
  }

  @override
  List<Object?> get props => [isAvailable, propertyType, location, xFile];
}
