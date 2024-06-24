import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'landlord_property_list_state.dart';

class LandlordPropertyListCubit extends Cubit<LandlordPropertyListState> {
  LandlordPropertyListCubit() : super(LandlordPropertyListInitial());
}
