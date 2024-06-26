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

import '../../features/data/data_sources/auth_remote_data_source.dart' as _i13;
import '../../features/data/repositories/auth_repository_impl.dart' as _i15;
import '../../features/domain/repositories/auth_repository.dart' as _i14;
import '../../features/domain/usecases/auth_usecases/login_usecase.dart'
    as _i17;
import '../../features/domain/usecases/auth_usecases/register_usecase.dart'
    as _i16;
import '../../features/domain/usecases/profile_usecase/add_user_profile_usecase.dart'
    as _i18;
import '../../features/domain/usecases/profile_usecase/fetch_user_profile_usecase.dart'
    as _i19;
import '../../features/domain/usecases/profile_usecase/update_user_profile_usecase.dart'
    as _i20;
import '../../features/presentation/blocs/auth/auth_bloc.dart' as _i23;
import '../../features/presentation/cubits/login/login_cubit.dart' as _i22;
import '../../features/presentation/cubits/profile/profile_cubit.dart' as _i25;
import '../../features/presentation/cubits/register/register_cubit.dart'
    as _i21;
import '../../features/presentation/cubits/update_profile/update_profile_cubit.dart'
    as _i24;
import '../router/app_router.dart' as _i4;
import '../services/cloud_storage_service.dart' as _i11;
import '../services/image_picker_service.dart' as _i10;
import '../utils/progress_indicator.dart' as _i3;
import '../utils/shared_prefs_helper.dart' as _i12;
import 'firebase_module.dart' as _i26;

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
  gh.lazySingleton<_i12.SharedPrefsHelper>(
      () => _i12.SharedPrefsHelper(gh<_i7.SharedPreferences>()));
  gh.factory<_i13.AuthRemoteDataSource>(() => _i13.AuthRemoteDataSourceImpl(
        gh<_i5.FirebaseAuth>(),
        gh<_i6.FirebaseFirestore>(),
      ));
  gh.factory<_i14.AuthRepository>(() => _i15.AuthRepositoryImpl(
        gh<_i13.AuthRemoteDataSource>(),
        gh<_i12.SharedPrefsHelper>(),
      ));
  gh.factory<_i16.RegisterUseCase>(
      () => _i16.RegisterUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i17.LoginUseCase>(
      () => _i17.LoginUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i18.AddUserProfileUseCase>(
      () => _i18.AddUserProfileUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i19.FetchUserProfileUseCase>(
      () => _i19.FetchUserProfileUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i20.UpdateUserProfileUseCase>(
      () => _i20.UpdateUserProfileUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i21.RegisterCubit>(() => _i21.RegisterCubit(
        gh<_i16.RegisterUseCase>(),
        gh<_i18.AddUserProfileUseCase>(),
        gh<_i3.ProgressIndicator>(),
        gh<_i4.AppRouter>(),
        gh<_i5.FirebaseAuth>(),
        gh<_i12.SharedPrefsHelper>(),
      ));
  gh.factory<_i22.LoginCubit>(() => _i22.LoginCubit(
        gh<_i17.LoginUseCase>(),
        gh<_i19.FetchUserProfileUseCase>(),
        gh<_i5.FirebaseAuth>(),
        gh<_i12.SharedPrefsHelper>(),
        gh<_i4.AppRouter>(),
        gh<_i3.ProgressIndicator>(),
      ));
  gh.factory<_i23.AuthBloc>(() => _i23.AuthBloc(
        gh<_i5.FirebaseAuth>(),
        gh<_i12.SharedPrefsHelper>(),
        gh<_i4.AppRouter>(),
      ));
  gh.factory<_i24.UpdateProfileCubit>(() => _i24.UpdateProfileCubit(
        gh<_i10.ImagePickerService>(),
        gh<_i20.UpdateUserProfileUseCase>(),
        gh<_i11.CloudStorageService>(),
        gh<_i3.ProgressIndicator>(),
      ));
  gh.factory<_i25.ProfileCubit>(() => _i25.ProfileCubit(
        gh<_i20.UpdateUserProfileUseCase>(),
        gh<_i19.FetchUserProfileUseCase>(),
      ));
  return getIt;
}

class _$FirebaseModule extends _i26.FirebaseModule {}

class _$SharedPreferencesModule extends _i12.SharedPreferencesModule {}

class _$FirebaseStorageModule extends _i11.FirebaseStorageModule {}

class _$ImagePickerModule extends _i10.ImagePickerModule {}
