// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentalPropertyModel _$RentalPropertyModelFromJson(Map<String, dynamic> json) =>
    RentalPropertyModel(
      ownerId: json['ownerId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      pictureUrls: (json['pictureUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      price: (json['price'] as num).toDouble(),
      availability: json['availability'] as bool,
      location: json['location'] as String,
      propertyType: json['propertyType'] as String,
    );

Map<String, dynamic> _$RentalPropertyModelToJson(
        RentalPropertyModel instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'title': instance.title,
      'description': instance.description,
      'pictureUrls': instance.pictureUrls,
      'price': instance.price,
      'availability': instance.availability,
      'location': instance.location,
      'propertyType': instance.propertyType,
    };
