import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/router/app_router.dart';
import 'package:renting_bd/core/router/route_path.dart';
import 'package:renting_bd/core/utils/progress_indicator.dart';
import 'package:renting_bd/core/utils/shared_prefs_helper.dart';
import 'package:renting_bd/core/utils/usecase.dart';
import 'package:renting_bd/features/domain/usecases/profile_usecases/fetch_user_profile_usecase.dart';
import 'package:renting_bd/features/domain/usecases/auth_usecases/login_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final FetchUserProfileUseCase fetchUserProfileUseCase;
  final ProgressIndicator progressIndicator;
  final AppRouter appRouter;
  final FirebaseAuth firebaseAuth;
  final SharedPrefsHelper sharedPrefsHelper;
  LoginCubit(this.loginUseCase, this.fetchUserProfileUseCase, this.firebaseAuth, this.sharedPrefsHelper, this.appRouter,
      this.progressIndicator)
      : super(LoginInitial());

  Future<void> logInWithCredentials(LoginParams params) async {
    await progressIndicator.show();
    final authResponse = await loginUseCase.call(params);

    authResponse.fold((failure) => progressIndicator.showError(error: failure.message), (user) async {
      final profileResponse = await fetchUserProfileUseCase.call(FetUserProfileParams(userId: user?.uid));

      profileResponse.fold((failure) => progressIndicator.showError(error: failure.message), (profile) async {
        if (profile != null) {
          await sharedPrefsHelper.setUserRole(profile.role);
          progressIndicator.dismiss();
          appRouter.router.goNamed(RoutePath.home);
        } else {
          firebaseAuth.currentUser?.delete();
          progressIndicator.showError();
        }
      });
    });
  }
}
