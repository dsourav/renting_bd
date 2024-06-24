// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../features/data/data_sources/auth_remote_data_source.dart' as _i10;
import '../../features/data/repositories/auth_repository_impl.dart' as _i12;
import '../../features/domain/repositories/auth_repository.dart' as _i11;
import '../../features/domain/usecases/auth_usecases/add_user_profile_usecase.dart'
    as _i14;
import '../../features/domain/usecases/auth_usecases/fetch_user_profile_usecase.dart'
    as _i16;
import '../../features/domain/usecases/auth_usecases/login_usecase.dart'
    as _i15;
import '../../features/domain/usecases/auth_usecases/register_usecase.dart'
    as _i13;
import '../../features/presentation/blocs/auth/auth_bloc.dart' as _i8;
import '../../features/presentation/cubits/login/login_cubit.dart' as _i17;
import '../../features/presentation/cubits/register/register_cubit.dart'
    as _i18;
import '../router/app_router.dart' as _i4;
import '../utils/progress_indicator.dart' as _i3;
import '../utils/shared_prefs_helper.dart' as _i9;
import 'firebase_module.dart' as _i19;

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
  gh.singleton<_i4.AppRouter>(() => _i4.AppRouter());
  gh.lazySingleton<_i5.FirebaseAuth>(() => firebaseModule.firebaseAuth);
  gh.lazySingleton<_i6.FirebaseFirestore>(() => firebaseModule.firestore);
  await gh.lazySingletonAsync<_i7.SharedPreferences>(
    () => sharedPreferencesModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i8.AuthBloc>(() => _i8.AuthBloc(gh<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i9.SharedPrefsHelper>(
      () => _i9.SharedPrefsHelper(gh<_i7.SharedPreferences>()));
  gh.factory<_i10.AuthRemoteDataSource>(() => _i10.AuthRemoteDataSourceImpl(
        gh<_i5.FirebaseAuth>(),
        gh<_i6.FirebaseFirestore>(),
      ));
  gh.factory<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
        gh<_i10.AuthRemoteDataSource>(),
        gh<_i9.SharedPrefsHelper>(),
      ));
  gh.factory<_i13.RegisterUseCase>(
      () => _i13.RegisterUseCase(gh<_i11.AuthRepository>()));
  gh.factory<_i14.AddUserProfileUseCase>(
      () => _i14.AddUserProfileUseCase(gh<_i11.AuthRepository>()));
  gh.factory<_i15.LoginUseCase>(
      () => _i15.LoginUseCase(gh<_i11.AuthRepository>()));
  gh.factory<_i16.FetchUserProfileUseCase>(
      () => _i16.FetchUserProfileUseCase(gh<_i11.AuthRepository>()));
  gh.factory<_i17.LoginCubit>(() => _i17.LoginCubit(
        gh<_i15.LoginUseCase>(),
        gh<_i16.FetchUserProfileUseCase>(),
        gh<_i5.FirebaseAuth>(),
        gh<_i4.AppRouter>(),
        gh<_i3.ProgressIndicator>(),
      ));
  gh.factory<_i18.RegisterCubit>(
      () => _i18.RegisterCubit(gh<_i13.RegisterUseCase>()));
  return getIt;
}

class _$FirebaseModule extends _i19.FirebaseModule {}

class _$SharedPreferencesModule extends _i9.SharedPreferencesModule {}
