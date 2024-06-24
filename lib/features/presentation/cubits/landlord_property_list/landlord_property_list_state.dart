part of 'landlord_property_list_cubit.dart';

sealed class LandlordPropertyListState extends Equatable {
  const LandlordPropertyListState();

  @override
  List<Object> get props => [];
}

final class LandlordPropertyListInitial extends LandlordPropertyListState {}
