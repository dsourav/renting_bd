// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../features/data/data_sources/auth_remote_data_source.dart' as _i14;
import '../../features/data/data_sources/property_listing_remote_data_source.dart'
    as _i12;
import '../../features/data/repositories/auth_repository_impl.dart' as _i16;
import '../../features/data/repositories/property_listing_repository_impl.dart'
    as _i26;
import '../../features/domain/repositories/auth_repository.dart' as _i15;
import '../../features/domain/repositories/property_listing_repository.dart'
    as _i25;
import '../../features/domain/usecases/auth_usecases/login_usecase.dart'
    as _i18;
import '../../features/domain/usecases/auth_usecases/register_usecase.dart'
    as _i17;
import '../../features/domain/usecases/profile_usecases/add_user_profile_usecase.dart'
    as _i19;
import '../../features/domain/usecases/profile_usecases/fetch_user_profile_usecase.dart'
    as _i20;
import '../../features/domain/usecases/profile_usecases/update_user_profile_usecase.dart'
    as _i21;
import '../../features/domain/usecases/property_listing_usecases/add_property_usecase.dart'
    as _i29;
import '../../features/presentation/blocs/auth/auth_bloc.dart' as _i23;
import '../../features/presentation/cubits/add_new_properties/add_new_properties_cubit.dart'
    as _i30;
import '../../features/presentation/cubits/login/login_cubit.dart' as _i24;
import '../../features/presentation/cubits/profile/profile_cubit.dart' as _i28;
import '../../features/presentation/cubits/register/register_cubit.dart'
    as _i22;
import '../../features/presentation/cubits/update_profile/update_profile_cubit.dart'
    as _i27;
import '../router/app_router.dart' as _i4;
import '../services/cloud_storage_service.dart' as _i11;
import '../services/image_picker_service.dart' as _i10;
import '../utils/progress_indicator.dart' as _i3;
import '../utils/shared_prefs_helper.dart' as _i13;
import 'firebase_module.dart' as _i31;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseModule = _$FirebaseModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  final firebaseStorageModule = _$FirebaseStorageModule();
  final imagePickerModule = _$ImagePickerModule();
  gh.factory<_i3.ProgressIndicator>(() => _i3.ProgressIndicator());
  gh.singleton<_i4.AppRouter>(() => _i4.AppRouter());
  gh.lazySingleton<_i5.FirebaseAuth>(() => firebaseModule.firebaseAuth);
  gh.lazySingleton<_i6.FirebaseFirestore>(() => firebaseModule.firestore);
  await gh.lazySingletonAsync<_i7.SharedPreferences>(
    () => sharedPreferencesModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i8.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage);
  gh.lazySingleton<_i9.ImagePicker>(() => imagePickerModule.imagePicker);
  gh.factory<_i10.ImagePickerService>(
      () => _i10.ImagePickerService(gh<_i9.ImagePicker>()));
  gh.factory<_i11.CloudStorageService>(
      () => _i11.CloudStorageService(gh<_i8.FirebaseStorage>()));
  gh.factory<_i12.PropertyListingRemoteDataSource>(() =>
      _i12.PropertyListingRemoteDataSourceImpl(
          firestore: gh<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i13.SharedPrefsHelper>(
      () => _i13.SharedPrefsHelper(gh<_i7.SharedPreferences>()));
  gh.factory<_i14.AuthRemoteDataSource>(() => _i14.AuthRemoteDataSourceImpl(
        gh<_i5.FirebaseAuth>(),
        gh<_i6.FirebaseFirestore>(),
      ));
  gh.factory<_i15.AuthRepository>(() => _i16.AuthRepositoryImpl(
        gh<_i14.AuthRemoteDataSource>(),
        gh<_i13.SharedPrefsHelper>(),
      ));
  gh.factory<_i17.RegisterUseCase>(
      () => _i17.RegisterUseCase(gh<_i15.AuthRepository>()));
  gh.factory<_i18.LoginUseCase>(
      () => _i18.LoginUseCase(gh<_i15.AuthRepository>()));
  gh.factory<_i19.AddUserProfileUseCase>(
      () => _i19.AddUserProfileUseCase(gh<_i15.AuthRepository>()));
  gh.factory<_i20.FetchUserProfileUseCase>(
      () => _i20.FetchUserProfileUseCase(gh<_i15.AuthRepository>()));
  gh.factory<_i21.UpdateUserProfileUseCase>(
      () => _i21.UpdateUserProfileUseCase(gh<_i15.AuthRepository>()));
  gh.factory<_i22.RegisterCubit>(() => _i22.RegisterCubit(
        gh<_i17.RegisterUseCase>(),
        gh<_i19.AddUserProfileUseCase>(),
        gh<_i3.ProgressIndicator>(),
        gh<_i4.AppRouter>(),
        gh<_i5.FirebaseAuth>(),
        gh<_i13.SharedPrefsHelper>(),
      ));
  gh.factory<_i23.AuthBloc>(() => _i23.AuthBloc(
        gh<_i5.FirebaseAuth>(),
        gh<_i13.SharedPrefsHelper>(),
        gh<_i4.AppRouter>(),
      ));
  gh.factory<_i24.LoginCubit>(() => _i24.LoginCubit(
        gh<_i18.LoginUseCase>(),
        gh<_i20.FetchUserProfileUseCase>(),
        gh<_i5.FirebaseAuth>(),
        gh<_i13.SharedPrefsHelper>(),
        gh<_i4.AppRouter>(),
        gh<_i3.ProgressIndicator>(),
      ));
  gh.factory<_i25.PropertyListingRepository>(() =>
      _i26.PropertyListingRepositoryImpl(
          gh<_i12.PropertyListingRemoteDataSource>()));
  gh.factory<_i27.UpdateProfileCubit>(() => _i27.UpdateProfileCubit(
        gh<_i10.ImagePickerService>(),
        gh<_i21.UpdateUserProfileUseCase>(),
        gh<_i11.CloudStorageService>(),
        gh<_i3.ProgressIndicator>(),
      ));
  gh.factory<_i28.ProfileCubit>(() => _i28.ProfileCubit(
        gh<_i21.UpdateUserProfileUseCase>(),
        gh<_i20.FetchUserProfileUseCase>(),
      ));
  gh.factory<_i29.AddPropertyUseCase>(
      () => _i29.AddPropertyUseCase(gh<_i25.PropertyListingRepository>()));
  gh.factory<_i30.AddNewPropertiesCubit>(() => _i30.AddNewPropertiesCubit(
        gh<_i11.CloudStorageService>(),
        gh<_i10.ImagePickerService>(),
        gh<_i3.ProgressIndicator>(),
        gh<_i29.AddPropertyUseCase>(),
      ));
  return getIt;
}

class _$FirebaseModule extends _i31.FirebaseModule {}

class _$SharedPreferencesModule extends _i13.SharedPreferencesModule {}

class _$FirebaseStorageModule extends _i11.FirebaseStorageModule {}

class _$ImagePickerModule extends _i10.ImagePickerModule {}
