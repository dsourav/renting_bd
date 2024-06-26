import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rental_property_model.g.dart';

@JsonSerializable()
class RentalPropertyModel extends Equatable {
  final String ownerId;
  final String title;
  final String description;
  final List<String>? pictureUrls;
  final double price;
  final bool availability;
  final String location;
  final String propertyType;
  @JsonKey(includeFromJson: false)
  final Timestamp? createdAt;

  const RentalPropertyModel(
      {required this.ownerId,
      required this.title,
      required this.description,
      required this.pictureUrls,
      required this.price,
      required this.availability,
      required this.location,
      required this.propertyType,
      this.createdAt});

  factory RentalPropertyModel.fromJson(Map<String, dynamic> json) => _$RentalPropertyModelFromJson(json);

  Map<String, dynamic> toJson() {
    final data = _$RentalPropertyModelToJson(this);
    data['createdAt'] = FieldValue.serverTimestamp();
    return data;
  }

  @override
  List<Object?> get props => [ownerId, title, description, pictureUrls, price, availability, location, propertyType];

  RentalPropertyModel copyWith({
    String? ownerId,
    String? title,
    String? description,
    List<String>? pictureUrls,
    double? price,
    bool? availability,
    String? location,
    String? propertyType,
  }) {
    return RentalPropertyModel(
      ownerId: ownerId ?? this.ownerId,
      title: title ?? this.title,
      description: description ?? this.description,
      pictureUrls: pictureUrls ?? this.pictureUrls,
      price: price ?? this.price,
      availability: availability ?? this.availability,
      location: location ?? this.location,
      propertyType: propertyType ?? this.propertyType,
    );
  }
}
