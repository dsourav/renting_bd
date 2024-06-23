// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../features/data/data_sources/auth_remote_data_source.dart' as _i9;
import '../../features/data/repositories/auth_repository_impl.dart' as _i11;
import '../../features/domain/repositories/auth_repository.dart' as _i10;
import '../../features/domain/usecases/auth_usecases/add_user_profile_usecase.dart'
    as _i13;
import '../../features/domain/usecases/auth_usecases/login_usecase.dart'
    as _i14;
import '../../features/domain/usecases/auth_usecases/register_usecase.dart'
    as _i12;
import '../../features/presentation/blocs/auth/auth_bloc.dart' as _i7;
import '../utils/progress_indicator.dart' as _i3;
import '../utils/shared_prefs_helper.dart' as _i8;
import 'firebase_module.dart' as _i15;

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
  gh.factory<_i3.ProgressIndicator>(() => _i3.ProgressIndicator());
  gh.lazySingleton<_i4.FirebaseAuth>(() => firebaseModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(() => firebaseModule.firestore);
  await gh.lazySingletonAsync<_i6.SharedPreferences>(
    () => sharedPreferencesModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i7.AuthBloc>(() => _i7.AuthBloc(gh<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i8.SharedPrefsHelper>(
      () => _i8.SharedPrefsHelper(gh<_i6.SharedPreferences>()));
  gh.factory<_i9.AuthRemoteDataSource>(() => _i9.AuthRemoteDataSourceImpl(
        gh<_i4.FirebaseAuth>(),
        gh<_i5.FirebaseFirestore>(),
      ));
  gh.factory<_i10.AuthRepository>(
      () => _i11.AuthRepositoryImpl(gh<_i9.AuthRemoteDataSource>()));
  gh.factory<_i12.RegisterUseCase>(
      () => _i12.RegisterUseCase(gh<_i10.AuthRepository>()));
  gh.factory<_i13.AddUserProfileUseCase>(
      () => _i13.AddUserProfileUseCase(gh<_i10.AuthRepository>()));
  gh.factory<_i14.LoginUseCase>(
      () => _i14.LoginUseCase(gh<_i10.AuthRepository>()));
  return getIt;
}

class _$FirebaseModule extends _i15.FirebaseModule {}

class _$SharedPreferencesModule extends _i8.SharedPreferencesModule {}
